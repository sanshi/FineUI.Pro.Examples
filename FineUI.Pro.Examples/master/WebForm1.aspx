<%@ Page Title="" Language="C#" MasterPageFile="~/master/SingleGrid.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FineUI.Pro.Examples.master.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCPH" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCPH" runat="server">
    <f:Panel ID="panel1" runat="server" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Start" BoxFlex="1">
        <Items>
            <f:Grid DataIDField="Id" ID="Grid1" runat="server" ShowHeader="false" ShowBorder="false"
                DataKeyNames="ID" SortField="XSDD_ID" AllowSorting="true"
                AllowPaging="true" IsDatabasePaging="true" EnableCheckBoxSelect="true" BoxFlex="1">
                <Toolbars>
                    <f:Toolbar ID="Toolbar1" runat="server">
                        <Items>
                            <f:Button ID="btnRebind" runat="server" Text="重新绑定" OnClick="btnRebind_Click"></f:Button>
                            <f:Button ID="btnExport" runat="server" EnableAjax="false" DisableControlBeforePostBack="false" Text="导出" OnClick="btnExport_Click" ></f:Button>
                        </Items>
                    </f:Toolbar>
                </Toolbars>
                <Columns>
                    <f:TemplateField ColumnID="tfNumber" Width="60px">
                        <ItemTemplate>
                            <span id="spanNumber" runat="server"><%# Eval("Gender") %></span>
                        </ItemTemplate>
                    </f:TemplateField>
                    <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                    <f:TemplateField ColumnID="tfGender" HeaderText="性别" TextAlign="Center">
                        <ItemTemplate>
                            <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                            <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                            <asp:Label ID="labGender" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                        </ItemTemplate>
                    </f:TemplateField>
                    <f:GroupField EnableLock="true" HeaderText="考试成绩" TextAlign="Center">
                        <Columns>
                            <f:BoundField EnableLock="true" DataField="ChineseScore" SortField="ChineseScore" HeaderText="语文成绩"
                                TextAlign="Center" />
                            <f:BoundField EnableLock="true" DataField="MathScore" SortField="MathScore" HeaderText="数学成绩"
                                TextAlign="Center" />
                            <f:BoundField EnableLock="true" DataField="TotalScore" SortField="TotalScore" HeaderText="总成绩"
                                TextAlign="Center" />
                        </Columns>
                    </f:GroupField>
                    <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                        DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                        UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                    <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}"
                        HeaderText="注册日期" />
                </Columns>
            </f:Grid>
        </Items>
    </f:Panel>
</asp:Content>
