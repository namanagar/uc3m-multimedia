#/usr/bin/env python

# import Python's JSON library for its loads() method
import json

# import time for its sleep method
from time import sleep

# use the elasticsearch client's helpers class for _bulk API
from elasticsearch import Elasticsearch, helpers
client = Elasticsearch("localhost:9200")

# define a function that will load a text file
def get_data_from_text_file(self):
    return [l.strip() for l in open(str(self), encoding="utf8", errors='ignore')]

# call the function to get the string data containing docs
docs = get_data_from_text_file("imdb_dataset.json")

# print the length of the documents in the string
print ("String docs length:", len(docs))

# use Python's enumerate() function to iterate over list of doc strings
for num, doc in enumerate(docs):
    try:
        doc = doc.replace("True", "true")
        doc = doc.replace("False", "false")
        dict_doc = json.loads(doc)
        dict_doc["_id"] = num
        doc_list += [dict_doc]
    except json.decoder.JSONDecodeError as err:
        print ("ERROR for num:", num, "-- JSONDecodeError:", err, "for doc:", doc)
        print ("Dict docs length:", len(doc_list))


try:
    print ("\nAttempting to index the list of docs using helpers.bulk()")
    resp = helpers.bulk(client, doc_list, index = "movies", doc_type = "_doc")
    print ("helpers.bulk() RESPONSE:", resp)
    print ("helpers.bulk() RESPONSE:", json.dumps(resp, indent=4))

except Exception as err:
    print("Elasticsearch helpers.bulk() ERROR:", err)

quit()