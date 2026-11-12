<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multiselect.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.multiselect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（多选，初始为空）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableMultiSelect="true" AutoSelectFirstItem="false">
                    <f:ListItem Text="可选项1" Value="Value1" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="可选择项9" Value="Value9" />
                    <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>


            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" EncodeText="false" ID="labResult">
        </f:Label>
    </form>

    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示同时保留多个选项，并以数组读取当前选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box" aria-hidden="true"></i>同时选择多个选项</h3>
            <ol>
                <li>
                    展开列表，依次选择两个可用项，再收起面板。<br />
                    结果：输入区同时保留这两个选择，再次点击已选项可以取消它。
                </li>
                <li>
                    点击本页获取选中项的按钮。<br />
                    结果：后台结果中包含当前保留的多个值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectedValueArray</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>）：后台设置选中值；获取按钮读取本次提交的当前选择。</li>
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>）：允许保留多个选中值。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
