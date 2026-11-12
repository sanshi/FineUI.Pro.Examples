<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_reset.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_reset" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form BodyPadding="10px" ID="Form1" IsFluid="true" EnableCollapse="false" runat="server" Title="表单 1" IconFont="_Anchor">
            <Rows>
                <f:FormRow ColumnWidths="60% 40%">
                    <Items>
                        <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="60% 40%">
                    <Items>
                        <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="true"
                            AutoSelectFirstItem="false">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true" Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="Form1" ID="btnSubmitForm1"
                                    OnClick="btnSubmitForm1_Click">
                                </f:Button>
                                <f:Button ID="btnResetForm1" Text="重置表单1" runat="server" ClickHandler="onResetForm1Click">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <f:Form IsFluid="true" LabelWidth="100px" BodyPadding="10px" EnableCollapse="false" ID="Form2" runat="server" Title="表单 2">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label3" Label="电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" EmptyText="请输入常用电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址！" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" Required="true" EmptyText="请选择审批人" runat="server" ShowRedStar="true"
                            AutoSelectFirstItem="false" EnableMultiSelect="true">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                            <f:ListItem Text="老大丁" Value="3"></f:ListItem>
                            <f:ListItem Text="老大戊" Value="4"></f:ListItem>
                            <f:ListItem Text="老大己" Value="5"></f:ListItem>
                            <f:ListItem Text="老大庚" Value="6"></f:ListItem>
                            <f:ListItem Text="老大辛" Value="7"></f:ListItem>
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" EmptyText="请输入申请数量" MaxValue="1000" Required="true"
                            runat="server" ShowRedStar="true" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="true" Required="true">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:Button ID="btnSubmitForm2" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
                                    ValidateForms="Form2">
                                </f:Button>
                                <f:Button ID="btnResetForm2" Text="重置表单2" runat="server" ClickHandler="onResetForm2Click">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <f:Button ID="btnSubmitAll" Text="验证两个表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitAll_Click" ValidateForms="Form1,Form2">
        </f:Button>
        <f:Button ID="btnResetAll" Text="重置表单1和表单2" runat="server" ClickHandler="onResetAllClick">
        </f:Button>


    </form>
    <script>
        var Form1ClientID = '<%= Form1.ClientID %>';
        var Form2ClientID = '<%= Form2.ClientID %>';

        function onResetForm1Click(event) {
            F(Form1ClientID).reset();
        }

        function onResetForm2Click(event) {
            F(Form2ClientID).reset();
        }

        function onResetAllClick(event) {
            F(Form1ClientID).reset();
            F(Form2ClientID).reset();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示分别重置某个表单或同时重置两个表单，恢复初始值并清除验证错误。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>只重置一个表单</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="表单 1">表单 1</strong> 填写文本、选择下拉项并勾选<strong class="example-control-reference" data-example-control="<%= CheckBox1.ClientID %>" title="复选框">复选框</strong>，同时在<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="表单 2">表单 2</strong> 填写一些内容。<br />
                    结果：两组表单各自保留当前输入。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnResetForm1.ClientID %>" title="重置表单1">重置表单1</strong>。<br />
                    结果：<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="表单 1">表单 1</strong> 恢复初始状态：文本为空、下拉项未选、<strong class="example-control-reference" data-example-control="<%= CheckBox1.ClientID %>" title="复选框">复选框</strong>未选中；<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="表单 2">表单 2</strong> 的输入保持不变。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>清除错误并重置全部</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSubmitAll.ClientID %>" title="验证两个表单并提交">验证两个表单并提交</strong>。<br />
                    结果：未填写的必填项和格式错误显示在对应字段上。
                </li>
                <li>
                    关闭验证提示，点击<strong class="example-control-reference" data-example-control="<%= btnResetAll.ClientID %>" title="重置表单1和表单2">重置表单1和表单2</strong>。<br />
                    结果：两个表单都恢复初始值，验证错误清除；重置在浏览器完成，无需回发。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>设置属性 <code>Required</code>="<code>true</code>" 和 <code>AutoSelectFirstItem</code>="<code>false</code>"，这样初始没有选中值，提交表单时不能为空。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>reset()</code>（<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="表单 1">表单 1</strong>、<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="表单 2">表单 2</strong>）：恢复表单的初始字段值，并清除当前验证错误；可以针对一个表单或逐个重置多个表单。</li>
            </ul>
        </section>
    </template>
</body>
</html>
