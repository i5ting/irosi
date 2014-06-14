# Irosi

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'irosi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install irosi

## Usage


```
Rosi.download do
  for num in 1..8
	item(num)
  end
end
```

or 

```
Rosi.download do
  item(1)
  item(2)
  item(4)
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/irosi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
