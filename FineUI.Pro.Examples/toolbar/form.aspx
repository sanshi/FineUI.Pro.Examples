<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .thisform {
            position: absolute;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" FormMessageTarget="Qtip" />
        <%--<f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Height="500px" runat="server" EnableCollapse="false"
            >
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Left">
                    <Items>
                        <f:Form BodyPadding="10px" ID="Form2" LabelWidth="100px" EnableCollapse="false"
                            runat="server" Title="表单">
                            <Rows>
                                <f:FormRow ColumnWidths="40% 60%">
                                    <Items>
                                        <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                                        </f:Label>
                                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                                        </f:CheckBox>
                                    </Items>
                                </f:FormRow>
                                <f:FormRow ColumnWidths="40% 60%">
                                    <Items>
                                        <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                                        </f:DropDownList>
                                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                                            Text="">
                                        </f:TextBox>
                                    </Items>
                                </f:FormRow>
                            </Rows>
                        </f:Form>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
     RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>--%>
        <br />
        <br />
        <f:Form CssClass="thisform" BodyPadding="10px" ID="Form3" LabelWidth="100px" EnableCollapse="false" runat="server" Title="表单">
            <Rows>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:Label ID="Label2" runat="server" Label="标签" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox2" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:DropDownList ID="DropDownList2" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="true"
                            AutoSelectFirstItem="false">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox2" ShowRedStar="true" runat="server" Label="文本框" Required="true" Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
