<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablehtml_complex.aspx.cs" Inherits="FineUI.Pro.Examples.form.tablehtml_complex" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/tablehtml.css" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link href="<%= PageContext.ResolveUrl("~/res/css/tablehtml.css") %>" rel="stylesheet" />
        <style>
            .tablehtml td.label1,
            .tablehtml td.label2 {
                width: 80px;
                text-align: center;
            }

            .tablehtml td.label {
                width: 120px;
                text-align: right;
            }

            .tablehtml td.label3 {
                width: 80px;
                text-align: right;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ContentPanel ID="ContentPanel1" IsFluid="true" runat="server" ShowBorder="false" ShowHeader="false">
            <table class="tablehtml">
                <tr>
                    <td class="f-widget-content label1" rowspan="6">联系方式
                    </td>
                    <td class="f-widget-content label2" rowspan="3">订货
                    </td>
                    <td class="f-widget-content label"><span class="redstar">*</span>订货单位：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox1" runat="server" Label="订货单位" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>订货联系人：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox2" runat="server" Label="订货联系人" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>订货联系电话：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox3" runat="server" Label="订货联系电话" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label2" rowspan="3">收货
                    </td>
                    <td class="f-widget-content label"><span class="redstar">*</span>收货单位：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox4" runat="server" Label="收货单位" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>收货联系人：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox5" runat="server" Label="收货联系人" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>收货联系电话：
                    </td>
                    <td class="f-widget-content">
                        <f:TextBox ID="TextBox6" runat="server" Label="收货联系电话" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
            </table>
            <table class="tablehtml" style="margin-top: -1px;">
                <tr>
                    <td class="f-widget-content label"><span class="redstar">*</span>承办人：
                    </td>
                    <td class="f-widget-content content">
                        <f:TextBox ID="TextBox7" runat="server" Label="承办人" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                    <td class="f-widget-content label"><span class="redstar">*</span>销售代表：
                    </td>
                    <td class="f-widget-content content">
                        <f:TextBox ID="TextBox8" runat="server" Label="销售代表" ShowLabel="false" Required="true" Text="" MessageTarget="Qtip">
                        </f:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label">起草人：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="Label1" runat="server" Label="起草人" ShowLabel="false" Text="三生石上">
                        </f:Label>
                    </td>
                    <td class="f-widget-content label">起草时间：
                    </td>
                    <td class="f-widget-content content">
                        <f:Label ID="labCurrentTime" runat="server" Label="起草时间" ShowLabel="false" Text="">
                        </f:Label>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label">发货条件：
                    </td>
                    <td class="f-widget-content" colspan="3">
                        <f:TextArea ID="TextArea2" Height="50px" runat="server" Label="发货条件" ShowLabel="false" Text="">
                        </f:TextArea>
                    </td>
                </tr>
                <tr>
                    <td class="f-widget-content label">备注：
                    </td>
                    <td class="f-widget-content" colspan="3">
                        <f:TextArea ID="TextArea3" Height="50px" runat="server" Label="备注" ShowLabel="false" Text="">
                        </f:TextArea>
                    </td>
                </tr>
            </table>
        </f:ContentPanel>
        <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="ContentPanel1" ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click"
            MarginTop="5px">
        </f:Button>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用两个 HTML 表格拼成复杂订单表单，通过跨行和跨列单元格组织联系方式、办理人员及长文本。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>观察合并单元格</h3>
            <ul>
                <li>
                    对照<strong>联系方式</strong>“订货”“收货”及下方<strong class="example-control-reference" data-example-control="<%= TextArea2.ClientID %>"
                        title="发货条件">发货条件</strong>、备注。<br />
                    结果：联系方式跨六行，订货与收货各跨三行；长文本占用下方表格的多个单元格，两个表格边线衔接。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：这个示例是由上下两个表格组成的。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowspan</code>（<strong>联系方式、订货和收货的 HTML 分组单元格</strong>）：HTML 单元格跨多行，用于联系方式及订货、收货分组。</li>
                <li><code>colspan</code>（<strong>发货条件和备注的 HTML 单元格</strong>）：HTML 单元格跨多列，为<strong class="example-control-reference"
                        data-example-control="<%= TextArea2.ClientID %>" title="发货条件">发货条件</strong>和备注提供完整宽度。</li>
                <li><code>ShowLabel</code>（<strong class="example-control-reference" data-example-control="<%= TextBox1.ClientID %>"
                        title="订货单位">订货单位</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox2.ClientID %>"
                        title="订货联系人">订货联系人</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox3.ClientID %>"
                        title="订货联系电话">订货联系电话</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox4.ClientID %>"
                        title="收货单位">收货单位</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox5.ClientID %>"
                        title="收货联系人">收货联系人</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox6.ClientID %>"
                        title="收货联系电话">收货联系电话</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox7.ClientID %>"
                        title="承办人">承办人</strong>、<strong class="example-control-reference" data-example-control="<%= TextBox8.ClientID %>"
                        title="销售代表">销售代表</strong>、<strong class="example-control-reference" data-example-control="<%= Label1.ClientID %>"
                        title="起草人">起草人</strong>、<strong class="example-control-reference" data-example-control="<%= labCurrentTime.ClientID %>"
                        title="起草时间">起草时间</strong>、<strong class="example-control-reference" data-example-control="<%= TextArea2.ClientID %>"
                        title="发货条件">发货条件</strong>、<strong class="example-control-reference" data-example-control="<%= TextArea3.ClientID %>"
                        title="备注">备注</strong>）：输入控件隐藏内置标签，使用表格单元格显示名称。</li>
            </ul>
        </section>
    </template>
</body>
</html>
