<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_radiobuttonlist.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_radiobuttonlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉单选框列表" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="RadioButtonList1" Value="js" EnableMultiSelect="false">
                    <PopPanel>
                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true"
                            ShowBorder="true" ShowHeader="false" Hidden="true">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="请选择一种编程语言："></f:Label>
                                <f:RadioButtonList ID="RadioButtonList1" ColumnNumber="1" runat="server">
                                    <f:RadioItem Text="C#" Value="csharp" />
                                    <f:RadioItem Text="JavaScript" Value="js" />
                                    <f:RadioItem Text="JAVA" Value="java" />
                                    <f:RadioItem Text="Ruby" Value="ruby" />
                                </f:RadioButtonList>
                            </Items>
                        </f:SimpleForm>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        注：列表项的值不能为空字符串。
    </form>
</body>
</html>
