<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_panel.aspx.cs" Inherits="FineUI.Pro.Examples.form.layout_panel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /*
        .btn-in-form {
            margin-bottom: 5px;
            display: table !important;
        }
        */

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="SimpleForm1" IsFluid="true" LabelAlign="Left" BodyPadding="10" RemoveLastFieldsMargin="true" Title="表单" runat="server">
            <Rows>
                <f:FormRow ID="FormRow5" ColumnWidths="50% auto">
                    <Items>
                        <f:TextBox ID="TextBox1" runat="server" Label="文本一">
                        </f:TextBox>
                        <f:Button ID="Button4" CssClass="btn-in-form" runat="server" Text="按钮一">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow6" ColumnWidths="100% auto" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox2" runat="server" Label="文本二">
                        </f:TextBox>
                        <f:Button ID="Button3" CssClass="btn-in-form" runat="server" Text="按钮二">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow7" ColumnWidths="100% auto" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox3" runat="server" Label="文本三">
                        </f:TextBox>
                        <f:Button ID="Button1" CssClass="btn-in-form" runat="server" Text="按钮三">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow8" ColumnWidths="100% auto" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox4" runat="server" Label="文本四">
                        </f:TextBox>
                        <f:Button ID="Button2" CssClass="btn-in-form" runat="server" Text="按钮四">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow9" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox5" runat="server" Label="默认均分"></f:TextBox>
                        <f:Button ID="Button5" CssClass="btn-in-form" runat="server" Text="按钮五"></f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow10" ColumnWidths="50% 50%" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox6" runat="server" Label="明确均分"></f:TextBox>
                        <f:Button ID="Button6" CssClass="btn-in-form" runat="server" Text="按钮六"></f:Button>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <br />
        注：第一行使用 50% auto，后面三行使用 100% auto；最后两行分别展示默认均分和 50% 50%。
        <br />
        为表单设置 RemoveLastFieldsMargin="true" 来移除最后一行表单字段的底部外边距。
    </form>
</body>
</html>
