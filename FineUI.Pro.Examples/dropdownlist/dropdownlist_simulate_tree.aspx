<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_simulate_tree.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.dropdownlist_simulate_tree" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="模拟树的下拉列表"
            ShowHeader="true">
            <Items>
                <f:DropDownList AutoPostBack="false" Required="true" EnableSimulateTree="true" ShowRedStar="true" runat="server" ID="ddlBox">
                </f:DropDownList>

                <f:Button ID="Button1" Text="获取选中项" runat="server" OnClick="Button1_Click">
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
            <p>用缩进和前缀在普通下拉选项中表达层级，并读取所选节点的业务值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>在缩进层级中选择</h3>
            <ol>
                <li>
                    展开面板，对照各项前面的层级缩进，再选择<code>事件处理 - 2</code>。<br />
                    结果：缩进用于表达层级，选中后显示该选项文字，值为 <code>11</code>。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableSimulateTree</code>（<strong class="example-control-reference" data-example-control="<%= ddlBox.ClientID %>"
                        title="下拉列表">下拉列表</strong>）：用前缀缩进显示层级，数据仍是<strong class="example-control-reference" data-example-control="<%= ddlBox.ClientID %>"
                        title="下拉列表">下拉列表</strong>选项。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
