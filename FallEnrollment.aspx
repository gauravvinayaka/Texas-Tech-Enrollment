<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UNCERTIFIEDENR.aspx.cs" Inherits="UNCERTIFIEDENR" %>

<%@ Register Src="~/controls/sidebar.ascx" TagName="sideBar" TagPrefix="uc1" %>
<%@ Register Src="~/controls/header.ascx" TagName="header" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TEXAS TECH UNIVERSITY</title>
    <link type="text/css" href="../../cssJScript_v1.0.0.css" rel="Stylesheet" /><link type="text/css" href="../../cssFactBook_v1.0.0.css" rel="Stylesheet" />
    <link type="text/css" href="http://www.depts.ttu.edu/shared/shared_ttumain/css/global_relative.css"
        rel="Stylesheet" />

    <script type="text/javascript" src="../../scripts/FactJScript_v1.0.3.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:header ID="header" runat="server" />
        <div id="divContainer">
            <uc1:sideBar ID="SideBar1" runat="server" />
            <div class="divRight">
                <div class="divTrigger">
                    <a href="#"></a>
                </div>
                <div id="factBookHeader">
                    <span>TEXAS TECH UNIVERSITY </span><br />
                    <br />
                </div>

                <div id="report">
                    <div id="reportHeader" class="reportHeader">
                        <div style="text-align: center">
                            <asp:Label ID="caption" runat="server">
                            </asp:Label><br />
                           <%-- <span style="font-family: Verdana; font-size: 11px; color: #333333; line-height: 20px;">
                                (Uncertified Data)&nbsp;&nbsp;&nbsp;&nbsp;</span>--%>
                        </div>
                        <div align="center" id="dropExport">
                            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <asp:DropDownList ID="ENRDropDownList" AutoPostBack="True" OnSelectedIndexChanged="ENRDropDownList_OnSelectedIndexChanged"
                                runat="Server">
                                <asp:ListItem Text="Fall 2016" Value="20172" />
                                <asp:ListItem Text="Fall 2015" Value="20162" />
                                <asp:ListItem Text="Fall 2014" Value="20152" />
                                <asp:ListItem Text="Fall 2013" Value="20142" />
                                <asp:ListItem Text="Fall 2012" Value="20132" />
								<asp:ListItem Text="Fall 2011" Value="20122" />
                                <asp:ListItem Text="Fall 2010" Value="20112" />
                                <asp:ListItem Text="Fall 2009" Value="20102" />
                            </asp:DropDownList>
                            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:ImageButton id="expToExcel" title="Export To Excel" runat="server" Width="19px" Height="19px" OnClick="ExpToExcel_Click" ImageUrl="~/images/excel2007.png" />&nbsp;&nbsp;
                            <asp:ImageButton id="expToWord" title="Export To Word" runat="server" Width="19px" Height="19px" OnClick="ExpToWord_Click" ImageUrl="~/images/word2007.gif" />
                            </span>
                        </div>
                    </div>
                    <div id="divGrid" class="divGrid">
<%--------------------------------------- New First Time Freshman -------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionN" CssClass="gvCaption" runat="server">NEW FIRST TIME FRESHMAN</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView1" DataSourceID="DataSource1" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                
                             <%--   <ItemTemplate><%# string.Format("{0:N0}", Convert.ToInt32(Eval("Last_Term"))) %></ItemTemplate>--%>
                                
                                <asp:BoundField HeaderText="NEW FIRST-TIME FRESHMEN" HtmlEncode="false" DataField="NEW FIRST-TIME FRESHMEN" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Last_Term" HtmlEncode="false" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px"   ReadOnly="true" DataFormatString="{0:N0}"  /> 
                                <asp:BoundField HeaderText="Current_Term" HtmlEncode="false" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="#Change" HtmlEncode="false" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="%Change" HtmlEncode="false" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                  
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource1" runat="server" onselecting="DataSource1_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTNEWFRESH" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />      
                        <%--------------------------------------- African American-------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionA" CssClass="gvCaption" runat="server">AFRICAN AMERICAN</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView2" DataSourceID="DataSource2" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="AFRICAN AMERICAN" HtmlEncode="false" DataField="AFRICAN AMERICAN" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                  
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource2" runat="server" onselecting="DataSource2_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTAFRAMR" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />      
                        <%--------------------------------------- Hispanic-------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionP" CssClass="gvCaption" runat="server">HISPANIC</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView3" DataSourceID="DataSource3" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="HISPANIC" HtmlEncode="false" DataField="HISPANIC" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource3" runat="server" onselecting="DataSource3_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTHISPANIC" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />   

        <%--------------------------------------- Class Rank-------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionR" CssClass="gvCaption" runat="server">CLASS RANK</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView4" DataSourceID="DataSource4" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="CLASS RANK***" HtmlEncode="false" DataField="CLASS RANK***" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="305px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                
                                
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource4" runat="server" onselecting="DataSource4_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTCLASSRANK" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />                              

