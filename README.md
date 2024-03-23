# Rails API

This API is created based on [Le Wagon workshop for Rails API](https://github.com/dmbf29/rails-api-tutorial/tree/master?tab=readme-ov-file)

## 1. Create the Application
```
rails new NAME_OF_YOUR_APPLICATION -d postgresql --api
```

With the --api flag, there are 3 main differences:
* It configure application with a more limited set of middleware than normal. It will not create any middleware that are useful for browser applications (like cookie support) by default.
* Make ```ApplicationController``` inherit from ```ActionController::API``` instead of ```ActionController::Base```. As with middleware, this will leave out any Action Controller modules that provide functionalities primarily used by browser applications.
* It configure generators to skip generating views, helpers, and assets when you generate a new resource.


## 2. Create Github Repository
```gh repo create rails-cafe-api --public --source=.```

## 3. Designing the DB
In this repo, it just has a ```cafe``` model.

* ```title```: string
* ```address```: string
* ```picture```: string (not using ActiveStorage for simplicity)
* ```hours```: hash
* ```criteria```: array

## 4. Creating the Model
```rails db:create```

```rails g model cafe title:string address:string picture:string hours:jsonb criteria:string```
