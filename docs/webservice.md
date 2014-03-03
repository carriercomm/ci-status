# Webservice documentation #

NOTICE: WORK IN PROGRESS

## Resources tree ##

#### explaination ####

* level 1 [category]: main categorie, like, for example a project
* level 2 [item]: item, for example a given library
* level 2 [target]: build target, for example Linux x86, Linux PPC...
* level 4 [build]: build of a given item 
* level 5 [test]: unit test result of a build 

## Webservice resources ##

### Common between versions ###

|      url       | Verb |         Description         |
|----------------|------|-----------------------------|
| /api/:version/ | GET  | List available api versions |


#### API version 1.0 ####

##### Methods #####

| URL                                        | Verb   | Description                                                       |
|--------------------------------------------|--------|-------------------------------------------------------------------|
| /api/v1.0/                                 | GET    | List all categories                                               |
| /api/v1.0/:cat/                            | GET    | List all items of '/:cat'                                         |
| /api/v1.0/:cat/:item/                      | GET    | List all targets of '/:cat/:item'                                 |
| /api/v1.0/:cat/:item/:target/              | GET    | List all builds of '/:cat/:item/:target'                          |
| /api/v1.0/:cat/:item/:target/:build/       | GET    | List all tests of ':item/:target/:build'                          |
| /api/v1.0/:cat/:item/:target/:build/:test/ | GET    | Display  test ':item/:target/:build/:test'                        |
| /api/v1.0/:cat/                            | POST   | Create category  ':cat'                                           |
| /api/v1.0/:cat/:item/                      | POST   | Create item of '/:cat/:item'                                      |
| /api/v1.0/:cat/:item/:target/              | POST   | Create target '/:cat/:item/:target'                               |
| /api/v1.0/:cat/:item/:target/:build        | POST   | Create build '/:cat/:item/:target/:build'                         |
| /api/v1.0/:cat/:item/:target/:build/:test/ | POST   | Display ':item/:target/:build/:test'                              |
| /api/v1.0/:cat/                            | PUT    | Alter category ':cat'                                             |
| /api/v1.0/:cat/:item/                      | PUT    | Alter item '/:cat/:item'                                          |
| /api/v1.0/:cat/:item/:target/              | PUT    | Alter target '/:cat/:item/:target'                                |
| /api/v1.0/:cat/                            | DELETE | Delete category ':cat'                                            |
| /api/v1.0/:cat/:item/                      | DELETE | Delete item '/:cat/:item'                                         |
| /api/v1.0/:cat/:item/:target/              | DELETE | Delete target '/:cat/:item/:target'                               |
| /api/v1.0/:cat/:item/:target/:build/       | DELETE | Delete build ':item/:target/:build/:test'                         |

##### query string #####

Resources accept query string parameters:

* Each resource can be filtered to only give a selection of fields:

Positive fields list (white list mode):

```
?fields=category(displayName,desc,item),item(displayName,desc,target),target(displayName,build),build(status,test),test(log)
````

Negative fields list (black list mode):

```
?nofields=category(desc),item(desc),target(desc,build)

```

You cannot use Positive filter and Negative filter simultaneously.

* You apply a filter:

?filter=test(status='KO')

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
?depth=item
```

From the leaf:
```
?rdepth=item
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
  "cat": [
     {
     "id": "my_awesome_project",
     "displayName": "My awesome project",
     "status": "OK",
     "item": [
        {
        "id": "lib_1",
        "displayName": "The first library",
        "status": "OK",
        "target": [
          {
          "id": "linux64",
          "displayName": "Linux x86_64",
          "status": 'OK',
          "build": [ 
            {
                "id": "1",
                "date": "2014-02-06T07:06:00+00:00",
                "status": "OK",
                "buildLog": "build: ok",
                "date": "2014-02-06T07:06:00+00:00",
                "test": [
                    "status": "OK",
                    "testLog": "test 1: ok",
                ],
            },
          ],
          },
        ],
        },
     ],
     },
  ],
}
```
