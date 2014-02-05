CREATE TABLE category (
    cat_id           CHAR(16)    NOT NULL,
    cat_display_name CHAR(32)    DEFAULT NULL,
    description      TEXT        DEFAULT NULL,
    PRIMARY KEY(cat_id)
);

CREATE INDEX cat_id_c    ON category (cat_id);



CREATE TABLE subcategory (
    subcat_id           CHAR(16)    NOT NULL,
    subcat_display_name CHAR(32)    DEFAULT NULL,
    description         TEXT        DEFAULT NULL,
    cat_id              CHAR(16)    NOT NULL,
    PRIMARY KEY (subcat_id, cat_id),
    FOREIGN KEY (cat_id) REFERENCES category (cat_id)
);

CREATE INDEX subcat_id_s ON subcategory (subcat_id);
CREATE INDEX cat_id_s    ON subcategory (cat_id);

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

CREATE INDEX item_id_i   ON item (item_id);
CREATE INDEX subcat_id_i ON item (subcat_id);
CREATE INDEX cat_id_i    ON item (cat_id);

CREATE TABLE build (
    item_id             CHAR(16)    NOT NULL,
    subcat_id           CHAR(16)    NOT NULL,
    status              CHAR(16)    NOT NULL,
    cat_id              CHAR(16)    NOT NULL,
    log_format          CHAR(16)    DEFAULT NULL,
    log                 BLOB        DEFAULT NULL,
    date                timestamp   DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (subcat_id, cat_id, item_id, date),
    FOREIGN KEY (item_id) REFERENCES item (item_id),
    FOREIGN KEY (subcat_id) REFERENCES subcategory (subcat_id),
    FOREIGN KEY (cat_id) REFERENCES category (cat_id)
);

CREATE INDEX item_id_b   ON build (item_id);
CREATE INDEX subcat_id_b ON build (subcat_id);
CREATE INDEX cat_id_b    ON build (cat_id);
CREATE INDEX date_b      ON build (date);


/*
    FOREIGN KEY (item_id) REFERENCES item (item_id)
    FOREIGN KEY (subcat_id) REFERENCES subcategory (subcat_id),
*/
