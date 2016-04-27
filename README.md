# GAME OF TONER 

Share old toners with other organizations.

Work in progress

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









