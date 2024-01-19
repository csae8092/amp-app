import glob
import os

# import lxml.etree as ET
# from typesense import Client
# from typesense.api_call import ObjectNotFound
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm

# client = Client({
#     'nodes': [{
#         'host': '0.0.0.0', # For Typesense Cloud use xxx.a1.typesense.net
#         'port': '8108',      # For Typesense Cloud use 443
#         'protocol': 'http'   # For Typesense Cloud use https
#     }],
#     'api_key': 'xyz',
#     'connection_timeout_seconds': 2
# })

files = glob.glob('./data/editions/*/*.xml')

# try:
#     client.collections['amp'].delete()
# except ObjectNotFound:
#     pass

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

# client.collections.create(current_schema)


def get_entities(ent_type, ent_node, ent_name):
    entities = []
    e_path = f'.//tei:rs[@type="{ent_type}"]/@ref'
    for p in body:
        ent = p.xpath(e_path, namespaces={'tei': "http://www.tei-c.org/ns/1.0"})
        ref = [ref.replace("#", "") for e in ent if len(ent) > 0 for ref in e.split()]
        for r in ref:
            p_path = f'.//tei:{ent_node}[@xml:id="{r}"]//tei:{ent_name}[1]'
            en = doc.any_xpath(p_path)
            if en:
                entity = " ".join(" ".join(en[0].xpath(".//text()")).split())
                if len(entity) != 0:
                    entities.append(entity)
                else:
                    with open("log-entities.txt", "a") as f:
                        f.write(f"{r} in {record['id']}\n")
    return [ent for ent in sorted(set(entities))]


records = []
for x in tqdm(files, total=len(files)):
    doc = TeiReader(xml=x, xsl='./xslt/preprocess_typesense.xsl')
    facs = doc.any_xpath(""".//tei:body/tei:div//tei:pb/@facs""")
    pages = 0
    for v in facs:
        p_group = f""".//tei:body/tei:div/tei:p[preceding-sibling::tei:pb[1]/@facs='{v}']|
                      .//tei:body/tei:div/tei:lg[preceding-sibling::tei:pb[1]/@facs='{v}']|
                      .//tei:body/tei:div/tei:div/tei:ab[preceding-sibling::tei:pb[1]/@facs='{v}']|
                      .//tei:body/tei:div/tei:div/tei:div[preceding-sibling::tei:pb[1]/@facs='{v}']"""
        body = doc.any_xpath(p_group)
        pages += 1
        record = {}
        record['id'] = os.path.split(x)[-1].replace('.xml', f".html?page={str(pages)}")
        record['rec_id'] = os.path.split(x)[-1]
        r_title = " ".join(" ".join(doc.any_xpath('.//tei:titleStmt/tei:title[@level="a"]/text()')).split())
        record['title'] = f"{r_title} Page {str(pages)}"
        try:
            date_str = doc.any_xpath('//tei:origin/tei:origDate/@notBefore')[0]
        except IndexError:
            date_str = doc.any_xpath('//tei:origin/tei:origDate/text()')[0]
            data_str = date_str.split("--")[0]
            if len(date_str) > 3:
                date_str = date_str
            else:
                date_str = "1959"

        try:
            record['year'] = int(date_str[:4])
        except ValueError:
            pass

        if len(body) > 0:
            # get unique persons per page
            ent_type = "person"
            ent_name = "persName"
            record['persons'] = get_entities(ent_type=ent_type, ent_node=ent_type, ent_name=ent_name)
            # get unique places per page
            ent_type = "place"
            ent_name = "placeName"
            record['places'] = get_entities(ent_type=ent_type, ent_node=ent_type, ent_name=ent_name)
            # get unique orgs per page
            ent_type = "org"
            ent_name = "orgName"
            record['orgs'] = get_entities(ent_type=ent_type, ent_node=ent_type, ent_name=ent_name)
            # get unique bibls per page
            ent_type = "lit_work"
            ent_name = "title"
            ent_node = "bibl"
            record['works'] = get_entities(ent_type=ent_type, ent_node=ent_node, ent_name=ent_name)
            record['full_text'] = "\n".join(" ".join("".join(p.itertext()).split()) for p in body)
            if len(record['full_text']) > 0:
                records.append(record)
                print(record['id'])
                print(len(record['full_text']))

# make_index = client.collections['amp'].documents.import_(records)
# print(make_index)
print('done with indexing amp')
