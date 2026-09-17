<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_compare_numberbox.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_compare_numberbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelWidth="200px" EnableCollapse="false"
        runat="server"  ShowBorder="true" ShowHeader="true" Title="简单表单" LabelAlign="Top">
        <Items>
            <f:NumberBox ID="NumberBox1" Required="true" Label="数字框 1（必填项）" runat="server">
            </f:NumberBox>
            <f:NumberBox ID="NumberBox2" Required="true" Label="数字框 2（必填项，大于等于数字框 1）" CompareControl="NumberBox1"
                CompareOperator="GreaterThanEqual" CompareMessage="数字框 2 应该大于等于数字框 1!" runat="server">
            </f:NumberBox>
            <f:NumberBox ID="NumberBox3" Label="数字框 3（可为空）" runat="server">
            </f:NumberBox>
            <f:NumberBox ID="NumberBox4" Label="数字框 4（可为空，大于等于数字框 3）" CompareControl="NumberBox3"
                CompareOperator="GreaterThanEqual" CompareMessage="数字框 4 应该大于等于数字框 3!" runat="server">
            </f:NumberBox>
            <f:Button ID="btnSubmit" ValidateForms="SimpleForm1" OnClick="btnSubmit_Click" CssClass="marginr" Text="提交表单" runat="server">
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
