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

![JOIN CHEATSHEET](./Project2/joins_cheatsheet.png)

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

## Project: [PostgreSQL](/Project4/validations.sql)

### Objective

- pgAdmin
- Complex Data Types
- Database-Side Validation & Constraints

### Complex Data Types

#### Numeric Types Fast Rules

- `id` column of any table -> mark column as `serial`
- number w/out intergere -> mark column as `interger`
- number w/ decimal -> mark column as `numeric` \*weight of decimal important
- number w/ decimal -> mark column as `double precision` \*weight of decimal not important

#### Numbers without any decimal points

| Data Type  | Range                                            |
| ---------- | ------------------------------------------------ |
| `smallint` | `-32768` to `+32767`                             |
| `integer`  | `-2147583648` to `2147483647`                    |
| `bigint`   | `-9223372036854775808` to `+9223372036854775807` |

#### No decimal point, auto increment

| Data Type     | Range                        |
| ------------- | ---------------------------- |
| `smallserial` | `1` to `32767`               |
| `serial`      | `1` to `2147483647`          |
| `bigserial`   | `1` to `9223372036854775807` |

#### Number with decimal points

| Data Type          | Range / Precision                                       |
| ------------------ | ------------------------------------------------------- |
| `decimal`          | `131072` digits before decimal point, `16383` after     |
| `numeric`          | `131072` before decimal point, `16383` after            |
| `real`             | `1E-37` to `1E37` with at least `6` places precision    |
| `double precision` | `1E-307` to `1E308` with at least `15` places precision |
| `float`            | Same as `real` or `double precision`                    |

#### Numeric Types Fast Rules

| If you need to...                                                                       | Use                |
| --------------------------------------------------------------------------------------- | ------------------ |
| `'id'` column of any table                                                              | `serial`           |
| Need to store a number without a decimal                                                | `integer`          |
| Need to store a number **with a decimal and this data needs to be very accurate**       | `numeric`          |
| Need to store a number **with a decimal and the decimal doesn't make a big difference** | `double precision` |

#### Character Types

| Data Type     | Description                                                                      |
| ------------- | -------------------------------------------------------------------------------- |
| `CHAR(5)`     | Store some characters, length will always be `5` even if PG has to insert spaces |
| `VARCHAR`     | Store any length of string                                                       |
| `VARCHAR(40)` | Store a string up to `40` characters, automatically remove extra characters      |
| `TEXT`        | Store any length of string                                                       |

#### Boolean Types

| Values                              | Stored As |
| ----------------------------------- | --------- |
| `true`, `yes`, `on`, `1`, `t`, `y`  | `TRUE`    |
| `false`, `no`, `off`, `0`, `f`, `n` | `FALSE`   |
| `null`                              | `NULL`    |

#### Date

All of the following are stored as the same date.

| Input               | Stored As          |
| ------------------- | ------------------ |
| `1980-11-20`        | `20 November 1980` |
| `Nov-20-1980`       | `20 November 1980` |
| `20-Nov-1980`       | `20 November 1980` |
| `1980-November-20`  | `20 November 1980` |
| `November 20, 1980` | `20 November 1980` |

#### Time With Time Zone

| Input          | Stored As     |
| -------------- | ------------- |
| `01:23 AM EST` | `01:23-05:00` |
| `05:23 PM PST` | `17:23-08:00` |
| `05:23 PM UTC` | `17:23+00:00` |

#### Timestamp With Time Zone

| Input                      | Stored As                |
| -------------------------- | ------------------------ |
| `Nov-20-1980 05:23 PM PST` | `1980-11-20 18:23:00-07` |

#### Interval

Think of an interval as a **duration of time**.

| Input         | Stored As                 |
| ------------- | ------------------------- |
| `1 day`       | `1 day`                   |
| `1 D`         | `1 day`                   |
| `1 D 1 M 1 S` | `1 day 1 minute 1 second` |

### Database-Side Validation & Constraints

Row-Level Validation

check for when a row is being inserted/updated

- is value defined
- is a value unique in its column
- is a value >, <, >=, <=, = some other value

Create new database and table
![pgAdmin Create](./Project4/pgAdmin_Create.png)
Insert and update data
![pgAdmin Insert](./Project4/pgAdmin_Insert.png)

## Project: [Design IG](./Project5_DesignIG)

### Objective

- SQL Schema Design Tool
- Database Design Patterns

![IG tables](/Project5_DesignIG/img-designIGtables.png)

### `Likes` System Requirements

- Each user can like a specific post a single time.
- A user should be able to "unlike" a post.
- Need to be able to figure out how many users like a post.
- Need to be able to list which users like a post.
- Something besides a post might need to be liked (comments, maybe?).
- We might want to think about "dislikes" or other kinds of reactions.

#### -Don't Do This! Solution-

Do not add `likes` Column to posts

- Can't ensure a user likes a post only once
- Can't ensure a user can only unlike a post they've liked
- Can't identify which users liked a post
- Can't remove likes when a user is deleted

A `likes` table must be created or build a reactions table instead

![Likes Table](/Project5_DesignIG/img-likesTable.png)
![Reactions Table](/Project5_DesignIG/img-reactionsTable.png)

#### -Polymorphic Association Solution-

- Requires app to determine the meaning of each like
  - A like can be a `post like` or a `comment like`.
- Cannot use foreign key columns - `liked-id` is a plain integer.
- Not recommended, but still commonly used.

![Polymorphic Assoc Table](/Project5_DesignIG/img-polymorphicAssoc.png)
`liked_type` points to a table, `liked_id` points to id in that table

#### -Alternative Polymorphic Association Solution-

#### -Simpliest Solution-

---

### `Mentions` System Requirements

### `Hashtags` System Requirements

### `Followers` System Requirements
