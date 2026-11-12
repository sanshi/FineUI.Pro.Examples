<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_simplelist.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_simplelist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（绑定到简单列表）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1">
                </f:DropDownList>
                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示将简单列表转换为下拉选项。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>对照绑定后的选项</h3>
            <ol>
                <li>
                    展开下拉列表，查看本页加载的选项。<br />
                    结果：选项来自本页数据源；显示文字和业务值按本页的绑定方式生成。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataSource</code>：提供本页绑定的数据集合，绑定后生成选项。</li>
            </ul>
        </section>
    </template>
</body>
</html>
