<%@ Page Title="" Language="C#" MasterPageFile="~/master/SingleGrid.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FineUI.Pro.Examples.master.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCPH" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCPH" runat="server">
    <f:Panel ID="panel1" runat="server" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Start" BoxFlex="1">
        <Items>
            <f:Grid DataIDField="Id" ID="Grid1" runat="server" ShowHeader="false" ShowBorder="false" DataKeyNames="ID" SortField="XSDD_ID" AllowSorting="true"
                AllowPaging="true" IsDatabasePaging="true" EnableCheckBoxSelect="true" BoxFlex="1">
                <Toolbars>
                    <f:Toolbar ID="Toolbar1" runat="server">
                        <Items>
                            <f:Button ID="btnRebind" runat="server" Text="重新绑定" OnClick="btnRebind_Click"></f:Button>
                            <f:Button ID="btnExport" runat="server" EnableAjax="false" DisableControlBeforePostBack="false" Text="导出" OnClick="btnExport_Click">
                            </f:Button>
                        </Items>
                    </f:Toolbar>
                </Toolbars>
                <Columns>
                    <f:RenderField ColumnID="tfNumber" Width="60px" DataField="Gender" />
                    <f:RenderField DataField="Name" HeaderText="姓名" />
                    <f:RenderField ColumnID="tfGender" HeaderText="性别" TextAlign="Center" DataField="Gender" RendererFunction="renderGender" />
                    <f:GroupField EnableLock="true" HeaderText="考试成绩" TextAlign="Center">
                        <Columns>
                            <f:RenderField EnableLock="true" DataField="ChineseScore" SortField="ChineseScore" HeaderText="语文成绩" TextAlign="Center" />
                            <f:RenderField EnableLock="true" DataField="MathScore" SortField="MathScore" HeaderText="数学成绩" TextAlign="Center" />
                            <f:RenderField EnableLock="true" DataField="TotalScore" SortField="TotalScore" HeaderText="总成绩" TextAlign="Center" />
                        </Columns>
                    </f:GroupField>
                    <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                        RendererFunction="renderMajor" />
                    <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
                </Columns>
            </f:Grid>
        </Items>
    </f:Panel>
</asp:Content>
