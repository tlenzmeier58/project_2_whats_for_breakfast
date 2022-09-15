-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "tbl_countries" (
    "country" varchar(50)   NOT NULL,
    "country_code" char(3)   NOT NULL,
    "region" varchar(50)   NOT NULL,
    "continent" varchar(25)   NOT NULL,
    CONSTRAINT "pk_tbl_countries" PRIMARY KEY (
        "country_code"
     )
);

CREATE TABLE "tbl_year" (
    "year" int   NOT NULL,
    CONSTRAINT "pk_tbl_year" PRIMARY KEY (
        "year"
     )
);

CREATE TABLE "tbl_item" (
    "item_name" varchar(125)   NOT NULL,
    "item_type" varchar(50)   NOT NULL,
    CONSTRAINT "pk_tbl_item" PRIMARY KEY (
        "item_name"
     )
);

CREATE TABLE "tbl_crops" (
    "crop_id"  SERIAL  NOT NULL,
    "country_code" char(3)   NOT NULL,
    "item_name" varchar(125)   NOT NULL,
    "item_type" varchar(50)   NOT NULL,
    "year" int   NOT NULL,
    "item_unit" varchar(25)   NOT NULL,
    "value" decimal(10,2)   NOT NULL,
    CONSTRAINT "pk_tbl_crops" PRIMARY KEY (
        "crop_id"
     )
);

CREATE TABLE "tbl_livestock" (
    "livestock_id"  SERIAL  NOT NULL,
    "country_code" char(3)   NOT NULL,
    "item_name" varchar(50)   NOT NULL,
    "item_type" varchar(50)   NOT NULL,
    "year" int   NOT NULL,
    "item_unit" varchar(25)   NOT NULL,
    "value" decimal(10,2)   NOT NULL,
    CONSTRAINT "pk_tbl_livestock" PRIMARY KEY (
        "livestock_id"
     )
);

CREATE TABLE "tbl_population" (
    "population_id"  SERIAL  NOT NULL,
    "country" varchar(50)   NOT NULL,
    "country_code" char(3)   NOT NULL,
    "year" int   NOT NULL,
    "population" int   NOT NULL,
    CONSTRAINT "pk_tbl_population" PRIMARY KEY (
        "population_id"
     )
);

ALTER TABLE "tbl_crops" ADD CONSTRAINT "fk_tbl_crops_country_code" FOREIGN KEY("country_code")
REFERENCES "tbl_countries" ("country_code");

ALTER TABLE "tbl_crops" ADD CONSTRAINT "fk_tbl_crops_item_name" FOREIGN KEY("item_name")
REFERENCES "tbl_item" ("item_name");

ALTER TABLE "tbl_crops" ADD CONSTRAINT "fk_tbl_crops_year" FOREIGN KEY("year")
REFERENCES "tbl_year" ("year");

ALTER TABLE "tbl_livestock" ADD CONSTRAINT "fk_tbl_livestock_country_code" FOREIGN KEY("country_code")
REFERENCES "tbl_countries" ("country_code");

ALTER TABLE "tbl_livestock" ADD CONSTRAINT "fk_tbl_livestock_item_name" FOREIGN KEY("item_name")
REFERENCES "tbl_item" ("item_name");

ALTER TABLE "tbl_livestock" ADD CONSTRAINT "fk_tbl_livestock_year" FOREIGN KEY("year")
REFERENCES "tbl_year" ("year");

ALTER TABLE "tbl_population" ADD CONSTRAINT "fk_tbl_population_country_code" FOREIGN KEY("country_code")
REFERENCES "tbl_countries" ("country_code");

