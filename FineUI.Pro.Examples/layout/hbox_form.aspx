<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_form.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /*.mysimpleform .f-field {
            margin-bottom: 0 !important;
        }*/

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="VBox" BodyPadding="10px"
            BoxConfigSpace="5" ShowHeader="true" Title="面板（SimpleForm - Layout=HBox）">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" EnableCollapse="true" ShowHeader="false" Layout="HBox" BoxConfigSpace="5"
                    RemoveFieldsMargin="true">
                    <Items>
                        <f:Label runat="server" Text="销毁统计时间段："></f:Label>
                        <f:DatePicker runat="server" Width="150px" Required="true" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期" ShowLabel="false"
                            Label="销毁统计开始时间" ID="dpStartDate" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="dpEndDate" Width="150px" Required="true" Readonly="false" CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd"
                            CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期" ShowLabel="false" Label="销毁统计结束时间" runat="server"
                            EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="btnClearDate" Text="重置起止时间" ClickHandler="onClearDateClick"></f:Button>
                        <f:Button runat="server" ID="btnSearch" Text="查询" ValidateForms="SimpleForm1"></f:Button>
                    </Items>
                </f:SimpleForm>
                <f:Panel ID="Panel3" BoxFlex="1" ShowBorder="true" ShowHeader="false" runat="server">
                    <Items>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

        <br />
        <br />
        <br />
        下面使用 Column 布局实现相同的效果：
        <br />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="VBox" BodyPadding="10px"
            BoxConfigSpace="5" ShowHeader="true" Title="面板（SimpleForm - Layout=Column）">
            <Items>
                <f:SimpleForm ID="SimpleForm2" runat="server" ShowBorder="false" EnableCollapse="true" ShowHeader="false" Layout="Column"
                    RemoveFieldsMargin="true">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="销毁统计时间段："></f:Label>
                        <f:DatePicker runat="server" Width="150px" CssClass="marginr" Required="true" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期"
                            ShowLabel="false" Label="销毁统计开始时间" ID="DatePicker1" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker2" Width="150px" CssClass="marginr" Required="true" Readonly="false" CompareControl="DatePicker1"
                            DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期" ShowLabel="false"
                            Label="销毁统计结束时间" runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="Button1" CssClass="marginr" Text="重置起止时间" ClickHandler="onClearDateClick"></f:Button>
                        <f:Button runat="server" ID="Button2" Text="查询" ValidateForms="SimpleForm2"></f:Button>
                    </Items>
                </f:SimpleForm>
                <f:Panel ID="PanelExample4" ClientIDMode="Static" BoxFlex="1" ShowBorder="true" ShowHeader="false" runat="server">
                    <Items>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />

    </form>

    <script>
        function onClearDateClick(event) {
            // this -> 按钮实例；获取按钮所在的表单ID
            var formId = this.el.parents('.f-form').attr('id');

            F(formId).reset();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在水平盒布局中并排组织表单区域。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板（SimpleForm - Layout=HBox）">面板（SimpleForm - Layout=HBox）</strong>中在表单中输入内容，再改变浏览器宽度。<br />结果：各组表单按其固定宽度或伸展比例并排，已填写内容保留。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>为表单设置 <code>RemoveFieldsMargin</code>="<code>true</code>" 来移除表单字段的底部外边距。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板（SimpleForm - Layout=HBox）">面板（SimpleForm - Layout=HBox）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleForm1").ClientID %>' title="第 1 个表单">第 1 个表单</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（SimpleForm - Layout=Column）">面板（SimpleForm - Layout=Column）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("SimpleForm2").ClientID %>' title="第 2 个表单">第 2 个表单</strong>）：各组分别设为<code>VBox</code>、<code>HBox</code>、<code>Column</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>BoxFlex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel3").ClientID %>' title="第 2 个面板">第 2 个面板</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample4").ClientID %>' title="第 4 个面板">第 4 个面板</strong>）：设为<code>1</code>，直接子项按此比例分配父容器剩余空间。</li>
    </ul>
</section>
</template>
</body>
</html>
