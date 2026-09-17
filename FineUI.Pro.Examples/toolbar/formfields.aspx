<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formfields.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.formfields" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" FormMessageTarget="Qtip" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Height="500px" runat="server" EnableCollapse="false"
            >
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right">
                    <Items>
                        <f:DatePicker runat="server" Required="true" DateFormatString="yyyy/MM/dd"
                            LabelWidth="120px" LabelAlign="Right" Label="销毁统计时间段" EmptyText="请选择开始日期"
                            ID="dpStartDate" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="dpEndDate" Width="180px" Required="true" Readonly="false" 
                            CompareControl="dpStartDate" DateFormatString="yyyy/MM/dd"
                            CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期" 
                            ShowLabel="false" Label="销毁统计时间段"
                            runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="btnClearDate" Text="重置起止时间" OnClick="btnClearDate_Click"></f:Button>
                        <f:ToolbarSeparator runat="server"></f:ToolbarSeparator>
                        <f:Button runat="server" ID="btnSearch" Text="查询" ValidateForms="Toolbar1" OnClick="btnSearch_Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
</body>
</html>
