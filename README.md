===== GAME OF TONER =====

Share old toners with other organizations.

Work in progress

=== Installation ===

```bash
git clone git@github.com:donapieppo/got.git
bundle install 
```
set `GOT_DATABASE_PASSWORD` in ENV (see
`config/database.yml`). For example put
`export GOT_DATABASE_PASSWORD='verysecurepasswordtochange'`
in `.bashrc`

Now load the database schema.

```bash
rake db:schema:load
```

Before starting rails change 
`config/initializers/got.rb`







