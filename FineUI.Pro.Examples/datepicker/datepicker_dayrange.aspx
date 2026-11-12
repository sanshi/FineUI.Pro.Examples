<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_dayrange.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_dayrange" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy-MM-dd" Label="日期范围" EmptyText="请选择日期范围"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="DayRange">
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
            <p>演示通过输入框弹出的面板选择日期范围。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择日期范围</h3>
            <ol>
                <li>
                    点击“日期范围”字段右侧的下拉图标。<br />
                    结果：显示本页日期范围面板；输入框当前值仍可对照查看。
                </li>
                <li>
                    依次将起点和终点选择为今天之后第5天到第10天。<br />
                    结果：所选值回填输入框，范围显示起止两个值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>验证并读取当前值</h3>
            <ol>
                <li>
                    填写本页所有必填日期或时间，并保持在允许的范围内。<br />
                    结果：满足必填及本页已设置的日期或时间范围限制。
                </li>
                <li>
                    点击“提交表单”。<br />
                    结果：浏览器验证通过后回发，后台读取本页日期或时间值，更新结果标签。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>：控制选中值的文字格式；本页使用 yyyy-MM-dd。</li>
                <li><code>DisplayType</code>：本页采用日期范围面板，选择起点和终点。</li>
                <li><code>RangeStartDate</code>：设置范围起点，与终点共同组成当前范围。</li>
                <li><code>RangeEndDate</code>：设置范围终点，与起点共同组成当前范围。</li>
                <li><code>Required</code>：必填字段为空时阻止提交；范围字段需要起止两个值均有效。</li>
            </ul>
        </section>
    </template>
</body>
</html>
