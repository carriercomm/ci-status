# Database #

NOTICE: WORK IN PROGRESS

## Databases supported ##

* sqlite
* postgres
* mysql

## Database schema ##

### category table ###


| Field                | Type             | Null | Key | Default | Extra             |
|----------------------|------------------|------|-----|---------|-------------------|
| cat_id               | CHAR(16)         | NO   | PRI | NULL    |                   |
| cat_display_name     | CHAR(32)         | YES  |     | NULL    |                   |
| description          | TEXT             | YES  |     | NULL    |                   |

### subcategory table ###

| Field                | Type             | Null | Key | Default | Extra             |
|----------------------|------------------|------|-----|---------|-------------------|
| subcat_id            | CHAR(16)         | NO   | PRI | NULL    |                   |
| subcat_display_name  | CHAR(32)         | YES  |     | NULL    |                   |
| description          | TEXT             | YES  |     | NULL    |                   |
| cat_id               | CHAR(16)         | NO   | FOR | NULL    |                   |

### items table ###

| Field                | Type             | Null | Key | Default | Extra             |
|----------------------|------------------|------|-----|---------|-------------------|
| item_id              | CHAR(16)         | NO   | PRI | NULL    |                   |
| item_display_name    | CHAR(32)         | YES  |     | NULL    |                   |
| description          | TEXT             | YES  |     | NULL    |                   |
| cat_id               | CHAR(16)         | NO   | FOR | NULL    |                   |
| subcat_id            | CHAR(16)         | NO   | FOR | NULL    |                   |

### build table ###

| Field                | Type             | Null | Key | Default | Extra             |
|----------------------|------------------|------|-----|---------|-------------------|
| status               | CHAR(16)         | NO   |     | NULL    |                   |
| log_format           | CHAR(16)         | YES  |     | NULL    |                   |
| log                  | BLOB             | YES  |     | NULL    |                   |
| date                 | timestamp        | NO   |     | NULL    | CURRENT_TIMESTAMP |
| item_id              | CHAR(16)         | NO   | FOR | NULL    |                   |
| subcat_id            | CHAR(16)         | NO   | FOR | NULL    |                   |
| cat_id               | CHAR(16)         | NO   | FOR | NULL    |                   |   

