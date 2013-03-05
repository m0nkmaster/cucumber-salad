# Cucumber Salad

Cucumber Salad is a gem for use at the BBC for testing our applications with cucumber.

##Device Support

Cucumber Salad makes it easy to test using multiple devices using the same steps.

For example:

```gherkin_en
Feature: Using a device
  Given I am using a smartphone
```

You would then use the use_device method for selecting a pre defined driver:

```ruby
Then /^I am using a smartphone$/ do
  use_device(:smartphone)
```

This then allows you to override the device driver using the command line

```
smartphone=iphone bundle exec cucumber
```

If the driver you are trying to use is not defined then you will be given instructions on how to create one.

The predefined drivers are as follows:

* Desktop - firefox - Selenium Webdriver
* Tablet - ipad - Poltergiest
* Smartphone - iphone - Poltergiest
* Feature Phone - blackberry - Poltergiest