# GAME OF TONER 

Give old toners to other organizations.

!!! Work in progress !!!

## Installation 

```bash
git clone git@github.com:donapieppo/got.git
bundle install 
```

Create the database `got` and `got_test` and
set `GOT_DATABASE_PASSWORD` in ENV (see
`config/database.yml`) for `got` user

For example put
`export GOT_DATABASE_PASSWORD='verysecurepasswordtochange'`
in `.bashrc`

Now load the database schema.

```bash
rake db:schema:load
```

Before starting rails copy example configuraition  
`cp config/initializers/got_example.rb config/initializers/got.rb`
and change for your use.

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










