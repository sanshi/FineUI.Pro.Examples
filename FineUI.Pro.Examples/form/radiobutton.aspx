<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobutton.aspx.cs" Inherits="FineUI.Pro.Examples.form.radiobutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="150px" Title="简单表单" EnableCollapse="false" BodyPadding="10px" ShowBorder="true"
            ShowHeader="true">
            <Items>
                <f:RadioButton ID="rbtnSingleRadio" Label="单选框" Text="可选项" runat="server">
                </f:RadioButton>
                <f:Button ID="btnSelectSingleRadio" CssClass="marginr" Text="选择/反选单选框" OnClick="btnSelectSingleRadio_Click" runat="server">
                </f:Button>
                <f:Button ID="btnChangeCheckStatus" CssClass="marginr" Text="选择/反选单选框（客户端脚本）" runat="server" ClickHandler="onChangeCheckStatusClick"></f:Button>
                <f:Label runat="server">
                </f:Label>
                <f:RadioButton ID="rbtnFirst" Label="单选框（分组）" Checked="true" GroupName="MyRadioGroup1" Text="可选项 1" runat="server">
                </f:RadioButton>
                <f:RadioButton ID="rbtnSecond" GroupName="MyRadioGroup1" ShowEmptyLabel="true" Text="可选项 2" runat="server">
                </f:RadioButton>
                <f:RadioButton ID="rbtnThird" GroupName="MyRadioGroup1" ShowEmptyLabel="true" Text="可选项 3" runat="server">
                </f:RadioButton>
                <f:Button ID="btnSelectSecondRadio" Text="选中分组单选框中的下一个" OnClick="btnSelectSecondRadio_Click" runat="server">
                </f:Button>
                <f:Label runat="server">
                </f:Label>
                <f:RadioButton ID="rbtnFirstAuto" Label="单选框（自动回发）" Checked="true" GroupName="MyRadioGroup2" Text="可选项 1" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged">
                </f:RadioButton>
                <f:RadioButton ID="rbtnSecondAuto" GroupName="MyRadioGroup2" ShowEmptyLabel="true" Text="可选项 2" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged">
                </f:RadioButton>
                <f:RadioButton ID="rbtnThirdAuto" GroupName="MyRadioGroup2" ShowEmptyLabel="true" Text="可选项 3" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged">
                </f:RadioButton>
            </Items>
        </f:SimpleForm>
    </form>
    <script>
        var radioClientID = '<%= rbtnSingleRadio.ClientID %>';

        function onChangeCheckStatusClick(event) {
            var radio = F(radioClientID);
            radio.setValue(!radio.getValue());
        }

    </script>
</body>
</html>
