# DispatchJs

DispatchJs is a tiny Rails engine that sets up DOM-based Routing. It executes namespaced Javascript per controller and/or action.

The main idea: [http://www.paulirish.com/2009/markup-based-unobtrusive-comprehensive-dom-ready-execution/](http://www.paulirish.com/2009/markup-based-unobtrusive-comprehensive-dom-ready-execution/)

## Usage

Define your controllers and actions on the globalized `APP` object containing the javascript you want to execute for that page:

	APP.posts =
		index: ->
			# Code here is executed on the "posts#index" action
			alert 'Listing all the posts'
		
		show: ->
			# Code here is executed on the "posts#show" action
			alert 'Just one post here…'
		
		another: ->
			# Code here is executed on the "posts#another" action
			alert 'You get the point'

Defining a `default` method will allow you the execute javascript for all actions for a controller:

	APP.posts =
		default: ->
			# Code here is executed on all the "posts" controller's actions
			alert 'You will see me on every posts controller action'
			
Code is executed via jQuery's `$(document).ready(…)` callback, so the DOM should be ready before your code is fired.

You can use wrap code that should be executed on every page in the `APP.common` namespace to get `$(document).ready(…)` for free:

	APP.common =
		default: ->
			# Every page code here
			alert 'This alert happens everywhere'
			
Execution order: `APP.common.default()` -> `APP.someController.default()` -> `APP.someController.someAction()`
		

## Installation

Add this line to your application's Gemfile:

    gem 'dispatch_js', github: 'ajjahn/dispatch_js'
    
Bundle up (You know the deal):

    $ bundle install
    
Add these lines to your application.js before `//= require_tree .` and after `//= require jquery`:

    //= require dispatch
    
Add `<%= dispatch %>` inside your `<body>` tag in your app's layout file:

	<body <%= dispatch %>>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request