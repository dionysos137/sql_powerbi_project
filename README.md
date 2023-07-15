# Pizzaria Sales Analysis

## Introduction
The data set includes a year's worth of sales from a pizzaria located at Ontario, Canada, with additional details on the type, size quantity, price of the pizzas they served. I analyzed its sales data to answer the following questions:
- What is the total sales of this year?
- How many orders were placed during this year?
- How many pizza the resteraunt sold this year?
- How much revenue an order generated on average?
- What are the top 10 most ordered pizza?
- Is their a particular category of pizza that is most popular?
- What are hourly and dayly patterns of the orders and sales?
- How many customers ordered pick-up? How many ordered delivery?
- What is the geographical distribution of the delivery address? Which region generated the most revenue?

## Project details
### Data  
The data is downloaded from [here](https://www.mavenanalytics.io/data-playground?search=pizza) with some modifications like adding random delivery address.
The processed data can be found in the data folder.

### Database normalization
The database is designed by using [QuickDBD](https://www.quickdatabasediagrams.com/) and created in MySQL. 
A diagram of the schema is shown blow. 
![schema](https://github.com/dionysos137/sql_powerbi_project/assets/49093201/5d673d72-3ff7-48dd-bf9d-875c45e570ac)
The SQL script to create the schema is [here](create_database.sql).

### Data import and query
The SQL script to import the data by using the `LOAD DATA INFILE` statement is [here](load_data.sql).
The SQL script for data query and manipulation is [here](query.sql). Its outputs are used in the Power BI visualization.

### Power BI dashboard
The final dashboard can be accessed via this [link](https://app.powerbi.com/view?r=eyJrIjoiYTM2ZGQ0YjgtNWE5NC00YTYzLThmM2EtODEzNDk4MzIxNWMxIiwidCI6IjYwOWZhZWMwLTQwYmYtNDM1YS1hMGU0LTQ4MzQ1YzEyNWM5NSJ9)

