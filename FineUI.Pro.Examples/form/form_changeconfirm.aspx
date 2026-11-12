<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_changeconfirm.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_changeconfirm" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" EnableFormChangeConfirm="true" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" ShowBorder="true" EnableCollapse="false" Title="表单" ShowHeader="true" AutoScroll="true" BodyPadding="10px"
            runat="server">
            <Items>

                <f:NumberBox ID="NumberBox1" Label="数字输入框" Required="true" ShowRedStar="true" runat="server" />
                <f:CheckBox ID="CheckBox1" runat="server" Label="复选框">
                </f:CheckBox>
                <f:TextBox ID="TextBox1" Label="文本输入框" runat="server" ShowRedStar="true" Required="true">
                </f:TextBox>
                <f:DatePicker ID="DatePicker1" runat="server" SelectedDate="2008-05-09" Label="日期选择器" Text="2008-05-09">
                </f:DatePicker>
                <f:TextBox ID="TextBox2" Label="默认隐藏的字段" runat="server" Hidden="true">
                </f:TextBox>
                <f:DropDownList Label="下拉列表" runat="server" ID="DropDownList1">
                    <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                    <f:ListItem Text="可选择项9" Value="Value9" />
                    <f:ListItem Text="可选择项10" Value="Value10" />
                    <f:ListItem Text="可选择项11" Value="Value11" />
                    <f:ListItem Text="可选择项12" Value="Value12" />
                    <f:ListItem Text="可选择项13" Value="Value13" />
                    <f:ListItem Text="可选择项14" Value="Value14" />
                    <f:ListItem Text="可选择项15" Value="Value15" />
                    <f:ListItem Text="可选择项16" Value="Value16" />
                </f:DropDownList>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" runat="server">
                    <Items>
                        <f:Button Text="刷新本页面" ID="btnClose" Icon="SystemClose" runat="server" ClickHandler="onCloseClick"></f:Button>
                        <f:Button ID="btnClosePostBack" Text="保存数据" ValidateForms="SimpleForm1" OnClick="btnClosePostBack_Click" Icon="SystemSave"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
    </form>
    <script>
        function onCloseClick(event) {
            window.location.reload();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示表单有未保存修改时，在离开页面前提示确认，保存后清除修改标记。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>有修改时确认离开</h3>
            <ol>
                <li>
                    勾选<strong class="example-control-reference" data-example-control="<%= CheckBox1.ClientID %>"
                        title="复选框">复选框</strong>或修改日期；若本页有可编辑表格，也可单击姓名单元格修改姓名。<br />
                    结果：表单或表格产生未保存的修改标记。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnClose.ClientID %>"
                        title="刷新本页面">刷新本页面</strong>，在浏览器确认框中选择留在页面。<br />
                    结果：取消离开后仍留在原页，刚才的输入保留；确认框的样式和文字由浏览器决定。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>保存后清除修改标记</h3>
            <ol>
                <li>
                    给<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>"
                        title="数字输入框">数字输入框</strong>填写<code>1</code>，给<strong class="example-control-reference" data-example-control="<%= TextBox1.ClientID %>"
                        title="文本输入框">文本输入框</strong>填写<code>demo</code>，点击<strong class="example-control-reference"
                        data-example-control="<%= btnClosePostBack.ClientID %>" title="保存数据">保存数据</strong>。<br />
                    结果：客户端验证通过后回发，后台清除表单修改标记。
                </li>
                <li>
                    再次刷新；保存后不要再改字段。<br />
                    结果：当前已无待保存修改时，不再因为该表单或表格弹出放弃修改提示；继续修改后会重新提示。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>修改后从示例窗口或选项卡离开时，可对照<a href='<%= PageContext.ResolveUrl("~/res/images/formchangeconfirm.png") %>' target="_blank"
                    rel="noopener">确认关闭图示</a>；刷新或关闭浏览器时，提示样式与文字由浏览器决定。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableFormChangeConfirm</code>（<strong>PageManager 页面配置</strong>）：<strong>PageManager 页面配置</strong> 本页设为 <code>true</code>，在离开前检测表单修改。
                </li>
                <li><code>isDirty()</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>"
                        title="数字输入框">数字输入框</strong>、<strong class="example-control-reference" data-example-control="<%= CheckBox1.ClientID %>"
                        title="复选框">复选框</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox1.ClientID %>"
                        title="文本输入框">文本输入框</strong>、<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>"
                        title="日期选择器">日期选择器</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>"
                        title="默认隐藏的字段">默认隐藏的字段</strong>、<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：判断表单当前字段值相对已接受状态是否改变。</li>
                <li><code>ClearDirty()</code>（<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>"
                        title="表单">表单</strong>）：保存成功后接受当前表单值作为新基准，不清空输入。</li>
            </ul>
        </section>
    </template>
</body>
</html>
