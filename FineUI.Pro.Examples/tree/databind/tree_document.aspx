<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_document.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.databind.tree_document" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tree/databind/website.xml" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" EnableCollapse="false" Title="树控件（绑定到 XmlDocument）" runat="server">
        </f:Tree>
        <br />
        <f:Button ID="btnClear" Text="清空树" CssClass="marginr" OnClick="btnClear_Click" runat="server"></f:Button>
        <f:Button ID="btnReBind" Text="重新绑定树" CssClass="marginr" OnClick="btnReBind_Click" runat="server"></f:Button>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示把 XML 层级绑定为树节点，并清空和重新绑定当前树。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>核对绑定结果</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件（绑定到 XmlDocument）">树控件（绑定到 XmlDocument）</strong>展开中国和省级目录。<br />结果：根、目录与叶子按数据关系显示，展开只影响当前分支。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClear").ClientID %>'
                        title="清空树">清空树</strong>。<br />结果：后台清空节点和当前选择；树容器继续保留。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnReBind").ClientID %>'
                        title="重新绑定树">重新绑定树</strong>。<br />结果：后台重新读取数据并生成节点，不恢复清空前的旧选择。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataBind()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（绑定到 XmlDocument）">树控件（绑定到
                        XmlDocument）</strong>）：根据本页准备的数据绑定生成树节点。</li>
            </ul>
        </section>
    </template>
</body>
</html>
