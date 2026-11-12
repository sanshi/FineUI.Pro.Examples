<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_monthrange.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_monthrange" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false"
            Title="简单表单" runat="server">
            <Items>
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy/MM" Label="月份范围" EmptyText="请选择月份范围"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="MonthRange">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单"
                    OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过输入框弹出的面板只选择年月范围。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择年月范围</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="月份范围">月份范围</strong>字段右侧的下拉图标。<br />
                    结果：显示本页年月范围面板；输入框当前值仍可对照查看。
                </li>
                <li>
                    依次将起点和终点选择为当前月份之后第<code>1</code>个月到第<code>2</code>个月。<br />
                    结果：所选值回填输入框，范围显示起止两个值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="月份范围">月份范围</strong>）：控制选中值的文字格式；本页使用 <code>yyyy</code>/<code>MM</code>。</li>
                <li><code>DisplayType</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="月份范围">月份范围</strong>）：本页采用年月范围面板，选择起点和终点。</li>
            </ul>
        </section>
    </template>
</body>
</html>
