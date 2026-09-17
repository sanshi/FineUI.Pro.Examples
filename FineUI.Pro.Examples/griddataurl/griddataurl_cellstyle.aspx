<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_cellstyle.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_cellstyle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
    <style type="text/css">
        .color1 {
            background-color: #0094ff;
            color: #fff;
        }

        .color2 {
            background-color: #0026ff;
            color: #fff;
        }

        .color3 {
            background-color: #b200ff;
            color: #fff;
        }
    </style>
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
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" RendererFunction="renderEntranceYear" HeaderText="入学年份">
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
        <br />

    </form>
	<script src="../res/js/grid.js"></script>
    <script>

        function renderGender(value, params) {
            if (value == 1) {
                params.cellCls = 'color1';
            }

            return value == 1 ? '男' : '女';
        }

        function renderEntranceYear(value, params) {

            var entranceYear = params.rowData.values['EntranceYear'];

            if (entranceYear >= 2002 && entranceYear <= 2008) {
                params.cellCls = 'color3';
            }

            return value;
        }

    </script>
</body>
</html>
