using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.IO;

public partial class UNCERTIFIEDENR : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            caption.Text = "Comparison of Fall Enrollment Numbers  - " + ENRDropDownList.SelectedItem;
            string dropValue = ENRDropDownList.SelectedItem.Text;
            string drop = ENRDropDownList.SelectedItem.Value.Remove(4, 1);
            int previousvalue = Convert.ToInt32(drop) - 2;

            //For Last_Term to load on selected Dropdown value on every page
            MyGridView1.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView2.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView3.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView4.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView5.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView6.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView7.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView8.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView9.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView10.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
            MyGridView11.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);

            //For Current_Term to load on selected Dropdown value on every page
            MyGridView1.Columns[2].HeaderText = dropValue;
            MyGridView2.Columns[2].HeaderText = dropValue;
            MyGridView3.Columns[2].HeaderText = dropValue;
            MyGridView4.Columns[2].HeaderText = dropValue;
            MyGridView5.Columns[2].HeaderText = dropValue;
            MyGridView6.Columns[2].HeaderText = dropValue;
            MyGridView7.Columns[2].HeaderText = dropValue;
            MyGridView8.Columns[2].HeaderText = dropValue;
            MyGridView9.Columns[2].HeaderText = dropValue;
            MyGridView10.Columns[2].HeaderText = dropValue;
            MyGridView11.Columns[2].HeaderText = dropValue;
        }
    }


    protected void ENRDropDownList_OnSelectedIndexChanged(Object sender, EventArgs e)
    {
        caption.Text = "Comparison of Fall Enrollment Numbers  - " + ENRDropDownList.SelectedItem;
        Session["term"] = ENRDropDownList.SelectedValue;
        MyGridView1.DataBind();
        MyGridView2.DataBind();
        MyGridView3.DataBind();
        MyGridView4.DataBind();
        MyGridView5.DataBind();
        MyGridView6.DataBind();
        MyGridView7.DataBind();
        MyGridView8.DataBind();
        MyGridView9.DataBind();
        MyGridView10.DataBind();
        MyGridView11.DataBind();

        string dropValue = ENRDropDownList.SelectedItem.Text;
        string drop = ENRDropDownList.SelectedItem.Value.Remove(4,1);
        int previousvalue = Convert.ToInt32(drop) - 2;


        //For Last_Term
        MyGridView1.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView2.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView3.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView4.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView5.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView6.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView7.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView8.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView9.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView10.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
        MyGridView11.Columns[1].HeaderText = "Fall " + Convert.ToString(previousvalue);
       

        //For Current_Term
        MyGridView1.Columns[2].HeaderText = dropValue;
        MyGridView2.Columns[2].HeaderText = dropValue;
        MyGridView3.Columns[2].HeaderText = dropValue;
        MyGridView4.Columns[2].HeaderText = dropValue;
        MyGridView5.Columns[2].HeaderText = dropValue;
        MyGridView6.Columns[2].HeaderText = dropValue;
        MyGridView7.Columns[2].HeaderText = dropValue;
        MyGridView8.Columns[2].HeaderText = dropValue;
        MyGridView9.Columns[2].HeaderText = dropValue;
        MyGridView10.Columns[2].HeaderText = dropValue;
        MyGridView11.Columns[2].HeaderText = dropValue;

    }
    protected void DataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource6_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource7_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource8_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource9_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource10_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    protected void DataSource11_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.CommandTimeout = 180;
    }
    public void ExpToExcel_Click(object sender, EventArgs e)
    {
        ExportGridView();
    }

    public void ExpToWord_Click(object sender, EventArgs e)
    {
        getHTMLGridView();
    }


   
    private void ExportGridView()
    {
        string attachment = "attachment; filename=" + Path.GetFileName(Request.PhysicalPath).Substring(0, Path.GetFileName(Request.PhysicalPath).Length - 5) + "_" + ENRDropDownList.SelectedItem + ".xls";
        Response.ClearContent();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/vnd.ms-excel";
        StringWriter stw = new StringWriter();
        HtmlTextWriter htextw = new HtmlTextWriter(stw);
        string style = @"<style> .textmode { mso-number-format:\@; } </style>";
        Response.Write(style);
        String cellcount = MyGridView1.Rows[0].Cells.Count.ToString();
        string header = "<div><table style='font-weight:bold' width= '";
        header += MyGridView1.Width.ToString() + "'><tr><td align='center' colspan='";
        header += cellcount + "'>TEXAS TECH UNIVERSITY</td></tr>";
        header += "<tr><td align='center' colspan='";
        header += cellcount + "'>" + caption.Text.ToUpper() + "</td></tr>";
        header += "<tr><td align='center' colspan='";
        header += cellcount + "'>DEPARTMENT OF INSTITUTIONAL RESEARCH</td></tr><tr><td align='center' colspan='";
        header += cellcount + "'>(Uncertified Data)</td></tr><tr><td colspan='";
        header += cellcount + "'><br></td></tr><tr><td align='center' colspan='";
        header += cellcount + "'>" + gvCaptionN.Text.ToString() + "</td></tr></table></div>";
        Response.Output.Write(header);
        MyGridView1.DataBind();
        MyGridView1.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView2.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionA.Text.ToString() + "</td></tr></table></div>");
        MyGridView2.DataBind();
        MyGridView2.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView3.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionP.Text.ToString() + "</td></tr></table></div>");
        MyGridView3.DataBind();
        MyGridView3.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView4.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionR.Text.ToString() + "</td></tr></table></div>");
        MyGridView4.DataBind();
        MyGridView4.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView5.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionU.Text.ToString() + "</td></tr></table></div>");
        MyGridView5.DataBind();
        MyGridView5.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView6.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionG.Text.ToString() + "</td></tr></table></div>");
        MyGridView6.DataBind();
        MyGridView6.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView7.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionT.Text.ToString() + "</td></tr></table></div>");
        MyGridView7.DataBind();
        MyGridView7.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView8.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionD.Text.ToString() + "</td></tr></table></div>");
        MyGridView8.DataBind();
        MyGridView8.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView9.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionS.Text.ToString() + "</td></tr></table></div>");
        MyGridView9.DataBind();
        MyGridView9.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView10.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionH.Text.ToString() + "</td></tr></table></div>");
        MyGridView10.DataBind();
        MyGridView10.RenderControl(htextw);
        stw.WriteLine("<br><div><table style='font-weight:bold' width='" + MyGridView11.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionO.Text.ToString() + "</td></tr></table></div>");


        MyGridView11.DataBind();
        MyGridView11.RenderControl(htextw);
        Response.Output.Write(stw.ToString());
        Response.End();
    }


    private void getHTMLGridView()
    {
        string attachment = "attachment; filename=" + Path.GetFileName(Request.PhysicalPath).Substring(0, Path.GetFileName(Request.PhysicalPath).Length - 5) + "_" + ENRDropDownList.SelectedItem + ".doc";
        Response.ClearContent();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/vnd.word";
        StringWriter stw = new StringWriter();
        HtmlTextWriter htextw = new HtmlTextWriter(stw);
        String cellcount = MyGridView1.Rows[0].Cells.Count.ToString();
        string header = "<div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '";
        header += MyGridView1.Width.ToString() + "'><tr><td align='center' style='letter-spacing: 0.2em;' colspan='";
        header += cellcount + "'>TEXAS TECH UNIVERSITY</td></tr>";
        header += "<tr><td align='center' colspan='";
        header += cellcount + "'>" + caption.Text.ToUpper() + "</td></tr>";
        header += "<tr><td align='center' colspan='";
        header += cellcount + "'>DEPARTMENT OF INSTITUTIONAL RESEARCH</td></tr><tr><td align='center' style='font-size:11px;' colspan='";
        header += cellcount + "'>(Uncertified Data)</td></tr><tr><td colspan='";
        header += cellcount + "'><br></td></tr><tr><td align='center' colspan='";
        header += cellcount + "'><br>" + gvCaptionN.Text.ToString() + "</td></tr><tr><td colspan='";
        header += cellcount + "'></td></tr></table></div>";
        Response.Output.Write(header);
        MyGridView1.DataBind();
        MyGridView1.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView2.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionA.Text.ToString() + "</td></tr></table></div>");
        MyGridView2.DataBind();
        MyGridView2.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView3.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionP.Text.ToString() + "</td></tr></table></div>");
        MyGridView3.DataBind();
        MyGridView3.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView4.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionR.Text.ToString() + "</td></tr></table></div>");
        MyGridView4.DataBind();
        MyGridView4.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView5.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionU.Text.ToString() + "</td></tr></table></div>");
        MyGridView5.DataBind();
        MyGridView5.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView6.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionG.Text.ToString() + "</td></tr></table></div>");
        MyGridView6.DataBind();
        MyGridView6.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView7.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionT.Text.ToString() + "</td></tr></table></div>");
        MyGridView7.DataBind();
        MyGridView7.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView8.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionD.Text.ToString() + "</td></tr></table></div>");
        MyGridView8.DataBind();
        MyGridView8.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView9.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionS.Text.ToString() + "</td></tr></table></div>");
        MyGridView9.DataBind();
        MyGridView9.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView10.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionH.Text.ToString() + "</td></tr></table></div>");
        MyGridView10.DataBind();
        MyGridView10.RenderControl(htextw);
        stw.WriteLine("<br><div><table align='center' style='font-weight:bold; font-family:Verdana; font-size:14px; line-height:18px;' width= '" + MyGridView11.Width.ToString() + "'><tr><td align='center' colspan='" + cellcount + "'>" + gvCaptionO.Text.ToString() + "</td></tr></table></div>");


        MyGridView11.DataBind();
        MyGridView11.RenderControl(htextw);
        Response.Output.Write(stw.ToString());
        Response.End();
    }

    //we need to override this method to avoid error message which shows "gridview must be placed inside a form tag with runat=server"
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}
