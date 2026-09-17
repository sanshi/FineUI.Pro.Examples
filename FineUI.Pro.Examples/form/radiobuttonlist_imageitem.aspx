<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobuttonlist_imageitem.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.radiobuttonlist_imageitem" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="220px" EnableCollapse="false"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true" Title="单选框列表 - 图标选项（可信 HTML）">
            <Items>
                <f:RadioButtonList ID="RadioButtonList1" runat="server" Label="① DataBind + DataTextRaw（自动绑定）" ColumnNumber="4">
                </f:RadioButtonList>
                <f:RadioButtonList ID="RadioButtonList2" runat="server" Label="② OnItemDataBound（逐项事件回调）" ColumnNumber="4" OnItemDataBound="RadioButtonList2_ItemDataBound">
                </f:RadioButtonList>
                <f:RadioButtonList ID="RadioButtonList3" runat="server" Label="③ 手工构建 Items（TextRawHtml）" ColumnNumber="4">
                </f:RadioButtonList>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Bottom" runat="server" ToolbarAlign="Right">
                    <Items>
                        <f:Button runat="server" ID="btnSubmit" Text="获取选中值" OnClick="btnSubmit_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        注：三种方式（数据绑定 + DataTextRaw、OnItemDataBound、手工构建 Items）实现的功能与安全性完全等价，区别只是数据供给方式。
        三者都只信任图标模板骨架与 URL，数据字段（名称）均经 HtmlEncode 转义，杜绝 XSS。
    </form>
</body>
</html>
