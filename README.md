# README
```
██████╗░░█████╗░░██████╗███████╗░█████╗░░█████╗░███╗░░░███╗██████╗░
██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗████╗░████║██╔══██╗
██████╦╝███████║╚█████╗░█████╗░░██║░░╚═╝███████║██╔████╔██║██████╔╝
██╔══██╗██╔══██║░╚═══██╗██╔══╝░░██║░░██╗██╔══██║██║╚██╔╝██║██╔═══╝░
██████╦╝██║░░██║██████╔╝███████╗╚█████╔╝██║░░██║██║░╚═╝░██║██║░░░░░
╚═════╝░╚═╝░░╚═╝╚═════╝░╚══════╝░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░
```
<a href="https://basecamp-production-02e2.up.railway.app">Link to the project</a><br/>
This project is clone of the project BASECAMP
This project uses bootstrap, gem devise for authorization and database POSTGRESQL

* Ruby version
  Ruby: 3.0.2

* Database creation
Change db from postgresql to sqlite3
```
rails db:system:change --to=sqlite3
rails db:migrate
```

* Installation
  ```
    bundle install
    rails server
  ```
