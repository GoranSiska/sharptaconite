using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for DummyTableControl
/// </summary>
public class DummyTableControl : Control
{
    public DummyTableControl()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected override void OnLoad(EventArgs e)
    {
        HtmlTable table = new HtmlTable();
        Controls.Add(table);

        for (int r=0; r<500; r++)
        { 
            HtmlTableRow row = new HtmlTableRow();
            table.Rows.Add(row);

            HtmlTableCell firstCell = new HtmlTableCell();
            firstCell.InnerText = r.ToString();
            row.Cells.Add(firstCell);
            
            for(int c=0; c<9; c++)
            {
                HtmlTableCell cell = new HtmlTableCell();
                cell.InnerText = "data";
                row.Cells.Add(cell);
            }
        }
    }
}
