<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobuttonlist_itemdatabound.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.radiobuttonlist_itemdatabound" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="160px" EnableCollapse="false"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true"
            Title="简单表单">
            <Items>
                <f:RadioButtonList ID="RadioButtonList1" Label="列表一" runat="server">
                    <f:RadioItem Text="可选项 1" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                    <f:RadioItem Text="可选项 3" Value="value3" />
                </f:RadioButtonList>
                <f:RadioButtonList ID="RadioButtonList2" Label="列表二（一列）" ColumnNumber="1" OnItemDataBound="RadioButtonList2_ItemDataBound" runat="server">
                </f:RadioButtonList>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Bottom" runat="server" ToolbarAlign="Right">
                    <Items>
                        <f:Button runat="server" ID="btnSubmit" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        注：通过列表项绑定事件，可以动态设置每一项的属性（本例为每个列表项增加提示信息）。
    </form>
</body>
</html>
