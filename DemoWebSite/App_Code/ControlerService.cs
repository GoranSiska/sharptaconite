using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;

using OrangeBeta.SharpTaconite;
using System.IO;
using System.Web.UI;
using System.Web.Script.Services;

/// <summary>
/// Summary description for ControlerService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class ControlerService : System.Web.Services.WebService
{

    public ControlerService()
    {}

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
                    .Precede.With("<div>This div will go BEFORE the example div.</div>")
                    .Append.With("<div>This div is APPENDED</div>")
                    .Select("#example1 span")
                    .Wrap.With("<span style=\"border: 1px dashed #00F\"></span>");
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(taconite.Output());
                return doc;
            }
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
    public XmlDocument ShowExample2()
    { 
        using(StringWriter stringWriter = new StringWriter())
        {
            using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
            {
                Taconite taconite = new Taconite(writer);
                taconite
                    .Select("#example2")
                    .Append.With("<tfoot><tr><td>Foot-1</td><td>Foot-2</td></tr></tfoot>")
                    .Select("#example2 thead")
                    .Replace.With("<thead><tr><td>Head-1</td><td>Head-2</td></tr></thead>")
                    .Select("#example2 tbody")
                    .Prepend.With("<tr><td>Body-First</td><td>Body-First</td></tr>")
                    .Append.With("<tr><td colspan=\"2\" align=\"center\">spanned column</td></tr>")
                    .Select("#example2 tfoot")
                    .Precede.With("<tr><td>Body-Last</td><td>Body-Last</td></tr>");
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(taconite.Output());
                return doc;
            }
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
    public XmlDocument ShowExample3()
    {
        using (StringWriter stringWriter = new StringWriter())
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
    public XmlDocument ShowExample4()
    {
        using (StringWriter stringWriter = new StringWriter())
        {
            using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
            {
                Taconite taconite = new Taconite(writer);
                taconite
                    .Select("#example4")
                    .ReplaceContent.With(@"<pre>lorem ipsum dolor sit amet 
consectetuer adipiscing elit</pre>")
                    .SlideDown("1000");
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(taconite.Output());
                return doc;
            }
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
    public XmlDocument ShowExample5()
    {
        using (StringWriter stringWriter = new StringWriter())
        {
            using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
            {
                Taconite taconite = new Taconite(writer);
                taconite
                    .Select("#example5")
                    .Evaluate(@"$('#example5').html('<strong>This is new content!</strong>'); 
                                alert('Content udpated.');"); 
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(taconite.Output());
                return doc;
            }
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
    public XmlDocument ShowExample6()
    {
                using (StringWriter stringWriter = new StringWriter())
        {
            using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
            {
                Taconite taconite = new Taconite(writer);
                taconite
                    .Select("#hideMe")
                    .Hide()
                    .Select("#tabs-6 .deleteDiv")
                    .Clear()
                    .Select("#appendDiv")
                    .Append.With("<span class=\"newContent\">This span was appended to the APPEND div</span>")
                    .Select("#prependDiv")
                    .Prepend.With("<span class=\"newContent\">This span was prepended to the PREPEND div</span>")
                    .Select("#afterDiv")
                    .Follow.With(@"
        <p class=""newContent"">This paragraph element was inserted after the AFTER div</p>
        <div class=""newContent"">Note that we can have multiple elements here.<div>Any XHTML can be used!</div>
            <p> Radios follow:
                <input type=""radio"" name=""1"" value=""1""/> 
                <input type=""radio"" name=""1"" value=""2""/> 
                <input type=""radio"" name=""1"" value=""3""/> 
            </p> 
        </div>")
                    .Select("#beforeDiv")
                    .Precede.With("<span class=\"newContent\">This span was inserted before the BEFORE div</span>")
                    .Select("#replaceDiv")
                    .Replace.With(@"
        <div class=""newContent"">This is <span style=""font-weight:bold"">new</span> content that includes a table.</div> 
        <table border=""1"" cellpadding=""3"" class=""newContent""> 
            <thead>
                <tr><th>Header 1</th><th>Header 2</th></tr>
            </thead> 
            <tbody> 
                <tr><td>row 1 col 1</td><td>row 1 col 2</td></tr> 
                <tr><td>row 2 col 1</td><td>row 2 col 2</td></tr> 
            </tbody> 
        </table>")
                    .Select("#replaceContentsDiv")
                    .ReplaceContent.With(@"
        <div class=""newContent"">This is <span style=""font-weight:bold"">new</span> content that replaced the old content.</div> 
        <p class=""newContent""> Checkboxes follow:
            <input type=""checkbox"" name=""1"" value=""1""/> 
            <input type=""checkbox"" name=""2"" value=""2""/> 
            <input type=""checkbox"" name=""3"" value=""3""/> 
        </p>")
                    .Select("#setAttrDiv")
                    .Add.Attribute("class", "green")
                    .Select("#tr")
                    .Follow.With("<tr class=\"newContent\"><td>The</td><td>new</td><td>row</td></tr>")
                    .Select("#tabs-6 .wrapMe")
                    .Wrap.With("<div style=\"border:3px solid red; padding: 2px\"><div style=\"border:3px solid blue; padding: 2px\"></div></div>")
                    .Select("head")
                    .Append.With(@"
        <script type=""text/javascript""> 
            // wire up the 'wireMe' button on the fly
            $('#wireMe').click(function(){
                alert('Button clicked!');
            }).val(""Wired!"");
                </script>")
                    .Evaluate("$('#evalTarget').html(\"This text came from an eval command\");");

                XmlDocument doc = new XmlDocument();
                doc.LoadXml(taconite.Output());
                return doc;
            }
        }
    }

    [WebMethod]
    public string ShowExample7()
    {
        using (StringWriter stringWriter = new StringWriter())
        {
            using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
            {
                Taconite taconite = new Taconite(writer);
                return taconite
                    .Select("#hideMe2")
                    .Hide()
                    .Select("#tabs-7 .deleteDiv")
                    .Clear()
                    .Select("#appendDiv2")
                    .Append.With("<span class=\"newContent\">This span was appended to the APPEND div</span>")
                    .Select("#prependDiv2")
                    .Prepend.With("<span class=\"newContent\">This span was prepended to the PREPEND div</span>")
                    .Select("#afterDiv2")
                    .Follow.With(@"
        <p class=""newContent"">This paragraph element was inserted after the AFTER div</p>
        <div class=""newContent"">Note that we can have multiple elements here.<div>Any XHTML can be used!</div>
            <p> Radios follow:
                <input type=""radio"" name=""2"" value=""1""/> 
                <input type=""radio"" name=""2"" value=""2""/> 
                <input type=""radio"" name=""2"" value=""3""/> 
            </p> 
        </div>")
                    .Select("#beforeDiv2")
                    .Precede.With("<span class=\"newContent\">This span was inserted before the BEFORE div</span>")
                    .Select("#replaceDiv2")
                    .Replace.With(@"
        <div class=""newContent"">This is <span style=""font-weight:bold"">new</span> content that includes a table.</div> 
        <table border=""1"" cellpadding=""3"" class=""newContent""> 
            <thead>
                <tr><th>Header 1</th><th>Header 2</th></tr>
            </thead> 
            <tbody> 
                <tr><td>row 1 col 1</td><td>row 1 col 2</td></tr> 
                <tr><td>row 2 col 1</td><td>row 2 col 2</td></tr> 
            </tbody> 
        </table>")
                    .Select("#replaceContentsDiv2")
                    .ReplaceContent.With(@"
        <div class=""newContent"">This is <span style=""font-weight:bold"">new</span> content that replaced the old content.</div> 
        <p class=""newContent""> Checkboxes follow:
            <input type=""checkbox"" name=""4"" value=""1""/> 
            <input type=""checkbox"" name=""5"" value=""2""/> 
            <input type=""checkbox"" name=""6"" value=""3""/> 
        </p>")
                    .Select("#setAttrDiv2")
                    .Add.Attribute("class", "green")
                    .Select("#tr2")
                    .Follow.With("<tr class=\"newContent\"><td>The</td><td>new</td><td>row</td></tr>")
                    .Select("#tabs-7 .wrapMe")
                    .Wrap.With("<div style=\"border:3px solid red; padding: 2px\"><div style=\"border:3px solid blue; padding: 2px\"></div></div>")
                    .Select("head")
                    .Append.With(@"
        <script type=""text/javascript""> 
            // wire up the 'wireMe' button on the fly
            $('#wireMe2').click(function(){
                alert('Button clicked!');
            }).val(""Wired!"");
                </script>")
                    .Evaluate("$('#evalTarget2').html(\"This text came from an eval command\");")
                    .Output();
            }
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Xml)]
    public XmlDocument ShowExample8()
    {
        using (StringWriter stringWriter = new StringWriter())
        {
            using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
            {
                Taconite taconite = new Taconite(writer);
                taconite
                    .Select("#example8")
                    .ReplaceContent.With(new DummyTableControl());
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(taconite.Output());
                return doc;
            }
        }
    }
}

