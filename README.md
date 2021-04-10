<a href="LICENSE.md">
<img src="https://unlicense.org/pd-icon.png" alt="Public Domain" align="right"/>
</a>

# Bitemporal SQL example

An example of SQL schema and functions for bitemporal domains.

Try it:
```
$ ./run
```

## Schema

| Column         | Type      | Function       |
|----------------|-----------|----------------|
| `key`          | text      | primary key    |
| `created_at`   | timestamp | primary key    |
| `effective_at` | timestamp | primary key    |
| `value`        | integer   | satellite data |

## Expected output

The `run` script executes two queries:
- All the underlying, raw data (table `example_p`)
- The latest effective data (view `example_latest`)
- The effective data as of 2021-02-02 (procedure `example_as_of`)

## Reading

* [_Bitemporal History_](https://martinfowler.com/articles/bitemporal-history.html)
