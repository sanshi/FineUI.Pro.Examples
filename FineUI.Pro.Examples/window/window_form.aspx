<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_form.aspx.cs"
    Inherits="FineUI.Pro.Examples.window.window_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" EnableMaximize="true" EnableCollapse="false" runat="server"
            EnableResize="true" BodyPadding="10px" Layout="Fit" IsModal="false">
            <Items>
                <f:Form BodyPadding="10px" ID="Form2" LabelWidth="100px" ShowBorder="false" ShowHeader="false" runat="server" Title="表单 1">
                    <Rows>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                                </f:Label>
                                <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                                </f:CheckBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                                    <f:ListItem Text="可选项1" Value="Value1" />
                                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                                    <f:ListItem Text="可选项4" Value="Value4" />
                                    <f:ListItem Text="可选项5" Value="Value5" />
                                    <f:ListItem Text="可选项6" Value="Value6" />
                                    <f:ListItem Text="可选择项7" Value="Value7" />
                                    <f:ListItem Text="可选择项8" Value="Value8" />
                                </f:DropDownList>
                                <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true" Text="">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar3" Position="Top" runat="server">
                    <Items>
                        <f:ToolbarText Text="工具条文本一" ID="ToolbarText3" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText Text="工具条文本二" ID="ToolbarText4" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="Button1" runat="server" Text="工具栏按钮" OnClick="Button1_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button runat="server" Text="验证此表单并提交" ValidateForms="Form2" ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click">
                        </f:Button>
                        <f:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="关闭窗体">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在窗体中容纳完整表单，并在窗体工具栏提交该表单的字段。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>只验证窗体中的表单</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSubmitForm1").ClientID %>'
                        title="验证此表单并提交">验证此表单并提交</strong>。<br />结果：必填下拉列表和文本框未填写时显示验证提示，窗体保持打开。</li>
                <li>为<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownList1").ClientID %>'
                        title="下拉列表">下拉列表</strong>选择可选项1，在<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>' title="文本框">文本框</strong>输入
                    <code>窗体表单测试</code>，再次提交。<br />结果：后台读取窗体表单当前字段，通知中显示提交内容。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体">窗体</strong>）：初始为
                    <code>Fit</code>，规定容器内子控件的排列和空间分配方式。
                </li>
                <li><code>ValidateForms</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSubmitForm1").ClientID %>' title="验证此表单并提交">验证此表单并提交</strong>）：初始为
                    <code>Form2</code>，提交前验证指定表单；验证失败时显示提示并阻止回发。
                </li>
                <li><code>Required</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownList1").ClientID %>' title="下拉列表">下拉列表</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox1").ClientID %>'
                        title="文本框">文本框</strong>）：初始为 <code>true</code>，要求先填写或选择该字段，未通过时阻止表单提交。</li>
            </ul>
        </section>
    </template>
</body>
</html>
