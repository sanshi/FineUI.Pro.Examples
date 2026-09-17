<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_checkboxlist_selectall.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_checkboxlist_selectall" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="CheckBoxList1" EnableMultiSelect="true" Values="js,php">
                    <PopPanel>
                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true"
                            ShowBorder="true" ShowHeader="false" Hidden="true">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="请选择编程语言："></f:Label>
                                <f:CheckBoxList ID="CheckBoxList1" ColumnNumber="3" runat="server">
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
                            <Toolbars>
                                <f:Toolbar runat="server" Position="Top">
                                    <Items>
                                        <f:Button runat="server" ID="btnSelectAll" Text="全选" ClickHandler="onSelectAllClick"></f:Button>
                                        <f:Button runat="server" ID="btnClearAll" Text="清空" ClickHandler="onClearAllClick"></f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
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

    <script>

        var dropDownBox1ClientID = '<%= DropDownBox1.ClientID %>';
        var checkBoxList1ClientID = '<%= CheckBoxList1.ClientID %>';

        function onSelectAllClick(event) {
            var checkBoxList1 = F(checkBoxList1ClientID);
            $.each(checkBoxList1.items, function (index, item) {
                item.setValue(true);
            });

            // 将数据控件中的值同步到输入框
            F(dropDownBox1ClientID).syncToBox();
        }


        function onClearAllClick(event) {
            var checkBoxList1 = F(checkBoxList1ClientID);
            $.each(checkBoxList1.items, function (index, item) {
                item.setValue(false);
            });

            // 将数据控件中的值同步到输入框
            F(dropDownBox1ClientID).syncToBox();
        }


    </script>
</body>
</html>
