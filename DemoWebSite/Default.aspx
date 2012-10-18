<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" StylesheetTheme="Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Demo WebSite</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.ui.js"></script>
        <script type="text/javascript" src="js/json2.js"></script>
        <script type="text/javascript" src="js/jquery.taconite.js"></script>
        <script type="text/javascript" src="js/prettify.js"></script>

        <script type="text/javascript">
            $(document).ready(function()
            {
                prettyPrint();
                $("#tabs").tabs();
                $("button").each(function()
                {
                    var btnId = $(this).attr("id");
                    if (btnId != "ShowExample7" && btnId != "ShowExample8")
                    {
                        $(this).button().click(function()
                        {
                            $.ajax(
                            {
                                type: "post",
                                url: "ControlerService.asmx/" + btnId,
                                data: {},
                                contentType: "application/json; charset=utf-8",
                                cache: false,
                                datatype: "xml"
                            });
                        });
                    }
                    else if (btnId == "ShowExample7")
                    {
                        $(this).button().click(function()
                        {
                            $.ajax(
                            {
                                type: "post",
                                url: "ControlerService.asmx/" + btnId,
                                data: {},
                                contentType: "application/json; charset=utf-8",
                                cache: false,
                                success: function(msg) { $.taconite(msg.d); }
                            });
                        });
                    }
                    else if (btnId == "ShowExample8")
                    {
                        $(this).button().click(function()
                        {
                            $.ajax(
                            {
                                type: "post",
                                url: "ControlerService.asmx/" + btnId,
                                data: {},
                                contentType: "application/json; charset=utf-8",
                                cache: false,
                                success: function() { $('#timer').html('Time to process response document (ms): ' + $.taconite.lastTime); },
                                datatype: "xml"
                            });
                        });
                    }
                });
            });
        </script>
    </head>
    <body>
        <div id="header"><h1>Demo WebSite</h1></div>
        <div id="content">
            <div id="tabs">
	            <ul>
		            <li><a href="#tabs-1">Structure</a></li>
		            <li><a href="#tabs-2">Tables</a></li>
		            <li><a href="#tabs-3">Styling</a></li>
		            <li><a href="#tabs-4">Effects</a></li>
		            <li><a href="#tabs-5">Eval</a></li>
		            <li><a href="#tabs-6">Demo 1</a></li>
		            <li><a href="#tabs-7">Demo 2</a></li>
		            <li><a href="#tabs-8">Performance</a></li>
	            </ul>
	            <div id="tabs-1">
		            <h1>Structure</h1> 
		            <p>This example shows how you can easily manipulate the structure of the DOM. The markup is as follows:</p>
		            <code class="prettyprint lang-xhtml">	
&lt;div id="example1" style="background-color: #ffa; padding:10px; border:1px solid #ccc"&gt;
    This is the &lt;span style="color:#800"&gt;structure example&lt;/span&gt; div.
&lt;/div&gt;	
		            </code>
		            <p>The following code is used to request <em>ShowExample1</em> method:</p>
                    <code class="prettyprint lang-js">
$.ajax({
    type: "post",
    url: "ControlerService.asmx/ShowExample1",
    data: {},
    contentType: "application/json; charset=utf-8",
    cache: false,
    datatype: "xml"
});
                    </code>
                    <p><em>ShowExample1</em> method codebehind looks like this:</p>
                    <code class="prettyprint lang-cs">	
