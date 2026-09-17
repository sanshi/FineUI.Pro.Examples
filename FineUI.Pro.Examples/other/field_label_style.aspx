<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="field_label_style.aspx.cs"
    Inherits="FineUI.Pro.Examples.other.field_label_style" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .red .f-field-fieldlabel {
            color: Red;
            font-weight: bold;
        }

        .blue .f-field-fieldlabel {
            color: Blue;
            font-weight: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" LabelAlign="Right"
            Title="简单表单" runat="server">
            <Items>
                <f:TextBox runat="server" Label="用户名" EmptyText="输入用户名" Text="张三"
                    ID="tbxUserName">
                </f:TextBox>
                <f:TextBox runat="server" Label="密码" TextMode="Password"
                    ID="tbxPassword">
                </f:TextBox>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnSwitchClass" Text="改变 Label 的样式" runat="server" OnClick="btnSwitchClass_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
    </form>
</body>
</html>
