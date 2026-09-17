<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist_itemdatabound.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkboxlist_itemdatabound" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
		
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" LabelWidth="160px" BodyPadding="10px" ShowBorder="true" ShowHeader="true" Title="简单表单" runat="server">
            <Items>
                <f:CheckBoxList ID="CheckBoxList1" Label="列表一" runat="server">
                    <f:CheckItem Text="可选项 1" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                    <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                </f:CheckBoxList>
                <f:CheckBoxList ID="CheckBoxList2" Label="列表二（一列）" ColumnNumber="1" OnItemDataBound="CheckBoxList2_ItemDataBound" runat="server">
                </f:CheckBoxList>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" runat="server">
                    <Items>
                        <f:Button ID="btnSubmit" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click" runat="server"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        注：通过列表项绑定事件，可以动态设置每一项的属性（本例为每个列表项增加提示信息）。
    </form>
</body>
</html>
