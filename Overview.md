## What is jQuery? (srsly?) ##

A fast and concise Javascript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions. More information and documentation can be found at jQuery [home page](http://jquery.com).

## What is jQuery Taconite Plugin? ##

A lightweight Javascript Framework that allows you to easily make multiple DOM updates using the results of a single AJAX call. More information and examples can be found at jQuery Taconite Plugin [home page](http://malsup.com/jquery/taconite/#overview).

## What is Sharp Taconite? ##

A c# class that allows you to create taconite response xml server side like this:

```
Taconite taconite = new Taconite(writer);
    taconite
        .Select("#header").ReplaceContent.With("Hello").FadeIn(450)
        .Select("#left").ReplaceContent.With(mainNavigationControl)
        .Select("#center").ReplaceContent.With("Home sweet home!").Hide().SlideDown("1000")
        .Evaluate(" alert('Done!'); ");
```

## Why is this useful? ##

Imagine building a dynamic page that features two forms. Updating both forms will require:
  1. Executing two ajax requests
  1. Executing two queries to the database
  1. Returning two rendered controls
  1. Processing response and manipulating DOM with custom scripts

![http://www.websequencediagrams.com/cgi-bin/cdraw?lz=Vmlldy0-Q29udHJvbGVyOiBHZXQgRm9ybSBBCmFjdGl2YXRlIFZpZXcABAoAJAkKAC4JLT5Nb2RlbAA4BkRhdGEAMgoAFAUKABoFLQBcDVJldHVybgAoBmRlACEPAFAKLT5WaWV3ACYJAIEUBwAmCwCBBQoAgUYGACkGUHJvY2Vzc1xuIHJlc3BvbnNlAFkMAIFMBQCBYRpCAIFPLACBH10AgnYFAIFvDkIAgTlE&s=napkin&n=n.png](http://www.websequencediagrams.com/cgi-bin/cdraw?lz=Vmlldy0-Q29udHJvbGVyOiBHZXQgRm9ybSBBCmFjdGl2YXRlIFZpZXcABAoAJAkKAC4JLT5Nb2RlbAA4BkRhdGEAMgoAFAUKABoFLQBcDVJldHVybgAoBmRlACEPAFAKLT5WaWV3ACYJAIEUBwAmCwCBBQoAgUYGACkGUHJvY2Vzc1xuIHJlc3BvbnNlAFkMAIFMBQCBYRpCAIFPLACBH10AgnYFAIFvDkIAgTlE&s=napkin&n=n.png)

Using taconite plugin in the same scenario will result in:
  1. Executing single ajax request
  1. Executing one or two queries to the database
  1. Returning rendered controls within a taconite xml
  1. Automatic processing and DOM manipulation

![http://www.websequencediagrams.com/cgi-bin/cdraw?lz=Vmlldy0-Q29udHJvbGVyOiBHZXQgRm9ybXMgQSAmIEIKYWN0aXZhdGUgVmlldwAECgApCQoAMwktPk1vZGVsAD0GRGF0YQAyCgAUBQoAGgUtAGENUmV0dXJuACgGZGUAIQ8AUAotPlZpZXcAJgkAgRQMACsLAIEKCgCBUAYALgZQcm9jZXNzXG4gcmVzcG9uc2UAXgxWaWV3IA&s=napkin&n=n.png](http://www.websequencediagrams.com/cgi-bin/cdraw?lz=Vmlldy0-Q29udHJvbGVyOiBHZXQgRm9ybXMgQSAmIEIKYWN0aXZhdGUgVmlldwAECgApCQoAMwktPk1vZGVsAD0GRGF0YQAyCgAUBQoAGgUtAGENUmV0dXJuACgGZGUAIQ8AUAotPlZpZXcAJgkAgRQMACsLAIEKCgCBUAYALgZQcm9jZXNzXG4gcmVzcG9uc2UAXgxWaWV3IA&s=napkin&n=n.png)

In scenarios using multiple controls which may share data the advantages are even bigger.