# GAME OF TONERS

Give old toners to other organizations.

!!! Work in progress !!!

## Installation 

```bash
git clone git@github.com:donapieppo/got.git
cd got
bundle install 

cp doc/got_example.rb config/initializers/got.rb
```

change `config/initializers/got.rb` according to
your needs.

Create the database `got` and `got_test` and
set `GOT_DATABASE_PASSWORD` and 
`DEVISE_SECRET_KEY` in ENV (see `config/database.yml`) 
for `got` user.

For example put
```bash
export GOT_DATABASE_PASSWORD='verysecurepasswordtochange'`
export SECRET_KEY_BASE_GOT='verysecuresecretkeye71dedghqhjhjqhdhqhdhgwhqverysecureiamreally'
export DEVISE_SECRET_KEY='2ac52c092e4542403ref72104ab7e6a5d9er3db43115b4346da7520428dfec8703451a760ee3e0ed292ab98664e4e642254e94b238cr91e5f3f19r0994c69aa8'
```
in `.bashrc`

Now load the database schema.

```bash
rake db:create
rake db:schema:load
```

and some sample data (vendors like
HP, Dell, Kyocera, printers like
hp 4300)

```
rake got:load_vendors
rake got:load_models
```

## The database

Two words about the database:

### Organizations

Departments/Organizations/Bunkers, you name it. 
In my University are just organizational units each 
with its own money to buy toners.

### vendors

Just a list of vendors (HP, Kyocera...)

### printer_models and toner_models

Common to all organizations are `printer_models`:

```sql
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id        | int(11)      | NO   | PRI | NULL    | auto_increment |
| vendor_id | int(11)      | NO   | MUL | NULL    |                |
| name      | varchar(255) | YES  |     | NULL    |                |
| laser     | tinyint(1)   | YES  |     | NULL    |                |
```

and `toner_models`:

```sql
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int(11)      | NO   | PRI | NULL    | auto_increment |
| vendor_id  | int(11)      | NO   | MUL | NULL    |                |
| name       | varchar(255) | YES  |     | NULL    |                |
| compatible | tinyint(1)   | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
```

### association table between printer_models and toner_models

is done with the table `printer_models_toner_models`

```sql
+------------------+---------+------+-----+---------+-------+
| Field            | Type    | Null | Key | Default | Extra |
+------------------+---------+------+-----+---------+-------+
| printer_model_id | int(11) | NO   | MUL | NULL    |       |
| toner_model_id   | int(11) | NO   | MUL | NULL    |       |
+------------------+---------+------+-----+---------+-------+
```

in order to have

```ruby
class TonerModel < ActiveRecord::Base
  belongs_to :vendor
  has_and_belongs_to_many :printer_models
```

and

```ruby
class PrinterModel < ActiveRecord::Base
  belongs_to :vendor
  has_and_belongs_to_many :toner_models
```

note: vendor in PrinterModel or TonerModel 
do not have to be the same. Xerox for example
makes toners for HP (compatible).

### printers and toners

Every organization has a list of printers and toners. 

`Printers`

```sql
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| id               | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| organization_id  | int(11) unsigned | YES  | MUL | NULL    |                |
| printer_model_id | int(11) unsigned | YES  | MUL | NULL    |                |
| name             | varchar(255)     | YES  |     | NULL    |                |
| description      | text             | YES  |     | NULL    |                |
| rent             | tinyint(1)       | YES  |     | NULL    |                |
+------------------+------------------+------+-----+---------+----------------+
```

`Toners`

```sql 
+-----------------+------------------+------+-----+---------+----------------+
| Field           | Type             | Null | Key | Default | Extra          |
+-----------------+------------------+------+-----+---------+----------------+
| id              | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| organization_id | int(11) unsigned | YES  | MUL | NULL    |                |
| toner_model_id  | int(11) unsigned | YES  | MUL | NULL    |                |
| number          | int(11) unsigned | YES  |     | 0       |                |
| gift            | tinyint(1)       | YES  |     | NULL    |                |
+-----------------+------------------+------+-----+---------+----------------+
```

The toners can be marked as obsolete
for the organization (usually the printer is broken 
or dismissed) by setting true to gift column.

This kind of toners are shown to organizations
with compatible printers can be asked.










