# DKV - A DynamoDB Key-value client

This provides a simple, DynamoDB-backed key value store suitable for use in AWS environments.

## Installation

```bash
gem install dkv
```

## Usage

Once installed, we assume a working AWS-environment based setup (at a min, access key id, secret key and region) and work
as is.

With that in place,:

* `dkv init [table-name]`: Creates a new table with the specified table name.
* `dkv set [table-name] [key] [value]`: Set key in the given table to value.
* `dkv get [table-name] [key]`: Get the value with the given key, exit with status 1 if not found.
* `dkv clear [table-name] [key]`: Remove the given key (and it's attached value).

## Implementation Details

We use (and provision) a dynamodb table with 1 read unit and 1 write unit, and with a single hash key on `DataKey`.

All values are stored in `DataValue` and we do very simple operations.
