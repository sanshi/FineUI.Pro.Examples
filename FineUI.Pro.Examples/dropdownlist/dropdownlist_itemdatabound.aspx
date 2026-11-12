<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_itemdatabound.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_itemdatabound" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .item-text {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .item-desc {
            font-size: 0.9em;
            word-break: break-all;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="自定义列表项（列表项绑定事件）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" OnItemDataBound="DropDownList1_ItemDataBound">
                </f:DropDownList>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在下拉面板中单项选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>查看每项的提示</h3>
            <ol>
                <li>
                    展开<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>，将鼠标移到其中一项。<br />
                    结果：提示信息来自该项绑定的数据，选中后仍保留原来的文字与业务值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：通过列表项绑定事件，可以动态设置每一项的属性（本例为每个列表项增加提示信息）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnItemDataBound</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>" title="下拉列表">下拉列表</strong>）：数据项绑定时补充该选项的显示内容或悬停提示。 本页声明值为 <code>DropDownList1</code><code>_ItemDataBound</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
