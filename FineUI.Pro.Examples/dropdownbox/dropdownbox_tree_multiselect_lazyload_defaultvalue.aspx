<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tree_multiselect_lazyload_defaultvalue.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tree_multiselect_lazyload_defaultvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉树（多选，延迟加载）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EnableMultiSelect="true" Values="henan,anhui,xiping" Texts="河南省,安徽省,西平县">
                    <PopPanel>
                        <f:Tree ID="Tree1" ShowHeader="false" Hidden="true" AutoLeafIdentification="false" OnNodeLazyLoad="Tree1_NodeLazyLoad"
                            EnableMultiSelect="true" KeepCurrentSelection="true" runat="server">
                            <Nodes>
                                <f:TreeNode Text="中国" Expanded="true" NodeID="china">
                                    <f:TreeNode Text="河南省" Expanded="true" NodeID="henan">
                                        <f:TreeNode Text="驻马店市（延迟加载）" NodeID="zhumadian">
                                        </f:TreeNode>
                                        <f:TreeNode Text="漯河" NodeID="luohe" Leaf="true" />
                                    </f:TreeNode>
                                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                                        <f:TreeNode Text="合肥市" Expanded="true" NodeID="hefei">
                                            <f:TreeNode Text="蜀山区" Expanded="false" NodeID="shushanqu">
                                                <f:TreeNode Text="金色池塘小区" NodeID="golden" Leaf="true">
                                                </f:TreeNode>
                                                <f:TreeNode Text="梦圆小区" NodeID="mengyuan" Leaf="true">
                                                </f:TreeNode>
                                                <f:TreeNode Text="桂花园小区" NodeID="guihuayuan" Leaf="true">
                                                </f:TreeNode>
                                            </f:TreeNode>
                                            <f:TreeNode Text="包河区" Expanded="true" NodeID="baohequ">
                                                <f:TreeNode Text="中国科学技术大学" NodeID="ustc" Leaf="true">
                                                </f:TreeNode>
                                            </f:TreeNode>
                                        </f:TreeNode>
                                    </f:TreeNode>
                                </f:TreeNode>
                            </Nodes>
                        </f:Tree>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示对应节点或人员尚未加载时，仍显示由后台提供的初始业务值和文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>尚未加载时保留初值</h3>
            <ol>
                <li>
                    初次打开页面，先点击获取选中值按钮。<br />
                    结果：结果包含“河南省”“安徽省”“西平县”；西平县的子树尚未展开也能显示文字。
                </li>
                <li>
                    再展开驻马店市。<br />
                    结果：加载出“西平县”后，其默认选择仍被保留。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：通过 <code>Values</code> 和 <code>Text</code> 属性来设置<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                    title="下拉框">下拉框</strong>的初始值（由于页面初始化时树控件数据并没有全部载入，所以需要指定 <code>Text</code> 属性）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Values</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="下拉框">下拉框</strong>）：指定初始多选值。 本页声明值为 <code>henan</code>,<code>anhui</code>,<code>xiping</code>。</li>
                <li><code>Texts</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="下拉框">下拉框</strong>）：为初始值提供对应文字，尤其适用于尚未加载到当前页的数据。 本页声明值为 河南省,安徽省,西平县。</li>
            </ul>
        </section>
    </template>
</body>
</html>
