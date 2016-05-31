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
your organization.

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

## The database

Two words about the database:

### Organizations

Departments/Organizations/Bunkers you name it. In Unibo
are just organizational units each with its own 
money to buy toners.

### vendors

Just a list of vendors (HP, Kyocera...)

### printer_models and toner_models

Common to all organizations are printer_models

```sql
vendor_id
name
...
```

and toner_models

```sql
vendor_id
name
```

### association table between printer_models and toner_models

printer_models_toner_models

is the table with `printer_model_id` and 
`toner_model_id` so that whe have

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

Every organization has a list of printers and
toners. The toners are supposed to be obsolete
for the organization (usually the printer is broken 
or dismissed). 
The toners can be required from other organizations.

To help identifing the toner your organization can
ask other organizations there is the list
of printers.

Example: 










