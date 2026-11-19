<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_customitem.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_customitem" %>

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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="自定义列表项（列表项绑定事件）"
            ShowHeader="true">
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
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在下拉面板中单项选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>对照选项模板与选中文字</h3>
            <ol>
                <li>
                    展开<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>查看名称及说明，再选中一项。<br />
                    结果：列表项可以显示名称及说明等自定义内容，输入区仍使用该项的文字。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnItemDataBound</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：数据项绑定时补充该选项的显示内容或悬停提示。 本页声明值为 <code>DropDownList1</code><code>_ItemDataBound</code>。</li>
                <li><code>DataTextField</code>（<strong class="example-control-reference" data-example-control="<%= DropDownList1.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：从指定字段取得选中后显示的文字。 本页声明值为 <code>Name</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
