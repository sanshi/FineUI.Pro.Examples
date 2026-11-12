<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_fieldtype_float_double.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_fieldtype_float_double" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（显示错误）" EnableCollapse="false" runat="server">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField DataField="Name" HeaderText="标题"></f:RenderField>
                <f:RenderField Width="220px" ExpandUnusedSpace="true" MinWidth="150px" DataField="Desc" FieldType="Float" HeaderText="小数（FieldType=Float）">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Grid ID="Grid2" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（显示正确）" EnableCollapse="false" runat="server" AllowCellEditing="true"
            ClicksToEdit="1">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField DataField="Name" HeaderText="标题"></f:RenderField>
                <f:RenderField Width="220px" ExpandUnusedSpace="true" MinWidth="150px" DataField="Desc" FieldType="Double" HeaderText="小数（FieldType=Double）">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照浮点列的数据类型和显示结果，说明 Float、Double 在序列化及浏览器显示中的精度边界。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照两种浮点列</h3>
            <ul>
                <li>比较<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（显示错误）">表格（显示错误）</strong>中的 Float 与 Double 数值。<br />结果：列按各自的浮点类型读取并显示数据；展示值用于比较浮点精度，不能据此假定十进制运算始终精确。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>第一个表格显示数据错误：后台数据：101217.760000，但是前台显示：101217.758。</li>
                <li>需要将FieldType="Float"改为FieldType="Double"，这个因为两者的精度不同：Double精度为15~16，Float的精度为6~7。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>FieldType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（显示错误）">表格（显示错误）</strong>）：列选择 Float 或
                    Double 来解释源数据类型；业务金额应结合实际精度要求选择数据类型与显示格式。</li>
            </ul>
        </section>
    </template>
</body>
</html>
