CREATE TABLE category (
    cat_id           CHAR(16)    NOT NULL,
    cat_display_name CHAR(32)    DEFAULT NULL,
    description      TEXT        DEFAULT NULL,
    PRIMARY KEY(cat_id)
);

CREATE TABLE subcategory (
    subcat_id           CHAR(16)    NOT NULL,
    subcat_display_name CHAR(32)    DEFAULT NULL,
    description         TEXT        DEFAULT NULL,
    cat_id              CHAR(16)    NOT NULL,
    PRIMARY KEY (subcat_id, cat_id),
    FOREIGN KEY (cat_id) REFERENCES category (cat_id) 
);

CREATE TABLE item (
    item_id             CHAR(16)    NOT NULL,
    item_display_name   CHAR(32)    DEFAULT NULL,
    description         TEXT        DEFAULT NULL,
    subcat_id           CHAR(16)    NOT NULL,
    cat_id              CHAR(16)    NOT NULL,
    PRIMARY KEY (subcat_id, cat_id, item_id),
    FOREIGN KEY (cat_id) REFERENCES category (cat_id),
    FOREIGN KEY (subcat_id) REFERENCES subcategory (subcat_id)
);

CREATE TABLE build (
    item_id             CHAR(16)    NOT NULL,
    subcat_id           CHAR(16)    NOT NULL,
    status              CHAR(16)    NOT NULL,
    cat_id              CHAR(16)    NOT NULL,
    log_format          CHAR(16)    DEFAULT NULL,
    log                 BLOB,
    date                timestamp   NOT NULL CURRENT_TIMESTAMP,
    FOREIGN KEY (cat_id) REFERENCES category (cat_id),
    FOREIGN KEY (subcat_id) REFERENCES subcategory (subcat_id)
    FOREIGN KEY (item_id) REFERENCES item (item_id)
    PRIMARY KEY (subcat_id, cat_id, item_id, date),
);
