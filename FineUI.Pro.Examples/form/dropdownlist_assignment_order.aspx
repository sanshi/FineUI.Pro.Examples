<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="dropdownlist_assignment_order.aspx.cs" Inherits="FineUI.Pro.Examples.form.dropdownlist_assignment_order" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>下拉列表赋值顺序</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm runat="server" ID="SimpleForm1" IsFluid="true" MaxWidth="600" Title="可编辑下拉列表" ShowHeader="true" ShowBorder="true" BodyPadding="10"
            LabelWidth="100">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList2" Label="当前选择" EnableEdit="true" ForceSelection="false">
                    <Items>
                        <f:ListItem Value="a" Text="甲" />
                        <f:ListItem Value="b" Text="乙" />
                    </Items>
                </f:DropDownList>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" ID="Toolbar1" Position="Bottom">
                    <Items>
                        <f:Button runat="server" ID="btnValueThenText" Text="清空后先赋值再写文字" OnClick="btnValueThenText_Click" CssClass="marginr" />
                        <f:Button runat="server" ID="btnTextThenValue" Text="清空后先写文字再赋值" OnClick="btnTextThenValue_Click" CssClass="marginr" />
                        <f:Button runat="server" ID="btnReadDropDownList" Text="读取赋值结果" OnClick="btnReadDropDownList_Click" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        <f:SimpleForm runat="server" ID="SimpleFormResult" IsFluid="true" MaxWidth="600" Title="后台读取结果" ShowHeader="true" ShowBorder="true" BodyPadding="10">
            <Items>
                <f:Label runat="server" ID="labResult" ShowLabel="false" Text="请先选择一种赋值顺序，再读取赋值结果。" />
            </Items>
        </f:SimpleForm>
        <br />
        <p>可编辑下拉列表清空后，最后写文字表示自由输入，最后选值则显示对应选项。</p>
        <p>先赋值再写文字：选中值为空，文字为“自定义输入”；先写文字再赋值：选中值为 a，文字为“甲”。</p>
        <p>点击“读取赋值结果”，可核对下一次回发时后台收到的选中值和文字。</p>
    </form>
</body>
</html>
