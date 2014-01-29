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
{
    "categories": [
        {
            "id": "1.3.0",
            "desc": "Version 1.3.0",
            "subcategories": [
                {
                    "id": "linux_64",
                    "desc": "Build for Linux 64 bits",
                    "items": [
                        {
                            "id": "library 1",
                            "status": "success",
                            "build_log": "test 0: ok",
                            "build_log_format": "clear_text",
                            "date": "2013-10-10_10:15:15"
                        },
                        {
                            "id": "library 2",
                            "status": "fail",
                            "build_log": "test 1: ko"
                            "build_log_format": "clear_text",
                            "date": "2013-10-10_10:15:15"
                        },
                        {
                            "id": "program",
                            "status": "warning",
                            "build_log": "test 2: ko"
                            "build_log_format": "clear_text",
                            "date": "2013-10-10_10:15:15"
                        }
                    ]
                },
                {
                    "id": "linux_32",
                    "desc": "Build for Linux 32 bits",
                    "items": [
                        {
                            "id": "library 1",
                            "status": "success",
                            "build_log": "test 0: ok"
                            "build_log_format": "clear_text",
                            "date": "2013-10-10_10:15:15"
                        },
                    ]
                }
            ]
        },
        {
            "id": "1.3.1",
            "desc": "Version",
            "subcategories": [
                ...
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


api version 1.0
---------------


| URL                                           | Verb    | Descrition                                                                |
|-----------------------------------------------|---------|---------------------------------------------------------------------------|
| /api/v1.0/cistatus/                           | GET     | List all categories                                                       |
| /api/v1.0/cistatus/:cat                       | GET     | List all sub-categories of category ':cat'                                |
| /api/v1.0/cistatus/:cat?count=n               | GET     | List 'n' last build of each items belonging to category ':cat'            |
| /api/v1.0/cistatus/:cat/:subcat               | GET     | List all items in sub-category ':subcat' of category ':cat'               |
| /api/v1.0/cistatus/:cat/:subcat?count=n       | GET     | List 'n' last build of all items belonging to sub-category ':cat/:subcat' |
| /api/v1.0/cistatus/:cat/:subcat/:item         | GET     | Display items ':item' in sub-category ':subcat' of category ':cat'        |
| /api/v1.0/cistatus/:cat                       | POST    | Create the category ':cat'                                                |
| /api/v1.0/cistatus/:cat/:subcat               | POST    | Create the sub-category ':subcat' of category ':cat'                      |
| /api/v1.0/cistatus/:cat/:subcat/:item         | POST    | Create items ':item' in sub-category ':subcat' of category ':cat'         |
| /api/v1.0/cistatus/:cat                       | PUT     | Alter the category ':cat'                                                 |
| /api/v1.0/cistatus/:cat/:subcat               | PUT     | Alter the sub-category ':subcat' of category ':cat'                       |
| /api/v1.0/cistatus/:cat/:subcat/:item         | PUT     | Alter items ':item' in sub-category ':subcat' of category ':cat'          |
| /api/v1.0/cistatus/:cat                       | DELETE  | Alter the category ':cat'                                                 |
| /api/v1.0/cistatus/:cat/:subcat               | DELETE  | Alter the sub-category ':subcat' of category ':cat'                       |
| /api/v1.0/cistatus/:cat/:subcat/:item         | DELETE  | Alter items ':item' in sub-category ':subcat' of category ':cat'          |
