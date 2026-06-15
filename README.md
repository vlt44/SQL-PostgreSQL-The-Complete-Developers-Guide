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

### Project 1: Simple - But Powerful - SQL Statements

- keywords (do something)
- identifier (what to act on)
- column name
- column data type

```
CREATE TABLE cities (
   name VARCHAR(50),
   country VARCHAR(50),
   population INTERGER,
   area INTERGER
);
```
