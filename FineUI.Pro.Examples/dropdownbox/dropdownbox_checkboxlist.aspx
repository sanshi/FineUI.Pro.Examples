<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_checkboxlist.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_checkboxlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉复选框列表" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="RadioButtonList1" EnableMultiSelect="true" Values="js,php">
                    <PopPanel>
                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true"
                            ShowBorder="true" ShowHeader="false" Hidden="true">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="请选择编程语言："></f:Label>
                                <f:CheckBoxList ID="RadioButtonList1" ColumnNumber="3" runat="server">
                                    <f:CheckItem Text="C#" Value="csharp" />
                                    <f:CheckItem Text="JavaScript" Value="js" />
                                    <f:CheckItem Text="JAVA" Value="java" />
                                    <f:CheckItem Text="Ruby" Value="ruby" />
                                    <f:CheckItem Text="PHP" Value="php" />
                                    <f:CheckItem Text="Objective-C" Value="objc" />
                                    <f:CheckItem Text="Python" Value="python" />
                                    <f:CheckItem Text="Perl" Value="perl" />
                                    <f:CheckItem Text="C++" Value="cplusplus" />
                                    <f:CheckItem Text="Basic" Value="basic" />
                                    <f:CheckItem Text="Go" Value="go" />
                                    <f:CheckItem Text="Swift" Value="swift" />
                                </f:CheckBoxList>
                            </Items>
                        </f:SimpleForm>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnSelectItem6" Text="选中[php,basic]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
</body>
</html>
