# Salesforceintegration

salesforceintegration is a gem that permit to create Leads on the Salesforce

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'salesforceintegration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install salesforceintegration

## Usage

First you need to create a salesforce instance:

```ruby
salesforceintegration = SalesforceIntegration::SalesforceIntegrationLead.new("client_id", "client_secret", "host", "username", "password")
```
* client_id and client_secret: See this [link](https://auth0.com/docs/connections/social/salesforce)
* host: Use login.salesforce.com or test.salesforce.com if using a sandbox
* username and password: Use a salesforce developer edition account

##Creating a Lead

After salesforceintegration initialized you only need pass the lead's data

```ruby
salesforceintegration.create_lead_on_salesforce("first_name", "last_name", "email", "company", "job_title", "phone", "website")
```
This method returns the lead's ID

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/karlamaria/salesforceintegrationGem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

