Hello folks and @eileencodes

I was trying the Horizontal sharding and couldn't go through this. Thanks for your job anyway 👍

### Steps to reproduce
``` shell
git clone https://github.com/alpracka/sharding_migrations
cd sharding_migrations && bundle
bin/rails db:create
bin/rails db:migrate
```

### Expected behavior
Migrations should be finished on all databases.

### Actual behavior
Migration with data changing script is not finished and goes to zombie mode.

Few notes:
- No matter if the script is written like reversible block or def up/down methods.
- PostgreSQL:
It just hangs out like on the gif below.
- SQLite:
It seems to work **but** doesn't work if there are some records in the database. But it seems to be a different issue as `reset_column_information` doesn't work in this case 🤷‍♂️.
- MySQL:
All migrations are finished **but** the data changing script is performed only on the primary database because all Animal records in the primary_shard_one database have nil value of the attribute `lives`.

### System configuration
**Rails version**: 6.1.4 (I also tried the main branch with same results)

**Ruby version**: 3.0.1

![alt text](https://timi.cz/system/sharding_migrations.gif "Demo")
