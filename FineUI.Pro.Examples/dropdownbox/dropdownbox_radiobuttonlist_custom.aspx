<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_radiobuttonlist_custom.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_radiobuttonlist_custom" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉单选框列表（自定义）" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="RadioButtonList1" Value="js" Text="JavaScript" EnableMultiSelect="false">
                    <PopPanel>
                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true"
                            ShowBorder="true" ShowHeader="false" Hidden="true">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="请选择一种编程语言："></f:Label>
                                <f:RadioButtonList ID="RadioButtonList1" ColumnNumber="2" runat="server">
                                    <Items>
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
                                    </Items>
                                    <Listeners>
                                        <f:Listener Event="change" Handler="onProgramLanguageChange" />
                                    </Listeners>
                                </f:RadioButtonList>
                            </Items>
                        </f:SimpleForm>
                    </PopPanel>
                    <Listeners>
                        <f:Listener Event="poppanelshow" Handler="onPopPanelShow" />
                    </Listeners>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        注：这是一个测试示例，去除两个事件本示例也一样正常工作。
    </form>
    <script>
        var DropDownBox1ID = '<%= DropDownBox1.ClientID %>';
        var RadioButtonList1ID = '<%= RadioButtonList1.ClientID %>';
        var SimpleForm2ID = '<%= SimpleForm2.ClientID %>';

        function onPopPanelShow(event) {
            var val = F(DropDownBox1ID).getValue();
            if (val) {
                F(RadioButtonList1ID).setValue(val);
            }
        }

        function onProgramLanguageChange(event) {
            // 获取单选框的选中值，以及对应的标签
            var rblCmp = F(RadioButtonList1ID);
            var programValue = rblCmp.getValue();
            var programText = rblCmp.getTextByValue(programValue);

            // 将其赋值给下拉框
            F(DropDownBox1ID).setValue(programValue, programText);

            // 隐藏弹出面板
            F(SimpleForm2ID).hide();
        }

    </script>
</body>
</html>