<%--------------------------------------- Undergraduate Transfers -------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionU" CssClass="gvCaption" runat="server">UNDERGRADUATE TRANSFERS</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView5" DataSourceID="DataSource5" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="UNDERGRADUATE TRANSFERS" HtmlEncode="false" DataField="UNDERGRADUATE TRANSFERS" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="290px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                 
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource5" runat="server" onselecting="DataSource5_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTUNDERGRAD" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />      

     <%--------------------------------------- New Graduate Students -------------------------------------------------------%>  

                    <asp:Label ID="gvCaptionG" CssClass="gvCaption" runat="server">NEW GRADUATE STUDENTS</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView6" DataSourceID="DataSource6" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="NEW GRADUATE STUDENTS" HtmlEncode="false" DataField="Category" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                  
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource6" runat="server" onselecting="DataSource6_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800" 
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTGRAD" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />
                        
              <%--------------------------------------- RETENTION/GRADUATION RATE -------------------------------------------------------%>  

                    <asp:Label ID="gvCaptionT" CssClass="gvCaption" runat="server">RETENTION/GRADUATION RATE</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView7" DataSourceID="DataSource7" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="RETENTION/GRADUATION RATE" HtmlEncode="false" DataField="RetGradrate" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="285px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource7" runat="server" onselecting="DataSource7_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800" 
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTRETGRAD" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />






     <%--------------------------------------- Degrees Awarded -------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionD" CssClass="gvCaption" runat="server">DEGREES AWARDED</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView8" DataSourceID="DataSource8" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="DEGREES AWARDED" HtmlEncode="false" DataField="Category" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource8" runat="server" onselecting="DataSource8_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTDEG" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />                                                
  <%--------------------------------------- Semester Credit Hours-------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionS" CssClass="gvCaption" runat="server">SEMESTER CREDIT HOURS</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView9" DataSourceID="DataSource9" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="SEMESTER CREDIT HOURS" HtmlEncode="false" DataField="Category" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                               
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource9" runat="server" onselecting="DataSource9_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                         SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTSCH" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />
     <%--------------------------------------- Headcount Enrollment-------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionH" CssClass="gvCaption" runat="server">HEADCOUNT ENROLLMENT</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView10" DataSourceID="DataSource10" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="HEADCOUNT ENROLLMENT" HtmlEncode="false" DataField="Category" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right" 
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                 <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                               
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource10" runat="server" onselecting="DataSource10_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTHEADENR" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />    


     <%--------------------------------------- Enrollment by Home-------------------------------------------------------%>   
            
                <asp:Label ID="gvCaptionO" CssClass="gvCaption" runat="server">ENROLLMENT BY HOME</asp:Label><br />
                   <asp:GridView Width="800px" ID="MyGridView11" DataSourceID="DataSource11" AutoGenerateColumns="false" runat="Server"
                            BorderColor="#555555" HorizontalAlign="Center"
                            Font-Names="Verdana" Font-Size="12px" AllowSorting="True" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#CC0000">
                    <EmptyDataTemplate>*** No data available ***</EmptyDataTemplate>
                            <%--Do not put the header styles in seperate headerstyle tag, because when exporting to excel, that will change the color of first row even outside the table in excel--%><Columns>
                                <asp:BoundField HeaderText="ENROLLMENT BY HOME" HtmlEncode="false" DataField="Category" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="300px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Last_Term" DataField="Last_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="Current_Term" DataField="Current_Term" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="#Change" DataField="#Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}"/>
                                <asp:BoundField HeaderText="%Change" DataField="%Change" ItemStyle-HorizontalAlign="Right"
                                    HeaderStyle-BackColor="#CC0000" HeaderStyle-BorderColor="#555555" ItemStyle-BorderColor="#555555" HeaderStyle-ForeColor="#FFFFFF" HeaderStyle-Width="125px" ReadOnly="true" DataFormatString="{0:N0}" />
                                
                            </Columns>
                        </asp:GridView>                                             
                 <asp:SqlDataSource ID="DataSource11" runat="server" onselecting="DataSource11_Selecting"  DataSourceMode="DataSet"  ConnectionString="<%$ ConnectionStrings:ConnStringExtracts_IRDW %>"
                  EnableCaching="true" CacheDuration="10800"
                        SelectCommand="dbo.SP_FB_UNCERT_ENR_IRDW" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="reportType" Type="String" DefaultValue="UNCERTHOME" />
                        <asp:ControlParameter ControlID="ENRDropDownList" PropertyName="SelectedValue" Name="Term"
                            Type="int32" DefaultValue="20172" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        <br />    



                        <br />                        
                    </div>
                </div>
            </div>
        </div>
    </div>  
    
    
    </form>
</body>
</html>
