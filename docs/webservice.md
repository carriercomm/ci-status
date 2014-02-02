# Webservice documentation #

NOTICE: WORK IN PROGRESS

## Resources tree ##

#### explaination ####

* level 1 [category]: main categorie, like, for example a version number
* level 2 [sub-category]: sub-category inside a main category, for example a build target
* level 3 [item]: final object, for example a build result

## Webservice resources ##

### Common between versions ###

|      url       | Verb |         Description         |
|----------------|------|-----------------------------|
| /api/:version/ | GET  | List available api versions |


#### API version 1.0 ####

##### Methods #####

| URL                                  | Verb   | Description                                                       |
|--------------------------------------|--------|-------------------------------------------------------------------|
| /api/v1.0/                           | GET    | List all categories                                               |
| /api/v1.0/:cat                       | GET    | List all sub-categories of category ':cat'                        |
| /api/v1.0/:cat?count=n               | GET    | List 'n' last builds of each items of category ':cat'             |
| /api/v1.0/:cat/:subcat               | GET    | List all items in category ':cat/:subcat'                         |
| /api/v1.0/:cat/:subcat?count=n       | GET    | List 'n' last builds of all items in ':cat/:subcat'               |
| /api/v1.0/:cat/:subcat/:item         | GET    | Display item ':item' in category ':cat/:subcat'                   |
| /api/v1.0/:cat/:subcat/:item?count=n | GET    | List 'n' last builds of item ':item' in category ':cat/:subcat'   |
| /api/v1.0/:cat/:subcat/:item/:build  | GET    | List the build ':build' of item ':cat/:subcat/:item'              |
| /api/v1.0/:cat                       | POST   | Create the category ':cat'                                        |
| /api/v1.0/:cat/:subcat               | POST   | Create the sub-category ':subcat' of category ':cat'              |
| /api/v1.0/:cat/:subcat/:item         | POST   | Create items ':item' in sub-category ':subcat' of category ':cat' |
| /api/v1.0/:cat                       | PUT    | Alter the category ':cat'                                         |
| /api/v1.0/:cat/:subcat               | PUT    | Alter the sub-category ':subcat' of category ':cat'               |
| /api/v1.0/:cat/:subcat/:item         | PUT    | Alter items ':item' in sub-category ':subcat' of category ':cat'  |
| /api/v1.0/:cat                       | DELETE | Erase the category ':cat'                                         |
| /api/v1.0/:cat/:subcat               | DELETE | Erase the sub-category ':subcat' of category ':cat'               |
| /api/v1.0/:cat/:subcat/:item         | DELETE | Erase items ':item' in sub-category ':subcat' of category ':cat'  |

##### JSON sample #####

```json
{
    "categories": [
        {
            "id": "1.3.0",
            "display_name": "V1.3.0",
            "desc": "Version 1.3.0 of My project",
            "subcategories": [
                {
                    "id": "linux_64",
                    "display_name": "Linux 64 bits",
                    "desc": "Build for Linux 64 bits",
                    "items": [
                        {
                            "id": "library_1",
                            "desc": "Library 1",
                            "build": [ 
                                {
                                    "status": "OK",
                                    "build_log": "test 0: ok",
                                    "build_log_format": "clear_text",
                                    "date": "2013-10-10_10:15:15",
                                },
                                {
                                    "status": "KO",
                                    "build_log": "test 0: KO",
                                    "build_log_format": "clear_text",
                                    "date": "2013-10-11_10:15:15"
                                },
                                ...
                            ],
                        },
                        ...
                    ],
                },
                ...
            ]
        },
        ...
    ],
}
```
