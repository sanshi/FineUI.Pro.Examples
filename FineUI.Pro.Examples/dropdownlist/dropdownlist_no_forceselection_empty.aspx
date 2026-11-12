<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_no_forceselection_empty.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_no_forceselection_empty" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（用户输入值，初始值，下拉选项为空）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableEdit="true" AutoSelectFirstItem="false" ForceSelection="false">
                </f:DropDownList>
                <f:Button ID="btnRebindData" Text="重新绑定数据" runat="server" OnClick="btnRebindData_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnSetText" Text="更新为[用户输入值]" runat="server" OnClick="btnSetText_Click" CssClass="marginr">
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
            <p>演示列表没有选项时仍可显示自定义初始文字，并在填充或清空选项后核对状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>填充选项后选择并读取</h3>
            <ol>
                <li>
                    从刚打开、下拉选项为空的状态开始，点击“重新绑定数据”，再展开列表。<br />
                    结果：后台绑定可选项1至可选择项9，原本为空的列表可以选择。
                </li>
                <li>
                    选择“可选项6”。<br />
                    结果：输入区显示“可选项6”，当前值来自列表选项。
                </li>
                <li>
                    点击“获取此下拉列表的选中项”。<br />
                    结果：回发后由后台显示当前文字和选中值；后台读取本次选择。
                </li>
                <li>
                    再次点击“重新绑定数据”，再展开列表。<br />
                    结果：后台清空全部选项；再次点击同一按钮可重新填充。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>下拉列表的属性设置为：</p>
            <ul>
                <li>AutoSelectFirstItem="false"：初始不强制选中第一项</li>
                <li>EnableEdit="true"：可以手工编辑</li>
                <li>ForceSelection="false"：用户输入值</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Text</code>：初始没有绑定列表项，仍可直接提供显示文字；文字不要求来自当前列表。</li>
            </ul>
        </section>
    </template>
</body>
</html>
