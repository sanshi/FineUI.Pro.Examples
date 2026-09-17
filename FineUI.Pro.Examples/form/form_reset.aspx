<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_reset.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_reset" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form BodyPadding="10px" ID="Form1" IsFluid="true" EnableCollapse="false"
            runat="server" Title="表单 1" IconFont="_Anchor">
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
                        <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                            Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="Form1"
                                    ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click">
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
        <f:Form IsFluid="true" LabelWidth="100px" BodyPadding="10px" EnableCollapse="false"
            ID="Form2" runat="server" Title="表单 2">
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
                        <f:DropDownList ID="DropDownList3" Label="审批人" Required="true" EmptyText="请选择审批人" runat="server" ShowRedStar="true" AutoSelectFirstItem="false" EnableMultiSelect="true">
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
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" EmptyText="请输入申请数量" MaxValue="1000" Required="true" runat="server"
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
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false"
                            ShowHeader="false">
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
        <f:Button ID="btnSubmitAll" Text="验证两个表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitAll_Click"
            ValidateForms="Form1,Form2">
        </f:Button>
        <f:Button ID="btnResetAll" Text="重置表单1和表单2" runat="server" ClickHandler="onResetAllClick">
        </f:Button>
        <br />
        <br />
        注：下拉列表设置属性 Required="true" 和 AutoSelectFirstItem="false"，这样初始没有选中值，提交表单时不能为空。
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
</body>
</html>
