# Project 2 What's For Breakfast?

![captain-crunch-face](https://user-images.githubusercontent.com/67832009/190542019-39a42c6a-184a-4dc6-8623-cd8973592e1c.gif)

## Project Overview:
For project number two, we decided to use extract data from the World Wealth Bank of the World. This dataset has three seperate files. Crops, livestock, and population. 

The crops csv contains every type of food crop per land area per year, as well as the harvested amount, and the amount produced in tonnes, in most countries. The livestock csv contains similar information suited for livestock animals. The population csv contains the population of each country by year. 

We also brought in a fourth dataset that contains each country and country code and which continent they are on. 

We transformed each dataset to limit the number of years we were measuring and combined the population dataset with the crop and livestock dataset through the country code on the countries dataset. Finally we loaded our data into the tables we created on postgreSQL. 

## Main Files in this Repo

|Notebooks  | Description |
| ------------- | ------------- |
| [csv Trimming](csv_trimming.ipynb)  | The notebook containing an initial import and trim of the larger datasets. Rendered redundant as the code was moved into the main working notebook. Kept for documenting our steps. |
| [Working](working.ipynb)  | This notebook contains all of the pandas code for the ETL done in Jupyter Notebook, ordered by Extraction, Transformation, and Loading. | 
| [Technical Report](Technical%20report.ipynb)  | The report we created explaining our ETL processes and results. |

|Database Script | Description |
| ------------- | ------------- |
| [PostgreSQL Schema](PostgreSQL_Schema.mssql)  | The script needed to create the schema for loading of data to the database. |



## Dataset links

[World Food Wealth Bank Kaggle](https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank)

- Crop dataset: [World Food Wealth Bank crops1.csv](https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank?resource=download&select=crop1.csv)

- Livestock dataset: [World Food Wealth Bank live1.csv](https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank?resource=download&select=live1.csv)

- Population dataset: [World Food Wealth Bank pop1.csv](https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank?resource=download&select=pop1.csv)

[Countries by Countinents website used for dataset](https://statisticstimes.com/geography/countries-by-continents.php)


## Software used

[PostgreSQL](https://www.postgresql.org/)

[Jupyter Notebook](https://jupyter.org/#:~:text=Jupyter%20Notebook%3A%20The%20Classic%20Notebook%20Interface)

## Instructions
1. Clone the repo from GitHub. This assumes the user has the link to the repo.
1. Download the csv files from the `World Food Wealth Bank` links above. 
1. The downloaded.csv files **must** be put in the [data](project_2_whats_for_breakfast/data) folder.
1. Open a Jupyter Notebook. 
1. Ensure that the proper dependencies are imported. If the notebook does not run ensure you are in an appropriate Python enviroment. 
1. Create a postgreSQL database. The database in code is referenced as `captain_crunch`, therefore you must also name your database this. If you desire a different database name you must also change the name in [working.ipynb](project_2_whats_for_breakfast/working.ipynb) under 'Create Database Connection`.
2. Execute the sql script for creating the necessary tables.
3. Execute the code in pandas.
4. Go back to PGAdmin and run desired queries.
5. ie: run the following code
```
select b.country
	, a.year
	, a.population
	, c.item_name
	, c.item_type
	, c.value

from tbl_population a
join tbl_countries b on b.country_code = a.country_code
join tbl_livestock c on c.country_code = b.country_code and c.year = a.year
order by b.country, a.year
```
---

**Team member names:**
Thomas Lenzmeier, Jacob McManaman, Rafael Lewis

---

### References

##### [1] Pune, Maharashtra, 2022, August, 🍕🐔FOOD WEALTH Bank🏦of the World🌍, [Version 3]. Retrieved September 13th 2022, from [https://www.kaggle.com/datasets/gpreda/covid-world-vaccination-progress](https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank) 

##### [2] StatisticsTimes. (2019, October 22). List of countries by continent. List of Countries by Continent - StatisticsTimes.com. Retrieved September 13, 2022, from [https://statisticstimes.com/geography/countries-by-continents.php](https://statisticstimes.com/geography/countries-by-continents.php)
