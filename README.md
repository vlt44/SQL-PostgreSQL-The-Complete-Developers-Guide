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

## Project: [Simple - But Powerful - SQL Statements](/Project1/SQLstatements.sql)

### Objective

- Fundamentals
- Filtering Records

#### What Tables Should We Make?

- Common features (like authentication, comments, etc) are frequently built with conventional table names and columns

- What type of resources exist in your app? Create a separate table for each of these features

- Features that seem to indicate a relationship or ownership between two types of resources need to be reflected in our table design

#### Four Relationships

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

## Project: [Photo Sharing DB](/Project2/photosDB_comments.sql)

### Objective

- Working with Tables
- Relating Records with Joins
- Aggregation of Records

| Tables   | Description              |
| -------- | ------------------------ |
| users    | Data related to users    |
| photos   | Data related to photos   |
| comments | Data related to comments |
| likes    | Data related to likes    |

<br/>

![JOIN CHEATSHEET](joins_cheatsheet.png)

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

#### Grouping

- Reduces many rows down to fewer rows
- Done by using the `GROUP BY` keyword
- Visualizing the result is key to use

#### Aggregation

- Words like 'most', 'average', 'least' are a sign that you need to use an aggregation
- Looks at many rows and calculates a single value
- Done by using aggregate functions

### SQL Query Execution Order

Although we write SQL queries in a different order, the database processes them in the following logical sequence:

| Clause             | Purpose                                                          |
| ------------------ | ---------------------------------------------------------------- |
| `FROM`             | Specifies the starting set of rows (the source table).           |
| `JOIN`             | Merges data from additional tables.                              |
| `WHERE`            | Filters individual rows before grouping.                         |
| `GROUP BY`         | Groups rows that share the same values.                          |
| `HAVING`           | Filters the groups created by `GROUP BY`.                        |
| `SELECT`           | Chooses which columns or expressions to return.                  |
| `ORDER BY`         | Sorts the final result set.                                      |
| `LIMIT` / `OFFSET` | Restricts the number of rows returned and optionally skips rows. |

#### Logical Processing Order

```text
FROM
  ↓
JOIN
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
ORDER BY
  ↓
LIMIT / OFFSET
```

#### LIMIT

- Limits the number of rows returned by a query
- Useful when working with large datasets
- Often used with `ORDER BY`

#### OFFSET

- Skips a specified number of rows before returning results
- Often used together with `LIMIT`
- Commonly used for pagination

#### Operation

`UNION`: Join together the results of two queries and remove duplicate rows

`UNION ALL`: Join together results of two queries

`INTERSECT`: Find the rows common in the results of two queries. Remove duplicates

`INTERSECT ALL`: Find the rows common in the results of two queries

`EXCEPT`: Find the rows that are present in first query but not second query. Remove duplicates

`EXCEPT ALL`: Find the rows that are present in first query but not second query

`UNION` = OR  
`INTERSECT` = AND  
`EXCEPT` = NOT

## Project: [Working with Large Datasets](/Project3/ecommerce.sql)

### Objective

- Sorting Records
- Union and Intersection with Sets
- Assembling Queries with SubQueries
- Selcting Distinct Records
- Utility Operators, Keywords, and Functions

<br/>

| Operator in the WHERE clause | Structure of data the subquery must return |
| ---------------------------- | ------------------------------------------ |
| `>`                          | Single value                               |
| `<`                          | Single value                               |
| `>=`                         | Single value                               |
| `<=`                         | Single value                               |
| `=`                          | Single value                               |
| `<>` or `!=`                 | Single value                               |
| `IN`                         | Single column                              |
| `NOT IN`                     | Single column                              |

<br/>

| Operator in the WHERE clause | Structure of data the subquery must return |
| ---------------------------- | ------------------------------------------ |
| `> ALL/SOME/ANY`             | Single column                              |
| `< ALL/SOME/ANY`             | Single column                              |
| `>= ALL/SOME/ANY`            | Single column                              |
| `<= ALL/SOME/ANY`            | Single column                              |
| `= ALL/SOME/ANY`             | Single column                              |
| `<> ALL/SOME/ANY`            | Single column                              |

<br/>

| If your WHERE clause uses...          | Your subquery must return... |
| ------------------------------------- | ---------------------------- |
| `>`, `<`, `>=`, `<=`, `=`, `<>`, `!=` | A single value               |
| `IN`, `NOT IN`                        | A single column              |
| `ALL`, `SOME`, `ANY`                  | A single column              |

## Project: [Postgres](/Project4/validations.sql)
