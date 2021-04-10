<a href="LICENSE.md">
<img src="https://unlicense.org/pd-icon.png" alt="Public Domain" align="right"/>
</a>

# Bitemporal SQL example

An example of SQL [schemata](./docker-entrypoint-initdb.d/00-schemata.sql),
[views](./docker-entrypoint-initdb.d/01-views.sql), and
[functions](./docker-entrypoint-initdb.d/02-funcs.sql) for bitemporal domains.

Try it:

```
$ ./run
```

The only dependencies of this project are Bash and Docker.

## Schema

| Column         | Type      | Function       |
|----------------|-----------|----------------|
| `key`          | text      | primary key    |
| `value`        | integer   | satellite data |
| `applies_to`   | timestamp | primary key    |
| `effective_at` | timestamp | primary key    |

**NB** &mdash; Taken together, `key`, `applies_to`, and `effective_at` are 
the primary key of a row.  There is no `id` column; the three are sufficient.

## Expected output

The `run` script executes these queries ordering by `key`, `applies_to`,
and `effective_at`:

- All the underlying, raw data (table `example_p`)
- The latest effective data (view `example_latest`)
- The effective data as of 2021-02-02 (function `example_as_of`)

```
Raw data ('example_p'):
 key | value |     applies_to      |    effective_at     
-----+-------+---------------------+---------------------
 A   |     3 | 2021-02-01 00:00:00 | 2021-02-01 00:00:00
 A   |     4 | 2021-02-01 00:00:00 | 2021-02-02 00:00:00
 A   |     2 | 2021-02-01 00:00:00 | 2021-02-03 00:00:00
 B   |    17 | 2021-02-01 00:00:00 | 2021-02-01 00:00:00
(4 rows)

Latest effective values ('example_latest'):
 key | value |     applies_to      
-----+-------+---------------------
 A   |     2 | 2021-02-01 00:00:00
 B   |    17 | 2021-02-01 00:00:00
(2 rows)

Effective values as of a 2021-02-02 ('example_as_of'):
 key | value |     applies_to      
-----+-------+---------------------
 A   |     4 | 2021-02-01 00:00:00
 B   |    17 | 2021-02-01 00:00:00
(2 rows)
```

## Reading

* [_Bitemporal
  History_](https://martinfowler.com/articles/bitemporal-history.html)
