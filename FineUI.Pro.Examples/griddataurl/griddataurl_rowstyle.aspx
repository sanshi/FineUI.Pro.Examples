<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_rowstyle.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_rowstyle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
    <style type="text/css">
        .f-grid-row.color1,
        .f-grid-row.color1 .f-icon,
        .f-grid-row.color1 a {
            background-color: #0094ff;
            color: #fff;
        }

        .f-grid-row.color3,
        .f-grid-row.color3 .f-icon,
        .f-grid-row.color3 a {
            background-color: #b200ff;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx" RowDataBoundFunction="gridRowDataBound">
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
        <br />


    </form>
	<script src="../res/js/grid.js"></script>
    <script>

        //// 行渲染函数
        //function gridRowRenderer(params) {
        //    var entranceYear = params.rowData.values['EntranceYear'];

        //    if (entranceYear >= 2002 && entranceYear <= 2004) {
        //        params.rowCls = 'color1';
        //    } else if (entranceYear > 2008) {
        //        params.rowCls = 'color3';
        //    }
        //}

        // 行绑定函数
        function gridRowDataBound(rowData) {
            var entranceYear = rowData.values['EntranceYear'];

            if (entranceYear >= 2002 && entranceYear <= 2004) {
                rowData.cls = 'color1';
            } else if (entranceYear > 2008) {
                rowData.cls = 'color3';
            }
        }

    </script>
</body>
</html>
