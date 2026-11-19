<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_checkboxlist_selectall.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_checkboxlist_selectall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉复选框列表"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="CheckBoxList1" EnableMultiSelect="true" Values="js,php">
                    <PopPanel>
                        <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true" ShowBorder="true" ShowHeader="false" Hidden="true">
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
                <f:Button ID="btnSelectItem6" Text="选中[php,basic]" runat="server" OnClick="btnSelectItem6_Click" CssClass="marginr">
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
            $.each(checkBoxList1.items, function(index, item) {
                item.setValue(true);
            });

            // 将数据控件中的值同步到输入框
            F(dropDownBox1ClientID).syncToBox();
        }


        function onClearAllClick(event) {
            var checkBoxList1 = F(checkBoxList1ClientID);
            $.each(checkBoxList1.items, function(index, item) {
                item.setValue(false);
            });

            // 将数据控件中的值同步到输入框
            F(dropDownBox1ClientID).syncToBox();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在下拉面板内多选编程语言，支持全选和清空。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>全选与清空</h3>
            <ol>
                <li>
                    展开面板后点击<strong class="example-control-reference" data-example-control="<%= btnSelectAll.ClientID %>" title="全选">全选</strong>。<br />
                    结果：所有编程语言项都被选中，<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="下拉框">下拉框</strong>显示完整选择集合。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnClearAll.ClientID %>" title="清空">清空</strong>。<br />
                    结果：全部选择被清除，再获取值时显示<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="下拉框">下拉框</strong>为空。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>syncToBox()</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="下拉框">下拉框</strong>）：脚本批量操作弹出数据控件后，把新的选择文字和值同步回下拉输入区。</li>
                <li><code>DataControlID</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="下拉框">下拉框</strong>）：指定弹出面板中提供选择数据的控件。 本页声明值为 <code>CheckBoxList1</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
