# What is jQuery? (srsly?)
A fast and concise Javascript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions. More information and documentation can be found at jQuery home page.

# What is jQuery Taconite Plugin?
A lightweight Javascript Framework that allows you to easily make multiple DOM updates using the results of a single AJAX call. More information and examples can be found at jQuery Taconite Plugin home page.

# What is Sharp Taconite?
A c# class that allows you to create taconite response xml server side like this:

	Taconite taconite = new Taconite(writer);
    	taconite
       	.Select("#header").ReplaceContent.With("Hello").FadeIn(450)
        	.Select("#left").ReplaceContent.With(mainNavigationControl)
        	.Select("#center").ReplaceContent.With("Home sweet home!").Hide().SlideDown("1000")
        	.Evaluate(" alert('Done!'); ");

# Why is this useful?
Imagine building a dynamic page that features two forms. Updating both forms will require:

- Executing two ajax requests
- Executing two queries to the database
- Returning two rendered controls
- Processing response and manipulating DOM with custom scripts

Using taconite plugin in the same scenario will result in:

- Executing single ajax request
- Executing one or two queries to the database
- Returning rendered controls within a taconite xml
- Automatic processing and DOM manipulation

In scenarios using multiple controls which may share data the advantages are even bigger.
