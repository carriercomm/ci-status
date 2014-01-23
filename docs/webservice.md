Webservice documentation
########################

NOTICE: WORK IN PROGRESS

Resources tree
==============

explaination
------------

* level 1 [category]: main categorie, like, for example a version number
* level 2 [sub-category]: sub-category inside a main category, for example a build target
* level 3 [item]: final object, for example a build result

json representation
-------------------

```json
{
    "categories": [
        {
            "id": "1.3.0",
            "subcategories": [
                {
                    "id": "linux_64",
                    "items": [
                        {
                            "id": "library 1",
                            "status": "success",
                            "build_log": "test 0: ok",
                            "date": "2013-10-10_10:15:15"
                        },
                        {
                            "id": "library 2",
                            "status": "fail",
                            "build_log": "test 1: ko"
                            "date": "2013-10-10_10:15:15"
                        },
                        {
                            "id": "program",
                            "status": "warning",
                            "build_log": "test 2: ko"
                            "date": "2013-10-10_10:15:15"
                        }
                    ]
                },
                {
                    "id": "linux_32",
                    "items": [
                        {
                            "id": "library 1",
                            "status": "success",
                            "build_log": "test 0: ok"
                            "date": "2013-10-10_10:15:15"
                        },
                    ]
                }
            ]
        },
        {
            "id": "1.3.1",
            "subcategories": [
            ]
        }
    ]
}
```

Webservice resources
====================

common between versions
-----------------------



|      url       |         Description         |
|----------------|-----------------------------|
| /api/:version/ | List available api versions |


api version 1
-------------


| url                                          | Descrition |
|----------------------------------------------|-|
| /api/v1/cistatus/                            | List all categories |
| /api/v1/cistatus/:cat                        | List all sub-categories of category ':cat' |
| /api/v1/cistatus/:cat#latest                 | List all items of category ':cat' |
| /api/v1/cistatus/:cat/:subcat                | List all items in sub-category ':subcat' of category ':cat' |
| /api/v1/cistatus/:cat/:subcat#          | List all items in sub-category ':subcat' of category ':cat' |
| /api/v1/cistatus/:cat/:subcat/:item          | List all items in sub-category ':subcat' of category ':cat' |



