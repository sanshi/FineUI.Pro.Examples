<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_selectrow_updown.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_edit_selectrow_updown" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name" EnableMultiSelect="true" ArrowKeySelection="false">
            <Columns>
                <f:TemplateField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:TemplateField ColumnID="Group" HeaderText="分组">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxGroupName" runat="server" Width="60px"
                            Text='<%# Eval("Group") %>'></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        注：
        <ul>
            <li><strong>本示例自定义UP/DOWN按键事件，所以禁用表格的ArrowKeySelection属性</strong></li>
            <li>点击文本框选中文本</li>
            <li>使用 Enter、Tab 或者 Down 键选中下一行</li>
            <li>使用 Up 键选中上一行</li>
            <li>选中行的同时选中行中的文本输入框</li>
        </ul>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" CssClass="marginr" Text="获取用户输入的分组值">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>

    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-tpl input';


        function registerEnterEvent() {
            var grid = F(gridClientID);

            grid.el.on('keydown', inputselector, function (event) {

                // 如果是 ENTER键 或者 TAB键 或者 向下箭头
                if (event.keyCode === F.KEY.ENTER || event.keyCode === F.KEY.TAB || event.keyCode === F.KEY.DOWN) {
                    // 下一行元素
                    var nextRowEl;

                    // 当前选中的行数组
                    var selectedRows = grid.getSelectedRows();
                    if (selectedRows.length) {
                        // 当前选中的行元素
                        var currentSelectedRowEl = grid.getRowEl(selectedRows[0]);
                        nextRowEl = currentSelectedRowEl.next();
                    } else {
                        nextRowEl = grid.getRowEl(0);
                    }

                    // 存在下一行元素
                    if (nextRowEl.length) {
                        // 选中文本框中的文本
                        nextRowEl.find(inputselector).select();
                        // 选中下一行
                        grid.selectRow(nextRowEl);
                    }


                    // 阻止默认行为
                    event.preventDefault();
                } else if (event.keyCode === F.KEY.UP) {
                    // 上一行元素
                    var prevRowEl;

                    // 当前选中的行数组
                    var selectedRows = grid.getSelectedRows();
                    if (selectedRows.length) {
                        // 当前选中的行元素
                        var currentSelectedRowEl = grid.getRowEl(selectedRows[0]);
                        prevRowEl = currentSelectedRowEl.prev();
                    }

                    // 存在上一行元素
                    if (prevRowEl.length) {
                        // 选中文本框中的文本
                        prevRowEl.find(inputselector).select();
                        // 选中上一行
                        grid.selectRow(prevRowEl);
                    }


                    // 阻止默认行为
                    event.preventDefault();
                }
            });

            // 点击选中文本框中的文本
            grid.el.on('click', inputselector, function (event) {
                $(this).select();
            });

        }

        F.ready(function () {
            registerEnterEvent();
        });

    </script>
</body>
</html>
