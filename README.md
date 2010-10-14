# remotest

## what for?

remotest is a sinatra web app to provide a  GUI for any testing framework that you may want to use. It is intended to be ran locally, just a web page in your web browser.

## how?

Each GET request to '/'  will rerun the tests and render the results, with the apropriate colored bar and some fancy css.

The results are parsed from the output of the command used to make the tests and, therefore, an implementation for this parser should be provided.

## something more?

The output is an html file with delicous ids and classes which can be used to enhance the experience using css and javascript 

## why?

We're running a programming dojo from time to time in my university and it would be really cool to have a GUI for testing, like the one we have with Java, but for any language that might come along.

This is my attempt at solving this problem.

## Drivers available

In the current moment we have (poor) support for these frameworks

* simplectest (C)
* unittest (Python)

### How to build my own drivers?

A driver is any object that has a call method, with this signature:

    .call (stdout , stderr , exitstatus ) => [ {:test => "test description" :passed => true/false , :cause => "describe the failure"}, ... ]

stdout and stderr are regular strings and exitstatus is a number, therefore you can use it to parse the results of your command and return an array of the tests. Don't hesitate to look at the source code for the C and Python drivers. 

### Configuration

The config file is a simple yaml file that must be provided when remotest is started. If not present it'll load `config.yml`.
