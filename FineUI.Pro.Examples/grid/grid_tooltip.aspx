<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_tooltip.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_tooltip" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            >
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField TrueStrings="false,False" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:BoundField HeaderText="所学专业" DataToolTipField="Major" DataField="Major" Width="150px" />
                <f:RenderField HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" Width="150px" />
                <f:RenderField HeaderText="所学专业" DataField="Major" RendererFunction="renderMajorLink" ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
        </f:Grid>
    </form>
    <script>

        function renderMajor(value) {
            //return F.formatString('<span data-qtip="{0}">{0}</span>', F.htmlEncode(value));
            var encodedValue = F.htmlEncode(value);
            return $('<span>', {
                'data-qtip': encodedValue,
                'html': encodedValue
            });
        }

        function renderMajorLink(value) {
            //var url = 'http://gsa.ustc.edu.cn/search?q=' + F.urlEncode(value);
            //return F.formatString('<a href="{0}" data-qtip="{1}" target="_blank">{1}</a>', url, F.htmlEncode(value));
            var encodedValue = F.htmlEncode(value);
            return $('<a>', {
                'target': '_blank',
                'href': 'http://gsa.ustc.edu.cn/search?q=' + F.urlEncode(value),
                'data-qtip': encodedValue,
                'html': encodedValue
            });
        }


    </script>
</body>
</html>
