<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowselect_client.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowselect_client" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（多选）" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" EnableMultiSelect="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true" Target="_blank"
                    ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowselect" Handler="onGrid1RowSelect" />
                <f:Listener Event="rowdeselect" Handler="onGrid1RowDeselect" />
                <f:Listener Event="selectionchange" Handler="onGrid1SelectionChange" />
            </Listeners>
        </f:Grid>
        <br />
        事件列表（<a id="clearResult" href="javascript:;">clear</a>）：
        <ul id="result"></ul>
        <br />
        注：
        <ul>
            <li>通过键盘SHIFT，表头复选框多选时，会触发多次 rowselect 事件。</li>
        </ul>
    </form>
    <script>
        function onClearResultClick(event) {
            event.preventDefault();
            $('#result').empty();
        }

        function onGrid1RowSelect(event, rowId) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] rowselect：{2}</li>',
                date.getMinutes(),
                date.getSeconds(),
                rowId));
        }

        function onGrid1RowDeselect(event, rowId) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] rowdeselect：{2}</li>',
                date.getMinutes(),
                date.getSeconds(),
                rowId));
        }

        function onGrid1SelectionChange(event) {
            var date = new Date();
            $('#result').append(F.formatString('<li>[{0}:{1}] selectionchange</li>',
                date.getMinutes(),
                date.getSeconds()));
        }

        F.ready(function() {
            $('#clearResult').on('click', onClearResultClick);
        });

    </script>
</body>
</html>
