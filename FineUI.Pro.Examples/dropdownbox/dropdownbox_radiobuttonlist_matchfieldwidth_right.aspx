<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_radiobuttonlist_matchfieldwidth_right.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_radiobuttonlist_matchfieldwidth_right" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="VBox" BodyPadding="10px" BoxConfigPosition="Start" BoxConfigAlign="End" ShowHeader="true"
            Title="面板（Layout=VBox BoxConfigPosition=End）">
            <Items>
                <f:Panel runat="server" ShowHeader="false" ShowBorder="false" Width="400px" Height="100px"></f:Panel>
                <f:SimpleForm ID="SimpleForm1" BodyPadding="10px" runat="server" Width="400px" EnableCollapse="false"
                    ShowBorder="true" Title="下拉单选框列表（MatchFieldWidth）" ShowHeader="true">
                    <Items>
                        <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="RadioButtonList1" Value="js" 
                            MatchFieldWidth="false" EnableMultiSelect="false">
                            <PopPanel>
                                <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true"
                                    ShowBorder="true" ShowHeader="false" Hidden="true" Width="650px">
                                    <Items>
                                        <f:Label ID="Label1" runat="server" Text="请选择一种编程语言："></f:Label>
                                        <f:RadioButtonList ID="RadioButtonList1" ColumnNumber="3" runat="server">
                                            <f:RadioItem Text="C#" Value="csharp" />
                                            <f:RadioItem Text="JavaScript" Value="js" />
                                            <f:RadioItem Text="JAVA" Value="java" />
                                            <f:RadioItem Text="Ruby" Value="ruby" />
                                            <f:RadioItem Text="PHP" Value="php" />
                                            <f:RadioItem Text="Objective-C" Value="objc" />
                                            <f:RadioItem Text="Python" Value="python" />
                                            <f:RadioItem Text="Perl" Value="perl" />
                                            <f:RadioItem Text="C++" Value="cplusplus" />
                                            <f:RadioItem Text="Basic" Value="basic" />
                                            <f:RadioItem Text="Go" Value="go" />
                                            <f:RadioItem Text="Swift" Value="swift" />
                                        </f:RadioButtonList>
                                    </Items>
                                </f:SimpleForm>
                            </PopPanel>
                        </f:DropDownBox>
                        <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                        </f:Button>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
