<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_customheadmenu.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_customheadmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .custom-filter {
            position: absolute;
            margin-left: 2px;
            cursor: pointer;
        }

        .f-grid-colheader.custom-filtered .f-grid-colheader-text {
            /*font-style: italic;*/
            font-weight: bold;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableHeaderMenu="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="150px" ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuCheckBox ID="btnSelectAll" GroupName="AtSchool" Checked="true" OnCheckedChanged="btnAtSchool_CheckedChanged" runat="server" Text="全部">
                </f:MenuCheckBox>
                <f:MenuCheckBox ID="btnSelectAtSchool" GroupName="AtSchool" OnCheckedChanged="btnAtSchool_CheckedChanged" runat="server" Text="在校">
                </f:MenuCheckBox>
                <f:MenuCheckBox ID="btnSelectNotAtSchool" GroupName="AtSchool" OnCheckedChanged="btnAtSchool_CheckedChanged" runat="server" Text="离校">
                </f:MenuCheckBox>
            </Items>
        </f:Menu>
        <f:Menu ID="Menu2" runat="server">
            <Items>
                <f:MenuCheckBox ID="btnEntranceYearAll" GroupName="EntranceYear" Checked="true" OnCheckedChanged="btnEntranceYear_CheckedChanged" runat="server"
                    Text="全部">
                </f:MenuCheckBox>
                <f:MenuCheckBox ID="btnEntranceYearGreatThan2002" GroupName="EntranceYear" OnCheckedChanged="btnEntranceYear_CheckedChanged" runat="server"
                    Text="入学年份大于2002">
                </f:MenuCheckBox>
            </Items>
        </f:Menu>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Menu1ClientID = '<%= Menu1.ClientID %>';
        var Menu2ClientID = '<%= Menu2.ClientID %>';
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        var btnEntranceYearAllClientID = '<%= btnEntranceYearAll.ClientID %>';
        var btnSelectAllClientID = '<%= btnSelectAll.ClientID %>';

        function checkGridColheaderStyle() {
            var grid1El = F(Grid1ClientID).el;
            var colheaderEntranceYearEl = grid1El.find('.f-grid-colheader-EntranceYear');
            var colheaderAtSchoolEl = grid1El.find('.f-grid-colheader-AtSchool');

            var btnSelectAll = F(btnSelectAllClientID);
            var btnEntranceYearAll = F(btnEntranceYearAllClientID);

            if (btnSelectAll.isChecked()) {
                colheaderAtSchoolEl.removeClass('custom-filtered');
            } else {
                colheaderAtSchoolEl.addClass('custom-filtered');
            }

            if (btnEntranceYearAll.isChecked()) {
                colheaderEntranceYearEl.removeClass('custom-filtered');
            } else {
                colheaderEntranceYearEl.addClass('custom-filtered');
            }
        }

        function onGridDataLoad(event) {
            checkGridColheaderStyle();
        }

        F.ready(function() {

            F(Grid1ClientID).el.on('click', '.f-grid-colheader .custom-filter', function(event) {
                var colHeaderEl = $(this).parents('.f-grid-colheader');
                if (colHeaderEl.hasClass('f-grid-colheader-AtSchool')) {
                    F(Menu1ClientID).show();
                } else if (colHeaderEl.hasClass('f-grid-colheader-EntranceYear')) {
                    F(Menu2ClientID).show();
                }
            });

        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用表头旁自定义图标打开业务过滤菜单，以入学年份与在校状态筛选数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按业务选项过滤记录</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>是否在校</strong>表头旁的过滤图标，选择在校或离校。<br />结果：后台按所选状态筛选记录，对应表头文字加粗；选择全部可取消这一列的限制。</li>
                <li>打开<strong>入学年份</strong>旁的过滤菜单，选择<strong>入学年份</strong>大于2002。<br />结果：年份条件与当前在校条件一起应用；选择该菜单的全部只取消年份限制，不清掉另一列条件。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableHeaderMenu</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>false</code>，隐藏标准表头菜单，由自定义过滤图标打开本页业务菜单。
                </li>
                <li><code>custom-filter / custom-filtered</code>（<strong>自定义表头与页面 CSS</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：前者标识过滤入口，后者在有条件时加粗列标题；筛选仍由菜单对应处理函数完成。</li>
            </ul>
        </section>
    </template>
</body>
</html>
