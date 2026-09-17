<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcheckall.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcheckall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格"  EnableCollapse="false" ShowBorder="true" ShowHeader="true"
        runat="server" EnableCheckBoxSelect="true"
        EnableRowClickEvent="true" OnRowClick="Grid1_RowClick">
        <Columns>
            <f:RowNumberField />
            <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
            <f:TemplateField ColumnID="Gender" HeaderText="性别">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                </ItemTemplate>
            </f:TemplateField>
            <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
            <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
            <f:CheckBoxField ColumnID="CheckBoxField1" RenderAsStaticField="false"
                DataField="AtSchool" HeaderText="是否在校1" />
            <f:CheckBoxField ColumnID="CheckBoxField2" RenderAsStaticField="false"
                DataField="AtSchool" HeaderText="是否在校2" />
            <f:CheckBoxField ColumnID="CheckBoxField3" RenderAsStaticField="false"
                DataField="AtSchool" HeaderText="是否在校3" />
        </Columns>
    </f:Grid>
    <br />
    <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
    </f:Button>
    <br />
    <f:Label ID="labResult" EncodeText="false" runat="server">
    </f:Label>
    </form>
</body>
</html>
