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
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" RendererFunction="renderEntranceYear" HeaderText="入学年份">
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>异步数据到达后，只为符合性别条件的单元格设置样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>根据当前加载字段设置外观</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>男性与女性的<strong>性别</strong>单元格。<br />结果：男性的<strong>性别</strong>格使用 color1
                    样式，同一行其他列及女性<strong>性别</strong>格不套用该样式；数据值不改变。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction / params.cellCls</code>（<strong>性别列渲染函数</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：在客户端取得本次实际行值后应用样式，异步请求结果不必先走服务器逐行绑定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
