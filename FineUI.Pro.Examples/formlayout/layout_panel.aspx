<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_panel.aspx.cs" Inherits="FineUI.Pro.Examples.form.layout_panel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /*
        .btn-in-form {
            margin-bottom: 5px;
            display: table !important;
        }
        */

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="SimpleForm1" IsFluid="true" LabelAlign="Left" BodyPadding="10" RemoveLastFieldsMargin="true" Title="表单" runat="server">
            <Rows>
                <f:FormRow ID="FormRow5" ColumnWidths="50% auto">
                    <Items>
                        <f:TextBox ID="TextBox1" runat="server" Label="文本一">
                        </f:TextBox>
                        <f:Button ID="Button4" CssClass="btn-in-form" runat="server" Text="按钮一">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow6" ColumnWidths="100% auto" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox2" runat="server" Label="文本二">
                        </f:TextBox>
                        <f:Button ID="Button3" CssClass="btn-in-form" runat="server" Text="按钮二">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow7" ColumnWidths="100% auto" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox3" runat="server" Label="文本三">
                        </f:TextBox>
                        <f:Button ID="Button1" CssClass="btn-in-form" runat="server" Text="按钮三">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow8" ColumnWidths="100% auto" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox4" runat="server" Label="文本四">
                        </f:TextBox>
                        <f:Button ID="Button2" CssClass="btn-in-form" runat="server" Text="按钮四">
                        </f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow9" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox5" runat="server" Label="默认均分"></f:TextBox>
                        <f:Button ID="Button5" CssClass="btn-in-form" runat="server" Text="按钮五"></f:Button>
                    </Items>
                </f:FormRow>
                <f:FormRow ID="FormRow10" ColumnWidths="50% 50%" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox6" runat="server" Label="明确均分"></f:TextBox>
                        <f:Button ID="Button6" CssClass="btn-in-form" runat="server" Text="按钮六"></f:Button>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示把文本框和按钮放在同一行，对比可伸展字段、窄按钮和均分列宽。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较行内分配</h3>
            <ul>
                <li>
                    在文本框输入文字，并对照同行按钮与其它行。<br />
                    结果：<code>auto</code> 列保留按钮自身宽度，百分比字段使用剩余空间；<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox5").ClientID %>' title="默认均分">默认均分</strong>与显式均分会让按钮占据半行。
                </li>
                <li>
                    改变浏览器宽度。<br />
                    结果：表单按可用宽度重新布局，字段输入保留。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：第一行使用 <code>50%</code> <code>auto</code>，后面三行使用 <code>100%</code> <code>auto</code>；最后两行分别展示<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TextBox5").ClientID %>' title="默认均分">默认均分</strong>和 <code>50%</code> <code>50%</code>。 <br /> 为表单设置 <code>RemoveLastFieldsMargin</code>="<code>true</code>" 来移除最后一行表单字段的底部外边距。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnWidths</code>（<strong class="example-control-reference" data-example-control="<%= FormRow5.ClientID %>" title="第 1 个表单行">第 1 个表单行</strong>、<strong class="example-control-reference" data-example-control="<%= FormRow6.ClientID %>" title="第 2 个表单行">第 2 个表单行</strong>、<strong class="example-control-reference" data-example-control="<%= FormRow7.ClientID %>" title="第 3 个表单行">第 3 个表单行</strong>、<strong class="example-control-reference" data-example-control="<%= FormRow8.ClientID %>" title="第 4 个表单行">第 4 个表单行</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("FormRow10").ClientID %>' title="第 6 个表单行">第 6 个表单行</strong>）：本页对比 <code>50%</code> <code>auto</code>、<code>100%</code> <code>auto</code>、<code>默认均分</code>和显式 <code>50%</code> <code>50%</code>。</li>
                <li><code>RemoveLastFieldsMargin</code>（<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="表单">表单</strong>）：去掉最后一行额外的字段外边距。</li>
                <li><code>IsFluid</code>（<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="表单">表单</strong>）：使表单随容器宽度调整。</li>
            </ul>
        </section>
    </template>
</body>
</html>
