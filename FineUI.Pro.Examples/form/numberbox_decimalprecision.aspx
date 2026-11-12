<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="numberbox_decimalprecision.aspx.cs" Inherits="FineUI.Pro.Examples.form.numberbox_decimalprecision" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" LabelAlign="Top" EnableCollapse="false" Title="简单表单" runat="server" LabelWidth="120px">
            <Items>
                <f:NumberBox ID="NumberBox1" runat="server" EmptyText="精度为 2，比如 0.35" Label="0 到 1 之间的小数" MaxValue="1" MinValue="0" NoDecimal="false"
                    NoNegative="true" DecimalPrecision="2" Required="true" ShowRedStar="true" Increment="0.01" TrimEndZero="false">
                </f:NumberBox>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="修改精度为 1" OnClick="Button1_Click">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="修改精度为 2" OnClick="Button2_Click">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" Text="修改精度为 3" OnClick="Button3_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在同一个<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="0 到 1 之间的小数">数字输入框</strong>中切换 <code>1</code>、<code>2</code>、<code>3</code> 位小数，同时调整增减步长并保留末尾的零。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-sort" aria-hidden="true"></i>切换精度和步长</h3>
            <ol>
                <li>
                    输入<code>0.36</code>，点击<strong class="example-control-reference" data-example-control="<%= Button3.ClientID %>" title="修改精度为 3">修改精度为 3</strong>。<br />
                    结果：回发后由后台将小数位数设为 <code>3</code>、步长设为 <code>0.001</code>，输入框显示 <code>0.360</code>。
                </li>
                <li>
                    点击向上的增减图标。<br />
                    结果：数值变为 <code>0.361</code>。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= Button1.ClientID %>" title="修改精度为 1">修改精度为 1</strong>。<br />
                    结果：回发后由后台改为 <code>1</code> 位小数和 <code>0.1</code> 的步长，当前值显示为 <code>0.4</code>。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= Button2.ClientID %>" title="修改精度为 2">修改精度为 2</strong>，再点击<strong class="example-control-reference" data-example-control="<%= btnSubmit.ClientID %>" title="提交表单">提交表单</strong>。<br />
                    结果：回发后由后台改为 <code>2</code> 位小数和 <code>0.01</code> 的步长，输入框显示 <code>0.40</code>；提交后由后台显示当前数字值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：为<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="0 到 1 之间的小数">数字输入框</strong>设置了<code>TrimEndZero</code>=<code>false</code>，所以不会去掉末尾的零（比如精度为<code>3</code>时，会显示<code>0.360</code>，而不是<code>0.36</code>）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DecimalPrecision</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="0 到 1 之间的小数">0 到 1 之间的小数</strong>）：控制小数位数，三个按钮分别设置为 <code>1</code>、<code>2</code>、<code>3</code>。</li>
                <li><code>Increment</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="0 到 1 之间的小数">0 到 1 之间的小数</strong>）：随精度分别设置为 <code>0.1</code>、<code>0.01</code>、<code>0.001</code>。</li>
                <li><code>TrimEndZero</code>（<strong class="example-control-reference" data-example-control="<%= NumberBox1.ClientID %>" title="0 到 1 之间的小数">0 到 1 之间的小数</strong>）：初始为 <code>false</code>，<code>0.36</code> 在 <code>3</code> 位精度下显示为 <code>0.360</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
