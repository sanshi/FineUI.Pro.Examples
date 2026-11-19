<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="field_label_style.aspx.cs"
    Inherits="FineUI.Pro.Examples.other.field_label_style" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .red .f-field-fieldlabel {
            color: Red;
            font-weight: bold;
        }

        .blue .f-field-fieldlabel {
            color: Blue;
            font-weight: normal;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" EnableCollapse="false" LabelAlign="Right" Title="简单表单" runat="server">
            <Items>
                <f:TextBox runat="server" Label="用户名" EmptyText="输入用户名" Text="张三" ID="tbxUserName">
                </f:TextBox>
                <f:TextBox runat="server" Label="密码" TextMode="Password" ID="tbxPassword">
                </f:TextBox>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnSwitchClass" Text="改变 Label 的样式" runat="server" OnClick="btnSwitchClass_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过 CSS 类切换字段标签颜色，并保留输入框当前内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-skin" aria-hidden="true"></i>切换标签样式</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>" title="用户名">用户名</strong>或密码中输入内容，点击<strong
                        class="example-control-reference" data-example-control="<%= btnSwitchClass.ClientID %>" title="改变 Label 的样式">改变 Label
                        的样式</strong>。<br />
                    结果：回发后，后台给标签加上红色样式，输入值保留。
                </li>
                <li>
                    再次点击同一按钮。<br />
                    结果：标签切换为蓝色，之后在红、蓝之间循环，不重新创建字段。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>、<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>"
                        title="密码">密码</strong>）：<code>red</code>、<code>blue</code> 样式类选择字段标签的颜色。</li>
                <li><code>.f-field-fieldlabel</code>（<strong class="example-control-reference" data-example-control="<%= tbxUserName.ClientID %>"
                        title="用户名">用户名</strong>、<strong class="example-control-reference" data-example-control="<%= tbxPassword.ClientID %>"
                        title="密码">密码</strong>）：本页 CSS 针对标签文字设置样式。</li>
            </ul>
        </section>
    </template>
</body>
</html>
