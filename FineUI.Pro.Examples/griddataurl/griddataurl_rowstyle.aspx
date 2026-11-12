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
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx" RowDataBoundFunction="gridRowDataBound">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />


    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>异步数据到达后，按入学年份为指定记录设置整行样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>根据当前加载字段设置外观</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>入学年份</strong>大于 2008 的行与其他行。<br />结果：符合年份条件的记录使用 color3 行样式，整行受影响；其他行保留普通外观。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowDataBoundFunction / rowData.cls</code>（<strong>行绑定函数</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：在客户端取得本次实际行值后应用样式，异步请求结果不必先走服务器逐行绑定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
