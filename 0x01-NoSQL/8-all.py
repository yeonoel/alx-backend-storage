#!/usr/bin/env python3
"""mongodb with python using pymongo"""


def list_all(mongo_collection):
    """ List all documents in python """
    documents = mongo_collection.find()

    if documents.count() == 0:
        return []
    return documents
