using System.Collections.Generic;
using System.Web.UI;
using System.Web.Services;
using System.Web;

namespace OrangeBeta.SharpTaconite
{
    public class TaconiteWriter
    {
        #region Globals

        private HtmlTextWriter Writer { get; set; }
        private Stack<string> Tags { get; set; }

        #endregion

        #region Constructor

        public TaconiteWriter(HtmlTextWriter writer)
        {
            Tags = new Stack<string>();
            Writer = writer;
        }

        #endregion

        #region Methods

        public void BeginDocument()
        {
            Writer.WriteFullBeginTag("taconite");
            Tags.Push("taconite");
        }

        public void WriteCommand(string selector, string tag)
        {
            WriteCommand(selector, tag, string.Empty);
        }

        public void WriteCommand(string selector, string tag, string content)
        {
            WriteCommand(selector, tag, content, false);
        }
        
        public void WriteCommand(string selector, string tag, Control control)
        {
            Writer.WriteBeginTag(tag);
            Writer.WriteAttribute("select", selector);
            Writer.Write(HtmlTextWriter.TagRightChar);
            try
            {
                using (Page page = new Page())
                {
                    page.Controls.Add(control);
                    HttpContext.Current.Server.Execute(page, Writer, false);
                }
            }
            catch
            { 
                //do nothing
            }
            Writer.WriteEndTag(tag);
        }

        public void WriteCommand(string selector, string tag, string content, bool cdata)
        {
            Writer.WriteBeginTag(tag);
            Writer.WriteAttribute("select", selector);
            Writer.Write(HtmlTextWriter.TagRightChar);
            if (cdata)
            {
                Writer.Write("<![CDATA[");
            }
            Writer.Write(content);
            if (cdata)
            {
                Writer.Write("]]>");
            }
            Writer.WriteEndTag(tag);
        }

        public void WriteNoArgsCommand(string selector, string tag)
        {
            Writer.WriteBeginTag(tag);
            Writer.WriteAttribute("select", selector);
            Writer.Write(HtmlTextWriter.SelfClosingTagEnd);
        }

        public void WriteArgsCommand(string selector, string tag, params object[] args)
        {
            Writer.WriteBeginTag(tag);
            Writer.WriteAttribute("select", selector);
            for (int i = 0; i < args.Length; i++)
            {
                Writer.WriteAttribute("arg" + (i + 1), args[i].ToString());
            }
            Writer.Write(HtmlTextWriter.SelfClosingTagEnd);
        }

        public void WriteCDataCommand(string tag, string content)
        {
            Writer.WriteFullBeginTag(tag);
            Writer.Write("<![CDATA[");
            Writer.Write(content);
            Writer.Write("]]>");
            Writer.WriteEndTag(tag);
        }

        public string EndDocument()
        {
            while (Tags.Count > 0)
            {
                Writer.WriteEndTag(Tags.Pop());
            }
            return Writer.InnerWriter.ToString();
        }

        #endregion
    }
}
