# Rails API

This API is created based on [Le Wagon workshop for Rails API](https://github.com/dmbf29/rails-api-tutorial/tree/master?tab=readme-ov-file)
...Complete tutorial is available [here](https://slides.trouni.com/?src=https://raw.githubusercontent.com/dmbf29/rails-api-tutorial/master/README.md#/)

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
```
rails db:create
```

```
rails g model cafe title:string address:string picture:string hours:jsonb criteria:string
```

And also when we create the ```criteria``` array, we're actually specifying a string at first. But we'll have to update the migration (before we migrate) to indicate we're using an array:
```
t.string :criteria, array: true
```

Then run the migration and our DB should be ready to go.
```
rails db:migrate
```

## 5. Setting up the Model
```
# cafe.rb
validates :title, presence: true
validates :address, presence: true
validates :title, uniqueness: { scope: :address }
```

## 6. Seeds
We were basing our data on around [this information](https://gist.github.com/yannklein/5d8f9acb1c22549a4ede848712ed651a) already so we've got a JSON that we can use in our seeds.
1. We'll open that link using open-uri
2. Turn the JSON result into a Ruby array
3. Iterate over the array and create an instance of a cafe for each hash in the array.

How to seed the DB is not this repo's focus, so the code is already set in ```db/seeds.rb``` file.

Run the seeds ```rails db:seed``` and have a look in the ```rails console```.



