<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_datadisplayfields.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_datadisplayfields" %>

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
            ShowBorder="true" Title="自定义列表项（DataDisplayFields）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1">
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
            <p>用模板或逐项处理自定义人员选项外观，选中后只显示姓名并提交人员标识。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>区分选项模板和选中文字</h3>
            <ol>
                <li>
                    展开面板选择“张萍萍”这一项。<br />
                    结果：面板可同时显示姓名、描述等模板内容；选中后输入区使用姓名，业务值为 101。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataDisplayFormatString</code>：自定义下拉面板内选项的显示内容。 本页声明值为 &lt;div class=\。</li>
                <li><code>DataTextField</code>：从指定字段取得选中后显示的文字。 本页声明值为 Name。</li>
            </ul>
        </section>
    </template>
</body>
</html>
