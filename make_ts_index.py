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

records = []
cfts_records = []
for x in tqdm(files, total=len(files)):
    doc = TeiReader(x)
    facs = doc.any_xpath('.//tei:body/tei:div/tei:pb/@facs')
    pages = 0
    for p in facs:
        p_group = f".//tei:body/tei:div/tei:p[preceding-sibling::tei:pb[1]/@facs='{p}']"
        l_group = f".//tei:body/tei:div/tei:lg[preceding-sibling::tei:pb[1]/@facs='{p}']"
        body = doc.any_xpath(p_group)
        body_l = doc.any_xpath(l_group)
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
        record['persons'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:person/tei:persName[1]')
        ]
        cfts_record['persons'] = record['persons']
        record['places'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:place[@xml:id]/tei:placeName[1]')
        ]
        cfts_record['places'] = record['places']
        record['orgs'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:org[@xml:id]/tei:orgName[1]')
        ]
        cfts_record['orgs'] = record['orgs']
        record['works'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:listBibl//tei:bibl[@xml:id]/tei:title[1]')
        ]
        cfts_record['works'] = record['works']
        record['full_text'] = ""
        if len(body) > 0:
            for p in body:
                l = " ".join(''.join(p.itertext()).split())
                record['full_text'] += f" {l}"
        if len(body_l) > 0:
            for p in body_l:
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