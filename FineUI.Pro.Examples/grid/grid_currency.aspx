<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_currency.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_currency" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell-Salary .f-grid-cell-text {
            padding: 0;
        }

        .currency {
            border-collapse: separate;
            table-layout: fixed;
            width: 100%;
            border-spacing: 0px;
        }

        .currency td {
            border-right-width: 1px;
            border-right-style: solid;
            border-right-color: #ddd;
            text-align: center;
        }

        .currency td:last-child {
            border-right-color: transparent;
        }

        .currency td.separator {
            border-right-color: green;
        }

        .currency td.separator.lastone {
            border-right-color: red;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="200px" ColumnID="Salary" DataField="Salary" HeaderText="工资" RendererFunction="renderSalary" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        // 单元格总数（8, 11, 14）
        var CELL_COUNT = 11;

        function renderSalary(value) {
            var result = '',
                html = [];

            var items = (value + '').split('.');
            var integerPart = items[0];
            var decimalPart = items[1];
            result += integerPart;
            if (decimalPart) {
                result += decimalPart.charAt(0) || '0';
                result += decimalPart.charAt(1) || '0';
            } else {
                result += '00';
            }
            var prefixCount = CELL_COUNT - result.length;
            if (prefixCount > 0) {
                for (var i = 0; i < prefixCount; i++) {
                    result = '_' + result;
                }
            }

            html.push('<table class="currency"><tbody><tr>');
            for (var i = 0; i < CELL_COUNT; i++) {
                var cellCls = '';
                if ((i + 1) % 3 === 0) {
                    cellCls = 'separator';

                    if (i + 1 + 3 > CELL_COUNT) {
                        cellCls += ' lastone';
                    }
                }
                var cellValue = result.charAt(i);
                html.push(F.formatString('<td class="{0}">{1}</td>',
                    cellCls,
                    cellValue === '_' ? '&nbsp;' : cellValue));
            }
            html.push('</tr></tbody></table>');
            return html.join('');
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把工资逐位放入货币栅格，在同一单元格中区分各个数位。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看工资的逐位栅格</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>工资</strong>列，对照数位和分节线。<br />结果：每个<strong>工资</strong>单元格由自定义渲染函数生成 11 格，数值逐位对齐；这是自定义货币栅格，不是给普通数字追加货币符号。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction</code>（<strong>工资列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：<strong>工资</strong>列生成自定义栅格
                    HTML，样式控制各格宽度和分节边线。</li>
                <li><code>EnableColumnLines</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，辅助分隔普通数据列；货币栅格内部边线另由本页 CSS 提供。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
