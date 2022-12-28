# HexletCode - Form Generator

### Hexlet tests and linter status:
[![Actions Status](https://github.com/yurivyatkin/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/yurivyatkin/rails-project-lvl1/actions)

This gem can be used to generate HTML forms using a DSL. This DSL follows the guidelines from the project "Form Generator", which is a part of the [Ruby-on-Rails](https://ru.hexlet.io/programs/rails) course, offered by [Hexlet](https://hexlet.io/) (in Russian language only, currently).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code',  git: 'https://github.com/yurivyatkin/rails-project-lvl1'
```

And then execute:

    $ bundle install

## Usage

When the gem is installed, your code will have access to the `HexletCode` class, which provides the method `form_for` for generating HTML code.

The method `form_for` expects at least one mandatory argument, which should be a Ruby object with fields of primitive types (currently, we support only strings).

Here is a basic example.
```Ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```
It will generate the following HTML code:
```HTML
<form action="#" method="post"><input name="name" type="text" value="rob"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>
```

\[Not implemented\] Fields can have additional attributes in a hash as the last parameter:
```Ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
end
```
It generated the following HTML code:
```HTML
<form action="#" method="post"><input name="name" type="text" value="rob" class="user-input"><input name="job" type="text" value=""></form>
``` 

Fields may have default values, which can be overridden. For example, this code
```Ruby
HexletCode.form_for user do |f|
  f.input :job, as: :text
end
```
will generate HTLM with the default values, like so:
```HTML
<form action="#" method="post"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>
```
whereas, specifying the values for the `cols` and `rows` attributes,
```Ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :job, as: :text, rows: 50, cols: 50
end
```
we get the customized HTML snippet:
```HTML
<form action="#" method="post"><textarea cols="50" rows="50" name="job">hexlet</textarea></form>
```

When the `input` method receives a field, which is missing from the base object (the first argument of the `form_for` method), a `NameError` will be raised.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yurivyatkin/rails-project-lvl1.
