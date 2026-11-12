<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_itemicon.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_itemicon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        ul.f-field-dropdownlist-pop img {
            vertical-align: middle;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="列表项图标" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1">
                    <f:ListItem Text="中国" Value="cn" Selected="true" />
                    <f:ListItem Text="法国" Value="fr" />
                    <f:ListItem Text="美国" Value="us" />
                    <f:ListItem Text="英国" Value="england" />
                    <f:ListItem Text="澳大利亚" Value="au" />
                    <f:ListItem Text="意大利" Value="it" />
                    <f:ListItem Text="加拿大" Value="ca" />
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中“澳大利亚”" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为国家选项加入国旗图标，选择后仍分别读取国家名称和代码。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照图标和业务值</h3>
            <ol>
                <li>
                    展开面板对照国家名称前的国旗图标。<br />
                    结果：国旗用于辅助识别；选择“澳大利亚”后，读取的业务值为 au。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Display</code>：自定义选项的图标和显示内容，保持原来的文字与业务值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
