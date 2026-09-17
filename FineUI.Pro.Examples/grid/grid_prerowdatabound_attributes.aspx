<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_prerowdatabound_attributes.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_prerowdatabound_attributes" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell[data-color=color1] {
            color: red;
            font-weight: bold;
        }

        .f-grid-cell[data-color=color3] {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="3" ShowBorder="true" ShowHeader="true"
            OnPreRowDataBound="Grid1_PreRowDataBound" runat="server"
            EnableCheckBoxSelect="true" OnRowCommand="Grid1_RowCommand"
            ColumnAttributesAffectCellAttributes="true">
            <Columns>
                <f:RowNumberField ColumnID="RowNumberField" />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="bfEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="cbxAtSchool" TextAlign="Center" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="hlMajor" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" Hidden="true" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" ConfirmTarget="Top"
                    ColumnID="lbfAction1" Width="60px" CommandName="Action1" Text="按钮" />
                <f:LinkButtonField TextAlign="Center" ConfirmText="你确定要这么做么？" Icon="Delete" ConfirmTarget="Top"
                    ColumnID="lbfAction2" Width="60px" CommandName="Action2" />
            </Columns>
            <%--<Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>--%>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>
                <strong>本示例已废弃，不推荐使用！</strong>
            </li>
            <li>表格列的Attributes属性不会影响行的CellAttributes属性，如果需要兼容之前的代码，可以启用ColumnAttributesAffectCellAttributes属性。
            </li>
            <li>推荐在行绑定事件中直接修改单元格的属性，示例：表格/行与列样式/单元格样式（CellAttributes）。
            </li>
        </ul>

    </form>
    <script>


        /*
        function onGridDataLoad(event) {
            this.el.find('[data-year]').each(function () {
                var cnode = $(this), dataYear = cnode.data('year');
                cnode.parents('.f-grid-cell').addClass(dataYear + '-container');
            });
        }
        */

    </script>
</body>
</html>
