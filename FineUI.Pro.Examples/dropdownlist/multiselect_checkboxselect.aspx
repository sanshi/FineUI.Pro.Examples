<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multiselect_checkboxselect.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.multiselect_checkboxselect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（多选复选框）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableMultiSelect="true" EnableCheckBoxSelect="true">
                    <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" Selected="true" />
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
            <p>在下拉面板中多项选择，通过复选框逐项选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box" aria-hidden="true"></i>通过复选框多选</h3>
            <ol>
                <li>
                    展开面板，勾选两个可用项，再取消其中一个。<br />
                    结果：面板使用复选框表达选择，取消其中一项后，其它已选内容继续保留。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableCheckBoxSelect</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>）：在下拉项旁显示复选框，便于逐项选择和取消。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
