
## Model

```
$ rails generate model Observation user:references place:string date:date
```

Creates the model file `app/models/observation.rb`, as well as a database migration file, which is equivalent to creating the migration separately and filling the generated migration file as follows:

```
$ rails generate migration create_observation
```

```ruby
create_table :observations do |t|
  t.references :scope, foreign_key: true
  t.string :place
  t.date :date

  t.timestamps
end
```

When wanting to create the database on a different system, run `rake db:schema:load` instead of running all migrations.
