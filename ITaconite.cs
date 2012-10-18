using System.Web.UI;

namespace OrangeBeta.SharpTaconite
{
    public interface ITaconite : ISelector, IElement, IAttribute, IContent {}

    public interface ISelector
    {
        IElement Select(string selector);

        string Output();

        IElement Evaluate(string function);
    }

    public interface IElement : ISelector, IAction, IStyle, IEffect { }

    public interface IAction
    {
        ISelector Clear();

        IContent Append { get; }

        IContent Prepend { get; }

        IContent Follow { get; }

        IContent Precede { get; }

        IContent Replace { get; }

        IContent ReplaceContent { get; }

        IContent Wrap { get; }

        IAttribute Add { get; }

        IAttribute Remove { get; }
    }

    public interface IContent
    {
        IElement With(string content);

        IElement With(Control control);
    }

    public interface IAttribute
    {
        IElement Attribute(string name, string value);

        IElement Class(string name);
    }

    public interface IStyle
    {
        IElement Style(string name, string value);
    }

    public interface IEffect
    {
        IElement Show();

        IElement Hide();

        IElement FadeIn(string duration);

        IElement FadeOut(string duration);

        IElement FadeTo(string duration, double opacity);

        IElement SlideUp(string duration);

        IElement SlideDown(string duration);
    }
}
