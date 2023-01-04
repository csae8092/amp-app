import glob
import os

from typesense.api_call import ObjectNotFound
from acdh_cfts_pyutils import TYPESENSE_CLIENT as client
from acdh_cfts_pyutils import CFTS_COLLECTION
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm


files = glob.glob('./data/editions/*/*.xml')


try:
    client.collections['amp'].delete()
except ObjectNotFound:
    pass

current_schema = {
    'name': 'amp',
    'fields': [
        {
            'name': 'id',
            'type': 'string'
        },
        {
            'name': 'rec_id',
            'type': 'string'
        },
        {
            'name': 'title',
            'type': 'string'
        },
        {
            'name': 'full_text',
            'type': 'string'
        },
        {
            'name': 'year',
            'type': 'int32',
            'optional': True,
            'facet': True,
        },
        {
            'name': 'persons',
            'type': 'string[]',
            'facet': True,
            'optional': True
        },
        {
            'name': 'places',
            'type': 'string[]',
            'facet': True,
            'optional': True
        },
        {
            'name': 'orgs',
            'type': 'string[]',
            'facet': True,
            'optional': True
        },
        {
            'name': 'works',
            'type': 'string[]',
            'facet': True,
            'optional': True
        }
    ]
}

client.collections.create(current_schema)

def get_entities(ent_type, ent_node, ent_name):
    entities = []
    for p in body:
        e_path = f'.//tei:rs[@type="{ent_type}"]/@ref'
        ent = p.xpath(e_path, namespaces={'tei': "http://www.tei-c.org/ns/1.0"})
        if len(ent) > 0:
            for r in ent:
                multiRef = r.split()
                for i in multiRef:
                    i = i.replace('#', '')
                    p_path = f'.//tei:{ent_node}[@xml:id="{i}"]//tei:{ent_name}[1]'
                    en = doc.any_xpath(p_path)
                    if en:
                        entity = " ".join(" ".join(en[0].xpath(".//text()")).split())
                        if len(entity) != 0:
                            entities.append(entity)
    entities = set(entities)
    ent = []
    for x in entities:
        ent.append(x)
    return ent

records = []
cfts_records = []
for x in tqdm(files, total=len(files)):
    doc = TeiReader(xml=x,xsl='./xslt/preprocess_typesense.xsl')
    facs = doc.any_xpath('.//tei:body/tei:div/tei:pb/@facs')
    pages = 0
    for p in facs:
        p_group = f".//tei:body/tei:div/tei:p[preceding-sibling::tei:pb[1]/@facs='{p}']|.//tei:body/tei:div/tei:lg[preceding-sibling::tei:pb[1]/@facs='{p}']"
        body = doc.any_xpath(p_group)
        pages += 1
        cfts_record = {
            'project': 'amp',
        }
        record = {}
        record['id'] = os.path.split(x)[-1].replace('.xml', f".html?page={str(pages)}")
        cfts_record['id'] = record['id']
        cfts_record['resolver'] = f"https://auden-musulin-papers.github.io/amp-app-dev/{record['id']}"
        record['rec_id'] = os.path.split(x)[-1]
        cfts_record['rec_id'] = record['rec_id']
        r_title = " ".join(" ".join(doc.any_xpath('.//tei:titleStmt/tei:title[@level="a"]/text()')).split())
        record['title'] = f"{r_title} Page {str(pages)}"
        cfts_record['title'] = record['title']
        try:
            date_str = doc.any_xpath('//tei:origin/tei:origDate/@notBefore')[0]
        except IndexError:
            date_str = "1000"

        try:
            record['year'] = int(date_str[:4])
            cfts_record['year'] = int(date_str[:4])
        except ValueError:
            pass

        if len(body) > 0:
            # get unique persons per page
            ent_type = "person"
            ent_name = "persName"
            record['persons'] = get_entities(ent_type=ent_type, ent_node=ent_type, ent_name=ent_name)
            cfts_record['persons'] = record['persons']
            # get unique places per page
            ent_type = "place"
            ent_name = "placeName"
            record['places'] = get_entities(ent_type=ent_type, ent_node=ent_type, ent_name=ent_name)
            cfts_record['places'] = record['places']
            # get unique orgs per page
            ent_type = "org"
            ent_name = "orgName"
            record['orgs'] = get_entities(ent_type=ent_type, ent_node=ent_type, ent_name=ent_name)
            cfts_record['orgs'] = record['orgs']
            # get unique bibls per page
            ent_type = "lit_work"
            ent_name = "title"
            ent_node = "bibl"
            record['works'] = get_entities(ent_type=ent_type, ent_node=ent_node, ent_name=ent_name)
            cfts_record['works'] = record['works']
            record['full_text'] = ""
            for p in body:
                l = " ".join(''.join(p.itertext()).split())
                record['full_text'] += f" {l}"
            if len(record['full_text']) > 0:
                records.append(record)
                cfts_record['full_text'] = record['full_text']
                cfts_records.append(cfts_record)
            # record['full_text'] = " ".join(''.join(body.itertext()).split())

make_index = client.collections['amp'].documents.import_(records)
print(make_index)
print('done with indexing amp')

make_index = CFTS_COLLECTION.documents.import_(cfts_records, {'action': 'upsert'})
print(make_index)
print('done with cfts-index amp')