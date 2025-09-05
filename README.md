# Checkout

This app is an exercise for making a CLI app in Ruby that can hold configurations and business logic

# How to run

There are two ways to test it:
1. Run the CLI application with `./cli.rb <COMMAND> <ARGS>` 
    The current commands supported commands are
    1.1 `calculate <ARGS>` calculates items and the final price with e.g.: `./cli.rb calculate GR1 GR1`
    1.2 `version` prints the version of the cli

2. Start an interactive controller with `bundle exec rake console` 
```ruby
co = Checkout.new(pricing_rules)
co.scan(item)
co.scan(item)
price = co.total
```


Items can be one of following:
| Product Code | Name         | Price  |
|--------------|--------------|--------|
| GR1          | Green tea    | £3.11  |
| SR1          | Strawberries | £5.00  |
| CF1          | Coffee       | £11.23 |

And to scan them, use the Product Code
