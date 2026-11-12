<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker_dayrange_time_showsecond.aspx.cs" Inherits="FineUI.Pro.Examples.datepicker.datepicker_dayrange_time_showsecond" %>

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
                <f:DatePicker runat="server" Required="true" DateFormatString="yyyy-MM-dd HH:mm" Label="日期范围" EmptyText="请选择日期范围"
                    ID="DatePicker1" ShowRedStar="true" DisplayType="DayRange" ShowTime="true" ShowSecond="false">
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
            <p>演示选择日期时间范围时隐藏秒列，只显示和读取到分钟。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-time" aria-hidden="true"></i>只选择小时和分钟</h3>
            <ol>
                <li>
                    展开日期选择面板，查看并选择小时和分钟。<br />
                    结果：时间区域不显示秒列，所选日期时间的显示文字也不包含秒。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="日期范围">日期范围</strong>）：控制选中值的文字格式；本页使用 <code>yyyy</code>-<code>MM</code>-<code>dd</code> <code>HH</code>:<code>mm</code>。</li>
                <li><code>ShowSecond</code>（<strong class="example-control-reference" data-example-control="<%= DatePicker1.ClientID %>" title="日期范围">日期范围</strong>）：设为 <code>false</code>，时间面板只显示小时和分钟，不创建秒列；输出格式也不含秒。</li>
            </ul>
        </section>
    </template>
</body>
</html>
