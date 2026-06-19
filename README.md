# SQL & PostgreSQL: The Complete Developer's Guide

A collection of exercises and projects completed while working through Stephen Grider's course, **[SQL and PostgreSQL: The Complete Developer's Guide](https://www.udemy.com/course/sql-and-postgresql/)**.

## Technologies Used

- PostgreSQL
- SQL
- pgAdmin
- Terminal

## Course Objectives

The course focuses on:

- Writing efficient queries to retrieve information
- Designing the schema, or structure, of the database
- Understanding when to use advanced features
- Managing the database in a production environment

## Database Design Process

The course introduces a simple framework for designing relational databases:

1. **Identify the entity**
   - What kind of thing are we storing?

2. **Define the attributes**
   - What properties does that thing have?

3. **Select appropriate data types**
   - What type of data should each property contain?

### What Tables Should We Make?

- Common features (like authentication, comments, etc) are frequently built with conventional table names and columns

- What type of resources exist in your app? Create a separate table for each of these features

- Features that seem to indicate a relationship or ownership between two types of resources need to be reflected in our table design

### Four Relationships

- Many-to-one
- One-to-many
- Many-to-many
- One-to-one

### Primary Key

Uniquely identifies record in a table

- Each row in every table has one primary key
- No other row in the same table can have the same value
- 99% of the time called `id`
- Either an integer or a UUID
- Will never change

### Foreign Key

A foreign key creates a relationship between two tables by referencing the primary key of another table

- Rows only have this if they belong to another record
- Many rows in the same table can have the same foreign key
- Name varies, usually called something like `xyz_id`
- Exactly equal to the primary key of the referenced row
- Will change if the relationship changes

### Joins

- Produces values by merging together rows from different related tables
- Use a join most times that you're asked to find data that involves multiple resources

#### Join Types

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN

Example:

- Find all comments and the users who wrote them
- Find all photos and the users who uploaded them
- Find all likes for a photo

### Aggregation

- Words like 'most', 'average', 'least' are a sign that you need to use an aggregation

JOINS CHEATSHEET
![JOIN CHEATSHEET](joins_cheatsheet.png)

## Project 1

[Simple - But Powerful - SQL Statements](/Project1/SQLstatements.sql)

## Project 2

[Photo Sharing DB](/Project2/)
Database For a Photo-Sharing App

| Tables   | Description              |
| -------- | ------------------------ |
| users    | Data related to users    |
| photos   | Data related to photos   |
| comments | Data related to comments |
| likes    | Data related to likes    |
