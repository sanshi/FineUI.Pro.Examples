<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_prefix_suffix.aspx.cs" Inherits="FineUI.Pro.Examples.form.form_prefix_suffix" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Right"
            Title="简单表单" runat="server">
            <Items>
                <f:NumberBox Label="人民币金额" ID="NumberBox2"
                    NoDecimal="true" NoNegative="true" Required="true" EnableSuffix="true" Suffix="万元" runat="server" />
                <f:NumberBox Label="美元金额" ID="NumberBox6"
                    NoDecimal="true" NoNegative="true" Required="true" EnablePrefix="true" Prefix="$" runat="server" />
                <f:TextBox Label="文本输入框" ID="TextBox1" Required="true"
                    EnablePrefix="true" Prefix="前缀"
                    EnableSuffix="true" Suffix="后缀" runat="server" />
                <f:DropDownList runat="server" ID="DropDownList1" Label="下拉列表"
                    EnablePrefix="true" Prefix="前缀"
                    EnableSuffix="true" Suffix="后缀"
					AutoSelectFirstItem="false" Required="true">
                    <f:ListItem Text="可选项1" Value="Value1" />
                    <f:ListItem Text="可选项2" Value="Value2" />
                    <f:ListItem Text="可选项3" Value="Value3" />
                </f:DropDownList>
                <f:FileUpload runat="server" ID="filePhoto" EmptyText="请选择一张照片" Label="个人头像" Required="true" ButtonIcon="Add"
                    ShowRedStar="true" EnablePrefix="true" Prefix="前缀" EnableSuffix="true" Suffix="后缀">
                </f:FileUpload>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
