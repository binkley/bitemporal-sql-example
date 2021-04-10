<a href="LICENSE.md">
<img src="https://unlicense.org/pd-icon.png" alt="Public Domain" align="right"/>
</a>

# Bitemporal SQL example

An example of SQL schemata, views, and functions for bitemporal domains.

Try it:
```
$ ./run
```

## Schema

| Column         | Type      | Function       |
|----------------|-----------|----------------|
| `key`          | text      | primary key    |
| `value`        | integer   | satellite data |
| `applies_to`   | timestamp | primary key    |
| `effective_at` | timestamp | primary key    |

## Expected output

The `run` script executes these queries:
- All the underlying, raw data (table `example_p`)
- The latest effective data (view `example_latest`)
- The effective data as of 2021-02-02 (function `example_as_of`)

```
Raw data:
 key | value |     applies_to      |    effective_at     
-----+-------+---------------------+---------------------
 A   |     3 | 2021-02-01 00:00:00 | 2021-02-01 00:00:00
 A   |     4 | 2021-02-01 00:00:00 | 2021-02-02 00:00:00
 A   |     2 | 2021-02-01 00:00:00 | 2021-02-03 00:00:00
 B   |    17 | 2021-02-01 00:00:00 | 2021-02-01 00:00:00
(4 rows)

Latest effective values:
 key | value |     applies_to      
-----+-------+---------------------
 A   |     2 | 2021-02-01 00:00:00
 B   |    17 | 2021-02-01 00:00:00
(2 rows)

Effective values as of 2021-02-02:
 key | value |     applies_to      
-----+-------+---------------------
 A   |     4 | 2021-02-01 00:00:00
 B   |    17 | 2021-02-01 00:00:00
(2 rows)
```

## Reading

* [_Bitemporal History_](https://martinfowler.com/articles/bitemporal-history.html)
