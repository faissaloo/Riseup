# Riseup  
>A gem for gangweeders to create simple markup languages  
[![Build Status](https://travis-ci.org/faissaloo/Riseup.svg?branch=master)](https://travis-ci.org/faissaloo/Riseup)  

The specification for a new markup language is created as follows:  
```
require 'riseup'
Riseup::Spec.new([
	#Here "*" is togglable, "<i>" replaces it when it is toggled on and "</i>" replaces it when it is toggled off
	["*","<i>","</i>"],
	#Here ":smile:" is replaced by ":)" wherever it occurs
	[":smile:",":)"]])
```

In order to use your spec to parse a string:  
```
Riseup::Parser.new(string_to_parse, spec)
```  

Also if my code looks like I wrote it on a phone it's because I did.