[WebMethod]
[ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
public XmlDocument ShowExample1()
{ 
    using(StringWriter stringWriter = new StringWriter())
    {
        using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
        {
            Taconite taconite = new Taconite(writer);
            taconite
                .Select("#example1")
                .Follow.With("This text will go AFTER the example div.")
                .Precede.With("&lt;div&gt;This div will go BEFORE the example div.&lt;/div&gt;")
                .Append.With("&lt;div&gt;This div is APPENDED&lt;/div&gt;")
                .Select("#example1 span")
                .Wrap.With("&lt;span style=\"border: 1px dashed #00F\"&gt;&lt;/span&gt;");
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(taconite.Output());
            return doc;
        }
    }
}        	
		            </code>
		            <p><button id="ShowExample1">Run example 1</button></p>
		            <hr />
                    <div id="example1" style="background-color: #ffa; padding:10px; border:1px solid #ccc">
                        This is the <span style="color:#800">structure example</span> div.
                    </div>    
	            </div>
	            <div id="tabs-2">
                    <h1>Tables</h1> 
                    <p>This example shows how easy it is to manipulate a table with Taconite. The markup is as follows:</p>
                    <code class="prettyprint lang-xhtml">
&lt;table id="example2" style="background-color: #ffa; padding:10px; border:1px solid #ccc"&gt;
    &lt;thead&gt;
        &lt;tr&gt;&lt;td&gt;one&lt;/td&gt;&lt;td&gt;two&lt;/td&gt;&lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody&gt;
        &lt;tr&gt;&lt;td&gt;A&lt;/td&gt;&lt;td&gt;B&lt;/td&gt;&lt;/tr&gt;
        &lt;tr&gt;&lt;td&gt;C&lt;/td&gt;&lt;td&gt;D&lt;/td&gt;&lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;
                    </code>
                    <p>The following code is used to request <em>example2.xml</em> method:</p>
                    <code class="prettyprint lang-js">
$.ajax({
    type: "post",
    url: "ControlerService.asmx/ShowExample2",
    data: {},
    contentType: "application/json; charset=utf-8",
    cache: false,
    datatype: "xml"
});                    
                    </code>
                    <p><em>ShowExample1</em> method codebehind looks like this:</p>
                    <code class="prettyprint lang-cs">	
[WebMethod]
[ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
public XmlDocument ShowExample1()
{ 
    using(StringWriter stringWriter = new StringWriter())
    {
        using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
        {
            Taconite taconite = new Taconite(writer);
            taconite
                .Select("#example2")
                .Append.With("&lt;tfoot&gt;&lt;tr&gt;&lt;td&gt;Foot-1&lt;/td&gt;&lt;td&gt;Foot-2&lt;/td&gt;&lt;/tr&gt;&lt;/tfoot&gt;")
                .Select("#example2 thead")
                .Replace.With("&lt;thead&gt;&lt;tr&gt;&lt;td&gt;Head-1&lt;/td&gt;&lt;td&gt;Head-2&lt;/td&gt;&lt;/tr&gt;&lt;/thead&gt;")
                .Select("#example2 tbody")
                .Prepend.With("&lt;tr&gt;&lt;td&gt;Body-First&lt;/td&gt;&lt;td&gt;Body-First&lt;/td&gt;&lt;/tr&gt;")
                .Append.With("&lt;tr&gt;&lt;td colspan=\"2\" align=\"center\"&gt;spanned column&lt;/td&gt;&lt;/tr&gt;")
                .Select("#example2 tfoot")
                .Precede.With("&lt;tr&gt;&lt;td&gt;Body-Last&lt;/td&gt;&lt;td&gt;Body-Last&lt;/td&gt;&lt;/tr&gt;");
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(taconite.Output());
            return doc;
        }
    }
}                
                    </code>
                    <p><button id="ShowExample2">Run example 2</button></p>
		            <hr />
                    <table id="example2" style="background-color: #ffa; padding:10px; border:1px solid #ccc"> 
                        <thead> 
                            <tr><td>one</td><td>two</td></tr> 
                        </thead> 
                        <tbody> 
                            <tr><td>A</td><td>B</td></tr> 
                            <tr><td>C</td><td>D</td></tr> 
                        </tbody> 
                    </table> 
                </div> 
	            <div id="tabs-3">
		            <h1>Styling</h1> 
		            <p>This example shows how you can use Taconite to change the presentation of the markup. The markup is as follows:</p>
		            <code class="prettyprint lang-xhtml">
&lt;div id="example3" style="background-color: #ffa; padding:10px; border:1px solid #ccc"&gt; 
    &lt;div&gt;div one&lt;/div&gt; 
    &lt;div&gt;&lt;span&gt;div two&lt;/span&gt;&lt;/div&gt; 
    &lt;div&gt;div three&lt;/div&gt; 
&lt;/div&gt;
		            </code>
		            <p>The following code is used to request <em>ShowExample3</em> method:</p>
                    <code class="prettyprint lang-js">
$.ajax({
    type: "post",
    url: "ControlerService.asmx/ShowExample3",
    data: {},
    contentType: "application/json; charset=utf-8",
    cache: false,
    datatype: "xml"
});
                    </code>
                    <p><em>ShowExample3</em> method codebehind looks like this:</p>
                    <code class="prettyprint lang-cs">	
[WebMethod]
[ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
public XmlDocument ShowExample1()
{ 
    using(StringWriter stringWriter = new StringWriter())
    {
        using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
        {
            Taconite taconite = new Taconite(writer);
            taconite
                .Select("#example3")
                    .Style("backgroundColor", "#80ff80")
                    .Add.Class("special");
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(taconite.Output());
            return doc;
        }
    }
}        	
		            </code>
		            <p><button id="ShowExample3">Run example 3</button></p>
		            <hr />
                    <div id="example3" style="background-color: #ffa; padding:10px; border:1px solid #ccc">
                        This is the <span style="color:#800">structure example</span> div.
                    </div>    
	            </div>
	            <div id="tabs-4">
                    <h1>Effects</h1> 
		            <p>This example shows how you can use jQuery effects with Taconite. The markup is as follows:</p>
		            <code class="prettyprint lang-xhtml">	
&lt;div id="example4" style="display:none; background-color: #ffa; padding:10px; border:1px solid #ccc"&gt; 
    Initially this div is hidden. 
&lt;/div&gt;	
		            </code>
		            <p>The following code is used to request <em>ShowExample4</em> method:</p>
                    <code class="prettyprint lang-js">
$.ajax({
    type: "post",
    url: "ControlerService.asmx/ShowExample4",
    data: {},
    contentType: "application/json; charset=utf-8",
    cache: false,
    datatype: "xml"
});
                    </code>
                    <p><em>ShowExample4</em> method codebehind looks like this:</p>
                    <code class="prettyprint lang-cs">	
[WebMethod]
[ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
public XmlDocument ShowExample4()
{ 
    using(StringWriter stringWriter = new StringWriter())
    {
        using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
        {
            Taconite taconite = new Taconite(writer);
            taconite
                 .Select("#example4")
                    .ReplaceContent.With(@"&lt;pre&gt;lorem ipsum dolor sit amet consectetuer adipiscing elit&lt;/pre&gt;")
                    .SlideDown("1000");
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(taconite.Output());
            return doc;
        }
    }
}        	
		            </code>
		            <p><button id="ShowExample4">Run example 4</button></p>
		            <hr />
                    <div id="example4" style="display:none; background-color: #ffa; padding:10px; border:1px solid #ccc"> 
                        Initially this div is hidden. 
                    </div>
	            </div>
                <div id="tabs-5">
                    <h1>Eval</h1> 
		            <p>This example shows how you can return JavaScript in your command document. The markup is as follows:</p>
		            <code class="prettyprint lang-xhtml">	
&lt;div id="example5" style="background-color: #ffa; padding:10px; border:1px solid #ccc"&gt; 
    Initial content. 
&lt;/div&gt;	
		            </code>
		            <p>The following code is used to request <em>ShowExample5</em> method:</p>
                    <code class="prettyprint lang-js">
$.ajax({
    type: "post",
    url: "ControlerService.asmx/ShowExample5",
    data: {},
    contentType: "application/json; charset=utf-8",
    cache: false,
    datatype: "xml"
});
                    </code>
                    <p><em>ShowExample5</em> method codebehind looks like this:</p>
                    <code class="prettyprint lang-cs">	
[WebMethod]
[ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
public XmlDocument ShowExample1()
{ 
    using(StringWriter stringWriter = new StringWriter())
    {
        using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
        {
            Taconite taconite = new Taconite(writer);
            taconite
                .Select("#example5")
                .Evaluate(@"$('#example5').html('&lt;strong&gt;This is new content!&lt;/strong&gt;'); alert('Content udpated.');");
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(taconite.Output());
            return doc;
        }
    }
}        	
		            </code>
		            <p><button id="ShowExample5">Run example 5</button></p>
		            <hr />
                    <div id="example5" style="background-color: #ffa; padding:10px; border:1px solid #ccc"> 
                        Initial content. 
                    </div>   
	            </div>
	            <div id="tabs-6">
                    <h1>Demo 1</h1> 
		            <p>This page demonstrates many updates at once.</p>
		            <p><button id="ShowExample6">Run example 6</button></p>
		            <hr />
                    <table border="1" cellpadding="10">
                        <tbody>
                            <tr><th>Test</th><th>Description</th><th>Target</th></tr> 
                            <tr> 
                                <td><code>remove</code></td> 
                                <td><div>Content to the right will be removed</div></td> 
                                <td><div class="deleteDiv">This div will be removed</div> 
                                    <div class="deleteDiv">This one too</div> 
                                </td> 
                            </tr> 
                            <tr> 
                                <td><code>append</code></td> 
                                <td><div>Content to the right will be appended to</div></td> 
                                <td><div id="appendDiv">This is the APPEND div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>prepend</code></td> 
                                <td><div>Content to the right will be prepended to</div></td> 
                                <td><div id="prependDiv">This is the PREPEND div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>after</code></td> 
                                <td><div>Content to the right will have new contents placed after it</div></td> 
                                <td><div id="afterDiv">This is the AFTER div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>before</code></td> 
                                <td><div>Content to the right will have new contents placed before it</div></td> 
                                <td><div id="beforeDiv">This is the BEFORE div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>replace</code></td> 
                                <td><div>Content to the right will be completely replaced
                                    (note that the target div has a solid green border)</div></td> 
                                <td><div id="replaceDiv" style="border: 2px solid green">This is the REPLACE div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>replaceContent</code></td> 
                                <td><div>Content to the right will have its contents replaced
                                    (note that the target div has a solid green border)</div></td> 
                                <td><div id="replaceContentsDiv" style="border: 2px solid green">This is the REPLACE-CONTENTS div
                                    (<span>contents</span> 
                                    <span>contents</span> 
                                    <span>contents</span>)
                                    </div> 
                                </td> 
                            </tr> 
                            <tr> 
                                <td><code>attr</code></td> 
                                <td><div>Content to the right will have its 'class' attribute changed</div></td> 
                                <td><div id="setAttrDiv">This text should turn green</div></td> 
                            </tr> 
         
                            <tr> 
                                <td>Table Row insertion</td> 
                                <td><div>Table to the right will have a new row inserted between rows one and two</div></td> 
                                <td> 
                                    <table border="1" cellpadding="3"> 
                                    <tr id="tr"><td>one</td><td>one</td><td>one</td></tr> 
                                    <tr><td>two</td><td>two</td><td>two</td></tr> 
                                    </table> 
                                </td> 
                            </tr> 
                            <tr> 
                                <td><code>wrap</code></td> 
                                <td><div>Text to the right should be wrapped in two bordered divs</div></td> 
                                <td><div class="wrapMe">Wrap me in bordered divs</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>&lt;script&gt;</code></td> 
                                <td> 
                                    <div>The button to the right will get a click handler via a dynamically added script element</div> 
                                </td> 
                                <td><input type="button" value="This button has no click handler (yet)" id="wireMe" /></td> 
                            </tr> 
                            <tr> 
                                <td><code>hide</code></td> 
                                <td><div>Content to the right will be hidden</div></td> 
                                <td><div id="hideMe">HIDE ME</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>eval</code></td> 
                                <td><div>Evaluating the contents of this command should insert text to the right </div></td> 
                                <td><div id="evalTarget"></div></td> 
                            </tr>
                        </tbody>
                    </table>   
	            </div>
                <div id="tabs-7">
                    <h1>Demo 2</h1> 
		            <p>This page demonstrates many updates at once.</p>
		            <p>Demo 2 is exactly the same as Demo 1, with one key difference: Demo 2 processes an XML String returned from the server instead of an XML Document. Processing XML strings can not be done using Taconite's auto-detection logic. To process an XML string response from the server you must invoke the taconite method manually and pass it the string.</p>
		            <p>The following code is used to request <em>ShowExample7</em> method:</p>
                    <code class="prettyprint lang-js">
$.ajax({
    type: "post",
    url: "ControlerService.asmx/ShowExample7",
    data: {},
    contentType: "application/json; charset=utf-8",
    cache: false,
    success: function(msg) {$.taconite(msg.d); }
});
                    </code>
		            <p><button id="ShowExample7">Run example 7</button></p>
		            <hr />
                    <table border="1" cellpadding="10">
                        <tbody>
                            <tr><th>Test</th><th>Description</th><th>Target</th></tr> 
                            <tr> 
                                <td><code>remove</code></td> 
                                <td><div>Content to the right will be removed</div></td> 
                                <td><div class="deleteDiv">This div will be removed</div> 
                                    <div class="deleteDiv">This one too</div> 
                                </td> 
                            </tr> 
                            <tr> 
                                <td><code>append</code></td> 
                                <td><div>Content to the right will be appended to</div></td> 
                                <td><div id="appendDiv2">This is the APPEND div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>prepend</code></td> 
                                <td><div>Content to the right will be prepended to</div></td> 
                                <td><div id="prependDiv2">This is the PREPEND div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>after</code></td> 
                                <td><div>Content to the right will have new contents placed after it</div></td> 
                                <td><div id="afterDiv2">This is the AFTER div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>before</code></td> 
                                <td><div>Content to the right will have new contents placed before it</div></td> 
                                <td><div id="beforeDiv2">This is the BEFORE div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>replace</code></td> 
                                <td><div>Content to the right will be completely replaced
                                    (note that the target div has a solid green border)</div></td> 
                                <td><div id="replaceDiv2" style="border: 2px solid green">This is the REPLACE div</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>replaceContent</code></td> 
                                <td><div>Content to the right will have its contents replaced
                                    (note that the target div has a solid green border)</div></td> 
                                <td><div id="replaceContentsDiv2" style="border: 2px solid green">This is the REPLACE-CONTENTS div
                                    (<span>contents</span> 
                                    <span>contents</span> 
                                    <span>contents</span>)
                                    </div> 
                                </td> 
                            </tr> 
                            <tr> 
                                <td><code>attr</code></td> 
                                <td><div>Content to the right will have its 'class' attribute changed</div></td> 
                                <td><div id="setAttrDiv2">This text should turn green</div></td> 
                            </tr> 
         
                            <tr> 
                                <td>Table Row insertion</td> 
                                <td><div>Table to the right will have a new row inserted between rows one and two</div></td> 
                                <td> 
                                    <table border="1" cellpadding="3"> 
                                    <tr id="tr2"><td>one</td><td>one</td><td>one</td></tr> 
                                    <tr><td>two</td><td>two</td><td>two</td></tr> 
                                    </table> 
                                </td> 
                            </tr> 
                            <tr> 
                                <td><code>wrap</code></td> 
                                <td><div>Text to the right should be wrapped in two bordered divs</div></td> 
                                <td><div class="wrapMe">Wrap me in bordered divs</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>&lt;script&gt;</code></td> 
                                <td> 
                                    <div>The button to the right will get a click handler via a dynamically added script element</div> 
                                </td> 
                                <td><input type="button" value="This button has no click handler (yet)" id="wireMe2" /></td> 
                            </tr> 
                            <tr> 
                                <td><code>hide</code></td> 
                                <td><div>Content to the right will be hidden</div></td> 
                                <td><div id="hideMe2">HIDE ME</div></td> 
                            </tr> 
                            <tr> 
                                <td><code>eval</code></td> 
                                <td><div>Evaluating the contents of this command should insert text to the right </div></td> 
                                <td><div id="evalTarget2"></div></td> 
                            </tr>
                        </tbody>
                    </table>   
	            </div>
	            <div id="tabs-8">
                    <h1>Performance Test</h1> 
		            <p>his example loads a 10 column, 500 row table into the space below. Processing this table will result in the creation of over 5500 new elements.</p>
		            <p><button id="ShowExample8">Run example 8</button><span id="timer"></span></p>
		            <hr />
		            <div id="example8" style="background-color: #ffa; padding:10px; border:1px solid #ccc"> 
                        Table will be loaded here.
                    </div>
		        </div>
            </div>
        </div>
    </body>
</html>
