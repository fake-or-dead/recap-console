# Recap::Console

Run `rails (db)console` commands via [`Recap`](https://github.com/freerange/recap)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recap-console', github: 'snipsnap/recap-console'
```

And then execute:

```console
$ bundle
```

## Usage

In your `Capfile`, require the library

```ruby
# Capfile
# ...
require 'recap/tasks/rails/console'
```

Then, to open an interactive remote `rails console`,

```console
$ cap rails:console
```

To open an interactive remote `rails dbconsole`,

```console
$ cap rails:dbconsole
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
