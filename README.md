# remotest

## what for?

remotest is a sinatra web app to provide a  GUI for any testing framework that you may want to use. It is intended to be ran locally, just a web page in your web browser.

## how?

Each GET request to '/'  will rerun the tests and render the results, with the apropriate colored bar and some fancy css.

The results are parsed from the output of the command used to make the tests and, therefore, an implementation for this parser should be provided.

## something more?

The output is an html file with delicous ids and classes which can be used to enhance the experience using css and javascript 

## why?

We're running a programming dojo from time to time in my university and we would really like a nice GUI for testing, like the one we have with Java, but with any language we might come along.

This is my attempt at solving this problem.

## Drivers available

In the current moment we have (poor) support for these frameworks

* simplectest (C)
* unittest (Python)

