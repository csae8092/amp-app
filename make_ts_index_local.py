import glob
import os

import lxml.etree as ET
from typesense import Client
from typesense.api_call import ObjectNotFound
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm

client = Client({
    'nodes': [{
        'host': '0.0.0.0', # For Typesense Cloud use xxx.a1.typesense.net
        'port': '8108',      # For Typesense Cloud use 443
        'protocol': 'http'   # For Typesense Cloud use https
    }],
    'api_key': 'xyz',
    'connection_timeout_seconds': 2
})

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
for x in tqdm(files, total=len(files)):
    doc = TeiReader(x)
    facs = doc.any_xpath('.//tei:body/tei:div/tei:pb/@facs')
    pages = 0
    for p in facs:
        p_group = f".//tei:body/tei:div/tei:p[preceding-sibling::tei:pb[1]/@facs='{p}']"
        l_group = f".//tei:body/tei:div/tei:lg[preceding-sibling::tei:pb[1]/@facs='{p}']"
        body = doc.any_xpath(p_group)
        body_l = doc.any_xpath(l_group)
        print(body_l)
        pages += 1
        record = {}
        record['id'] = os.path.split(x)[-1].replace('.xml', f".html?page={str(pages)}")
        record['rec_id'] = os.path.split(x)[-1]
        r_title = " ".join(" ".join(doc.any_xpath('.//tei:titleStmt/tei:title[@level="a"]/text()')).split())
        record['title'] = f"{r_title} Page {str(pages)}"
        try:
            date_str = doc.any_xpath('//tei:origin/tei:origDate/@notBefore')[0]
        except IndexError:
            date_str = "1000"
        try:
            record['year'] = int(date_str[:4])
        except ValueError:
            pass
        record['persons'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:person/tei:persName[1]')
        ]
        record['places'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:place[@xml:id]/tei:placeName[1]')
        ]
        record['orgs'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:org[@xml:id]/tei:orgName[1]')
        ]
        record['works'] = [
            " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:listBibl//tei:bibl[@xml:id]/tei:title[1]')
        ]
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

make_index = client.collections['amp'].documents.import_(records)
print(make_index)
print('done with indexing amp')
