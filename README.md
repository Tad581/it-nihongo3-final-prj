# README

### Tech
1. Frontend and Backend: Ruby on Rails
2. Database: sqlite

### Features
1. Create/Edit account
2. Post/Comment
3. Add/Delete friend
4. Chat
### Required
1. Ruby version > 3.0
2. Rails version > 7
3. Redis-server

To install redis-server on ubuntu run
```sh
    sudo apt install redis-server
```

 **Search Google to know how to install Redis-server in other environment**

###  How to run
```sh
    bundle install
```

```sh
    rails db:migrate
```

Now your app is ready

To start your app run
```sh
rails s
```

Open terminal and run
```sh
redis-server
```

If it notice that redis-server is already run, it's ok

Server run in **localhost:3000**
