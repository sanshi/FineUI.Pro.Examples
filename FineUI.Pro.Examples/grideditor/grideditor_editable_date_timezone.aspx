<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_editable_date_timezone.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_editable_date_timezone" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" EnableCollapse="false"
            Title="计划日期（单击编辑，重选同一天不标记为已修改）" runat="server"
            AllowCellEditing="true" ClicksToEdit="1" StoreDateAsString="false">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField Width="200px" ColumnID="PlanDate" DataField="PlanDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy-MM-dd" HeaderText="计划日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnShowModified" runat="server" Text="显示已修改的数据（getModifiedData）" ClickHandler="onShowModifiedClick">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <p>
            可编辑日期列示例（本表格设置了 <code>StoreDateAsString="false"</code>，单元格里存的是 Date 对象）。<br />
            数据以带时区偏移的 UTC ISO 字符串（<code>2026-06-19T00:00:00+00:00</code>）下发，在东八区会被解析为本地 <b>08:00</b>。<br />
            <b>历史问题</b>：用鼠标重新选择“同一天”（未做任何修改），加载值（本地 08:00）与日历选出的值（本地 00:00）按时间戳比较不相等，会被<b>误标为已修改</b>（左上角小红标）。<br />
            <b>现已修复</b>：日期列的脏值判定改为按列的显示格式（此处为 <code>yyyy-MM-dd</code>，只到“天”）比较，重选同一天不再被标记为已修改。
        </p>
        <p>
            <b>说明</b>：<code>StoreDateAsString</code> 的全局默认值为 <code>true</code>（对应全局配置项 <code>GridStoreDateAsString</code>），也是<b>推荐</b>的方式——此时单元格存的是格式化后的日期字符串，天然规避本例的时区问题，<b>不建议修改</b>。本示例仅为演示 <code>false</code> 场景下的问题与修复，才特意设为 <code>false</code>。
        </p>
    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var labResultClientID = '<%= labResult.ClientID %>';

        function onShowModifiedClick(event) {
            var data = F(Grid1ClientID).getModifiedData();
            F(labResultClientID).setValue('已修改的行数：<b>' + data.length + '</b><pre>' + JSON.stringify(data, null, 2) + '</pre>');
        }

    </script>
</body>
</html>
