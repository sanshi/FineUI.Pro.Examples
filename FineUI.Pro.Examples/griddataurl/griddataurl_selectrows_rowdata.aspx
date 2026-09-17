<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_selectrows_rowdata.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_selectrows_rowdata" %>

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
        <f:Button ID="Button1" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="选中[陈飞]，[彭博]，[唐超]所在的行" OnClick="Button2_Click">
        </f:Button>
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

        // 发起 Ajax 回发之前触发
        F.beforeAjax(function () {

            // 网址数据源模式下，服务器端表格不保存数据，因此需要自行附加选中的行数据
            F.setHidden('DataUrl_Grid_SelectedRowData', JSON.stringify(F(grid1ClientID).getSelectedRows(true)));

        });

    </script>
</body>
</html>
