<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_compare_readonly.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_compare_readonly" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelWidth="200px"  EnableCollapse="false"
        runat="server"  ShowBorder="true" ShowHeader="true"
        Title="简单表单">
        <Items>
            <f:DatePicker ID="DatePicker1" Label="开始日期" Required="true" Readonly="true" runat="server">
            </f:DatePicker>
            <f:DatePicker ID="DatePicker2" Label="结束日期（大于开始日期）" Required="true" CompareControl="DatePicker1"
                CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期！" Readonly="true" runat="server">
            </f:DatePicker>
            <f:Button ID="btnUpdateDatePicker" Text="更新开始日期和结束日期" OnClick="btnUpdateDatePicker_Click" runat="server">
            </f:Button>
            <f:Label runat="server">
            </f:Label>
            <f:TextBox ID="TextBox1" Required="true" Label="文本框 1" Text="FineUI.Pro" Readonly="true" runat="server">
            </f:TextBox>
            <f:TextBox ID="TextBox2" Required="true" Label="文本框 2（等于文本框 1）" CompareControl="TextBox1"
                CompareOperator="Equal" CompareMessage="文本框 2 应该等于文本框 1！" Readonly="true" runat="server">
            </f:TextBox>
            <f:Label runat="server">
            </f:Label>
            <f:NumberBox ID="NumberBox1" Required="true" Label="数字框 1" Text="30" Readonly="true" runat="server">
            </f:NumberBox>
            <f:NumberBox ID="NumberBox2" Required="true" Label="数字框 2（大于等于数字框 1）" CompareControl="NumberBox1"
                CompareOperator="GreaterThanEqual" CompareMessage="数字框 2 应该大于等于数字框 1!" Readonly="true" runat="server">
            </f:NumberBox>
            <f:Label runat="server">
            </f:Label>
            <f:Label ID="Label1" runat="server" Label="标签 1" Text="88">
            </f:Label>
            <f:NumberBox ID="NumberBox3" Required="true" Label="文本框 3（大于等于标签 1）" CompareControl="Label1"
                CompareOperator="GreaterThanEqual" CompareType="Int" CompareMessage="文本框 3 应该大于等于标签 1！" Readonly="true"
                runat="server">
            </f:NumberBox>
            <f:Label runat="server">
            </f:Label>
            <f:Button ID="btnSubmit" ValidateForms="SimpleForm1" CssClass="marginr" Text="提交表单" runat="server">
            </f:Button>
            <f:Button ID="btnReset" Text="重置表单" runat="server" ClickHandler="onResetClick">
            </f:Button>
        </Items>
    </f:SimpleForm>
    </form>
    <script>

        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }

    </script>
</body>
</html>
