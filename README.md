# Backable

A little gem for supporting back history in your applicaton. 
It uses a simple request-parameter 'back' with every back-path separated with a '|'.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'backable'
```

And then execute:
```bash
$ bundle
```


## Usage

To use this plugin. You can build up the backable stack via the controller method `backable_push`.
To pass the history to the next page remember to use `backable_url_for` instead of `url_for`. 


### controller


```ruby
class FooBarsController < ApplicationController

  def index
    backable_push([:foo_bars])			#< push the back-url. This can be a string url
    ..
  end

  def update
    @foo_bar = FooBar.find(params[:id])
    if @foo_bar.update(params[:foo_bar])
      redirect_to backable_back_path, notice: "Data is saved"
    end
  end

end
```

Available controller methods:

| Method              | description                         
| ------------------- | ---
| backable_push       | Pushes the given url to the stack
| backable_url_for    | url_for replacement which includes the 'back' parameter
| backable_back_path  | Returns the path to the previous page
|                     | 
| backable_param      | Returns the back parameter for the given stack (internal method)
| backable_history    | Returns and array of the previous paths
| backable_future     | Returns the future paths (pushed on the stack in this request)



### views

To make this all work you need to replace all links in your application (link_to) to `backable_link_to`

```erb
<%= backable_link_to( [:edit, @item]) %>
```

To use this with buttons etc.. there's also the `backable_url_for` method


You can simple add a back-button via `backable_link_to_back`. This link goes back to previous page in the stack.

```erb
<%= backable_link_to_back %>
```


To remember your back-stack in forms you should use the `backable_form_item`

```erb
<%= backable_form_item %>
```


Available view-helper methods:

| Method                | description                         
| --------------------- | ---
| backable_url_for      | url_for replacement which includes the 'back' parameter
| backable_back_path    | Returns the path to the previous page
| backable_form_item    | A hidden form element that includes the 'back' parameter 
| backable_link_to      | link_to replacement which includes the 'back' parameter
| backable_link_to_back | A link_to call to the previous page (including the text t(backable.back))
|                       | 
| backable_history      | Returns and array of the previous paths
| backable_future       | Returns the future paths (pushed on the stack in this request)


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
