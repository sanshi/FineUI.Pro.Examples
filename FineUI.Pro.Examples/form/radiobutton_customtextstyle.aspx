<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobutton_customtextstyle.aspx.cs" Inherits="FineUI.Pro.Examples.form.radiobutton_customtextstyle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <style>
        /* :checked 伪类选择器：https://developer.mozilla.org/en-US/docs/Web/CSS/:checked */
        /* :has() 关系伪类选择器：https://developer.mozilla.org/en-US/docs/Web/CSS/:has */
        /* 选中的单选框/复选框，其所在字段单元格内的文字标签变红 */
        /* 说明：FineUI 渲染的 DOM 中 <input> 与文字 label 并非兄弟节点（label 嵌在 .f-field-checkboxct 内部），因此无法使用兄弟选择器（~ / +）；改用 :has() 从"包含选中 input"的字段单元格
           向内匹配文字标签 */
        .f-field-body-cell:has(input.f-field-checkbox:checked) .f-field-body-checkboxlabel {
            color: red;
        }

    </style>

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

        <br />
        <br />
        注：本示例使用 CSS 关系伪类 <code>:has()</code> 让"选中"的单选框文字变红。
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
