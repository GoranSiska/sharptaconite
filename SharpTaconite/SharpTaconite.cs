using System.Web.UI;
using System.IO;

namespace OrangeBeta.SharpTaconite
{
    public class Taconite : ISelector
    {
        private ITaconite TaconiteHelper { get; set; }

        public Taconite(TextWriter writer)
            : this(new HtmlTextWriter(writer))
        { }

        public Taconite(HtmlTextWriter writer)
            :this(new TaconiteHelper(writer))
        {
            //TaconiteHelper = new TaconiteHelper(writer);
        }

        internal Taconite(ITaconite taconiteHelper)
        {
            TaconiteHelper = taconiteHelper;
        }

        public IElement Select(string selector)
        {
            return TaconiteHelper.Select(selector);
        }

        public string Output()
        {
            return TaconiteHelper.Output();
        }

        public IElement Evaluate(string function)
        {
            return TaconiteHelper.Evaluate(function);
        }
    }

    internal class TaconiteHelper : ITaconite
    {
        #region Globals

        internal TaconiteWriter Writer { get; set; }

        private string Selector { get; set; }

        private string Action { get; set; }

        #endregion

        #region Constructor

        internal TaconiteHelper(HtmlTextWriter writer)
        {
            Writer = new TaconiteWriter(writer);
            Writer.BeginDocument();
        }

        #endregion

        #region ISelector

        public IElement Select(string selector)
        {
            Selector = selector;
            return this;
        }

        public string Output()
        {
            return Writer.EndDocument();
        }

        public IElement Evaluate(string function)
        {
            Writer.WriteCDataCommand("eval", function);
            return this;
        }

        #endregion

        #region IAction

        public ISelector Clear()
        {
            Writer.WriteCommand(Selector, "remove");
            return this;
        }

        public IContent Append { get { Action = "append"; return this; } }
        
        public IContent Prepend { get { Action = "prepend"; return this; } }

        public IContent Precede { get { Action = "before"; return this; } }

        public IContent Follow { get { Action = "after"; return this; } }
        
        public IContent Replace { get { Action = "replace"; return this; } }
        
        public IContent ReplaceContent { get { Action = "replaceContent"; return this; } }

        public IContent Wrap { get { Action = "wrap"; return this; } }

        public IAttribute Add { get { Action = "add"; return this; } }

        public IAttribute Remove { get { Action = "remove"; return this; } }

        #endregion

        #region IContent

        public IElement With(string content)
        { 
            Writer.WriteCommand(Selector, Action, content);
            return this;
        }

        public IElement With(Control control)
        {
            Writer.WriteCommand(Selector, Action, control);
            return this;
        }

        #endregion

        #region IAttribute

        public IElement Class(string name)
        {
            Writer.WriteArgsCommand(Selector, Action + "Class", name);
            return this;
        }

        public IElement Attribute(string name, string value)
        {
            Writer.WriteArgsCommand(Selector, Action == "remove" ? "removeAttr" : "attr", name, value);
            return this;
        }

        #endregion

        #region IStyle

        public IElement Style(string name, string value)
        {
            Writer.WriteArgsCommand(Selector, "css", name, value);
            return this;
        }

        #endregion

        #region IEffect

        public IElement Show()
        {
            Writer.WriteNoArgsCommand(Selector, "show");
            return this;
        }

        public IElement Hide()
        {
            Writer.WriteNoArgsCommand(Selector, "hide");
            return this;
        }

        public IElement SlideUp(string duration)
        {
            Writer.WriteArgsCommand(Selector, "slideUp", duration);
            return this;
        }

        public IElement SlideDown(string duration)
        {
            Writer.WriteArgsCommand(Selector, "slideDown", duration);
            return this;
        }

        public IElement FadeIn(string duration)
        {
            Writer.WriteArgsCommand(Selector, "fadeIn", duration);
            return this;
        }

        public IElement FadeOut(string duration)
        {
            Writer.WriteArgsCommand(Selector, "fadeOut", duration);
            return this;
        }

        public IElement FadeTo(string duration, double opacity)
        {
            Writer.WriteArgsCommand(Selector, "fadeTo", duration, opacity);
            return this;
        }

        #endregion
    }
}