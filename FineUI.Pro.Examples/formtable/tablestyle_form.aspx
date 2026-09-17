<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablestyle_form.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablestyle_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" IsFluid="true" LabelWidth="100px" runat="server"
            ShowBorder="false" ShowHeader="false" EnableTableStyle="true" MessageTarget="Qtip">
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
                        <f:DropDownList ID="DropDownList1" runat="server" Required="true" ShowRedStar="true" AutoSelectFirstItem="false" Label="下拉列表">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                            Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="Form1"
            ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click" MarginTop="5px">
        </f:Button>
        <br />
        <br />
        <f:Form IsFluid="true" LabelWidth="100px" ID="Form2" runat="server"
            ShowBorder="false" ShowHeader="false" EnableTableStyle="true" MessageTarget="Qtip">
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
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" ForceSelection="false" Required="true" ShowRedStar="true"
                            EmptyText="请选择审批人" AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
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
            </Rows>
        </f:Form>
        <f:Button ID="btnSubmitForm2" Text="验证此表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
            ValidateForms="Form2" MarginTop="5px">
        </f:Button>
        <br />
        <f:Button ID="btnSubmitAll" Text="验证两个表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitAll_Click"
            ValidateForms="Form1,Form2" MarginTop="5px">
        </f:Button>
    </form>
</body>
</html>
