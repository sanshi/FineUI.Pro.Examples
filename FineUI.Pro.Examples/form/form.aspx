<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form.aspx.cs" Inherits="FineUI.Pro.Examples.form.form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        #Form2 .f-panel-body .f-field {
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form IsFluid="true" BodyPadding="10px" ID="Form1" LabelWidth="100px" EnableCollapse="false" runat="server" Title="表单 1" RedStarPosition="AfterText">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框" Required="true">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:CheckBox ID="CheckBox2" runat="server" Text="复选框" Label="复选框" DisplayType="Switch" Required="true">
                        </f:CheckBox>
                        <f:RadioButton ID="RadioButton1" runat="server" Text="单选框" Label="单选框" Required="true">
                        </f:RadioButton>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="50% 50%">
                    <Items>
                        <f:DropDownList ID="DropDownList1" runat="server" Required="true" ShowRedStar="true" AutoSelectFirstItem="false" Label="下拉列表">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="2"></f:ListItem>
                            <f:ListItem Text="可选项 3" Value="3"></f:ListItem>
                            <f:ListItem Text="可选项 4" Value="4"></f:ListItem>
                            <f:ListItem Text="可选项 5" Value="5"></f:ListItem>
                            <f:ListItem Text="可选项 6" Value="6"></f:ListItem>
                            <f:ListItem Text="可选项 7" Value="7"></f:ListItem>
                            <f:ListItem Text="可选项 8" Value="8"></f:ListItem>
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
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL" RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" Required="true" ShowRedStar="true" EmptyText="请选择审批人"
                            AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                            <f:ListItem Text="老大丁" Value="3"></f:ListItem>
                            <f:ListItem Text="老大午" Value="4"></f:ListItem>
                            <f:ListItem Text="老大己" Value="5"></f:ListItem>
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" MaxValue="1000" Required="true" runat="server"
                            ShowRedStar="true" />
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
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <f:Button ID="btnSubmitAll" Text="验证两个表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitAll_Click" ValidateForms="Form1,Form2">
        </f:Button>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示分别验证一个表单或同时验证两个表单，验证范围由提交按钮指定。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>只验证当前表单</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="表单 1">表单 1</strong> 的<strong
                        class="example-control-reference" data-example-control="<%= btnSubmitForm1.ClientID %>" title="第 1 个面板的验证此表单并提交">第 1
                        个面板的验证此表单并提交</strong>、<strong class="example-control-reference" data-example-control="<%= btnSubmitForm2.ClientID %>"
                        title="第 2 个面板的验证此表单并提交">第 2 个面板的验证此表单并提交</strong>。<br />
                    结果：空的必填选择和文本会阻止提交；<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="表单 2">表单 2</strong>
                    的字段不影响这次检查。
                </li>
                <li>
                    关闭提示，在<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="表单 1">表单 1</strong> 勾选复选框、开关和<strong
                        class="example-control-reference" data-example-control="<%= RadioButton1.ClientID %>" title="单选框">单选框</strong>，选择一个下拉项并输入文本，再次提交。<br />
                    结果：通过后仅提交并显示<strong class="example-control-reference" data-example-control="<%= Form1.ClientID %>" title="表单 1">表单 1</strong> 的当前字段值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>同时验证两组字段</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSubmitAll.ClientID %>" title="验证两个表单并提交">验证两个表单并提交</strong>。<br />
                    结果：两个表单都参与验证；<strong class="example-control-reference" data-example-control="<%= Form2.ClientID %>" title="表单 2">表单 2</strong>
                    需要有效邮箱、<strong class="example-control-reference" data-example-control="<%= DropDownList3.ClientID %>"
                        title="审批人">审批人</strong>、<code>0</code> 到 <code>1000</code> 的非负整数数量和说明。
                </li>
                <li>
                    关闭提示，补齐两个表单的必填项，再点击同一按钮。<br />
                    结果：后台收到请求后显示两个表单的字段值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ValidateForms</code>（<strong class="example-control-reference" data-example-control="<%= btnSubmitForm1.ClientID %>"
                        title="第 1 个面板的验证此表单并提交">第 1 个面板的验证此表单并提交</strong>、<strong class="example-control-reference"
                        data-example-control="<%= btnSubmitForm2.ClientID %>" title="第 2 个面板的验证此表单并提交">第 2 个面板的验证此表单并提交</strong>、<strong
                        class="example-control-reference" data-example-control="<%= btnSubmitAll.ClientID %>" title="验证两个表单并提交">验证两个表单并提交</strong>）：单表单按钮分别指定
                    <code>Form1</code> 或 <code>Form2</code>，联合按钮指定 <code>Form1</code>,<code>Form2</code>。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
