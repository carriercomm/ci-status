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
| /api/v1.0/:cat/:subcat               | GET    | List all items in category ':cat/:subcat'                         |
| /api/v1.0/:cat/:subcat/:item         | GET    | Display item ':item' in category ':cat/:subcat'                   |
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

##### query string #####

Resources accept query string parameters:

* Each resource can be filtered to only give a selection of fields:

Positive filter:

```
?fields=categories(displayName,Desc,subcategories),subcategories(displayName,Desc,items),items(displayName,build),build(status)
````

Negative filter:

```
?nofields=categories(desc),subcategories(desc),items(desc),build(buildLog,buildLogFormat)

```

You cannot use Positive filter and Negative filter simultaneously.

* Each resource can be paginated:

```
?size=<int>&offset=<int>
```

size is number the depther type of object to display. For example if 'items' is this type, and 'size' is set to
'20', it will display 20 'items' regardless of the number of 'categories/subcategories'
  
At the root of the returned object, a field `lastPage` is set to `1` if it is the last page, `0` otherwise.

* Each resource can be filtered to only display a certain depth:

From the root:
```
?depth=subcategories
```

From the leaf:
```
?rdepth=subcategories
```
The same behaviour could be achieved with the filters, but you may find depth more convinient.

* Each resource except build can be filter to display only 'n' last builds of each item.

```
?buildcount=1
```

##### JSON sample #####

```json
{
    "lastPage" : "1",
    "categories": [
        {
            "id": "1.3.0",
            "displayName": "V1.3.0",
            "desc": "Version 1.3.0 of My project",
            "subcategories": [
                {
                    "id": "linux_64",
                    "displayName": "Linux 64 bits",
                    "desc": "Build for Linux 64 bits",
                    "items": [
                        {
                            "id": "library_1",
                            "desc": "Library 1",
                            "build": [ 
                                {
                                    "status": "OK",
                                    "buildLog": "test 0: ok",
                                    "buildLogFormat": "text",
                                    "date": "2014-02-06T07:06:00+00:00",
                                },
                                {
                                    "status": "KO",
                                    "buildLog": "test 0: KO",
                                    "buildLog_format": "gzip",
                                    "date": "2014-02-06T07:07:00+00:00"
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
