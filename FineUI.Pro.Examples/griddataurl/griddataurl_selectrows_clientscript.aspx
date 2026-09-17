<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_selectrows_clientscript.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_selectrows_clientscript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" ClickHandler="onButton1Click"></f:Button>
        <f:Button ID="Button2" runat="server" Text="选中[陈飞]，[彭博]，[唐超]所在的行" ClickHandler="onButton2Click"></f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：表格默认选中了[康颖颖]，[徐鹏]所在的行。
        <br />
    </form>
	<script src="../res/js/grid.js"></script>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';
        var labResultClientID = '<%= labResult.ClientID %>';

        function onButton1Click(event) {

            var result = '<table class="result"><tr><th>ID</th><th>姓名</th><th>性别</th><th>所学专业</th></tr>';
            $.each(F(grid1ClientID).getSelectedRows(true), function(index, item) {
                
                var values = item.values;

                result += F.formatString("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td></tr>",
                    item.id,
                    values.Name,
                    values.Gender == 0 ? '女' : '男',
                    values.Major);

            });
                
            result += '</table>';

            F(labResultClientID).setValue('选中的行：<br/>' + result);
        }

        function onButton2Click(event) {
            F(grid1ClientID).selectRows(['102', '106', '108']);
        }


    </script>
</body>
</html>
