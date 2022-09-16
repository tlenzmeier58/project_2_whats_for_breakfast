# Project 2 What's For Breakfast?

![captain-crunch-face](https://user-images.githubusercontent.com/67832009/190542019-39a42c6a-184a-4dc6-8623-cd8973592e1c.gif)

**Project Overview:**
For project number two, we decided to use extract data from the World Wealth Bank of the World. This dataset had three seperate files. Crops, livestock, and population. The crop file contains every type of food crop per land area per year in most countries. The livestock file is the similar. The population file holds the population of each country by year. We also brought in a fourth dataset that contains each country and country code and which continent they are on. We transformed each dataset to limit the number of years we were measuring and combined the population dataset with the crop and livestock dataset through the country code on the countries dataset. Finally we loaded our data into the tables we created on postgreSQL. 

**Team member names:**
Thomas Lenzmeier, Jacob McManaman, Rafael Lewis

**Datafiles links:**
crop dataset: https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank?resource=download&select=crop1.csv
livestock dataset: https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank?resource=download&select=live1.csv
population dataset: https://www.kaggle.com/datasets/pranav941/-world-food-wealth-bank?resource=download&select=pop1.csv
countries dataset: https://statisticstimes.com/geography/countries-by-continents.php


**Database we plan to use:**
postgreSQL


**Instructions:**
1. Clone the repo from GitHub. This assumes the user has the link to the repo.
1. Download the csv files from the links above. 
1. Copy the files to your repo.
1. Open a Jupyter Notebook from gtibash. 
1. Ensure that the proper dependencies are imported.
1. Create a postgreSQL database and execute the sql script for creating the necessary tables.
1. Execute the code in pandas.
1. Go back to PGAdmin and run desired queries.
1. ie: run the following code
``select b.country
	, a.year
	, a.population
	, c.item_name
	, c.item_type
	, c.value

from tbl_population a
join tbl_countries b on b.country_code = a.country_code
join tbl_livestock c on c.country_code = b.country_code and c.year = a.year
order by b.country, a.year``
