<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobutton.aspx.cs" Inherits="FineUI.Pro.Examples.form.radiobutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="150px" Title="简单表单" EnableCollapse="false" BodyPadding="10px" ShowBorder="true"
            ShowHeader="true">
            <Items>
                <f:RadioButton ID="rbtnSingleRadio" Label="单选框" Text="可选项" runat="server">
                </f:RadioButton>
                <f:Button ID="btnSelectSingleRadio" CssClass="marginr" Text="选择/反选单选框" OnClick="btnSelectSingleRadio_Click" runat="server">
                </f:Button>
                <f:Button ID="btnChangeCheckStatus" CssClass="marginr" Text="选择/反选单选框（客户端脚本）" runat="server" ClickHandler="onChangeCheckStatusClick"></f:Button>
                <f:Label runat="server">
                </f:Label>
                <f:RadioButton ID="rbtnFirst" Label="单选框（分组）" Checked="true" GroupName="MyRadioGroup1" Text="可选项 1" runat="server">
                </f:RadioButton>
                <f:RadioButton ID="rbtnSecond" GroupName="MyRadioGroup1" ShowEmptyLabel="true" Text="可选项 2" runat="server">
                </f:RadioButton>
                <f:RadioButton ID="rbtnThird" GroupName="MyRadioGroup1" ShowEmptyLabel="true" Text="可选项 3" runat="server">
                </f:RadioButton>
                <f:Button ID="btnSelectSecondRadio" Text="选中分组单选框中的下一个" OnClick="btnSelectSecondRadio_Click" runat="server">
                </f:Button>
                <f:Label runat="server">
                </f:Label>
                <f:RadioButton ID="rbtnFirstAuto" Label="单选框（自动回发）" Checked="true" GroupName="MyRadioGroup2" Text="可选项 1" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged">
                </f:RadioButton>
                <f:RadioButton ID="rbtnSecondAuto" GroupName="MyRadioGroup2" ShowEmptyLabel="true" Text="可选项 2" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged">
                </f:RadioButton>
                <f:RadioButton ID="rbtnThirdAuto" GroupName="MyRadioGroup2" ShowEmptyLabel="true" Text="可选项 3" runat="server"
                    OnCheckedChanged="rbtnAuto_CheckedChanged">
                </f:RadioButton>
            </Items>
        </f:SimpleForm>
    </form>
    <script>
        var radioClientID = '<%= rbtnSingleRadio.ClientID %>';

        function onChangeCheckStatusClick(event) {
            var radio = F(radioClientID);
            radio.setValue(!radio.getValue());
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比独立<strong class="example-control-reference" data-example-control="<%= rbtnSingleRadio.ClientID %>" title="可选项">单选框</strong>的状态切换、分组互斥和变化事件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-radio-button-checked" aria-hidden="true"></i>同组只选一项</h3>
            <ol>
                <li>
                    在<strong class="example-control-reference" data-example-control="<%= rbtnFirst.ClientID %>"
                        title="第 2 个单选框（可选项 1）">单选框（分组）</strong>中选择<strong class="example-control-reference" data-example-control="<%= rbtnSecond.ClientID %>"
                        title="第 3 个单选框（可选项 2）">第 3 个单选框（可选项 2）</strong>、<strong class="example-control-reference"
                        data-example-control="<%= rbtnSecondAuto.ClientID %>" title="第 6 个单选框（可选项 2）">第 6 个单选框（可选项 2）</strong>。<br />
                    结果：第二项选中，第一项取消。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>通过按钮切换</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnSelectSecondRadio.ClientID %>"
                        title="选中分组单选框中的下一个">选中分组单选框中的下一个</strong>。<br />
                    结果：回发后由后台选中分组中的下一项，并取消原来选中项。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GroupName</code>（<strong class="example-control-reference" data-example-control="<%= rbtnFirst.ClientID %>" title="第 2 个单选框（可选项 1）">第
                        2 个单选框（可选项 1）</strong>）：名称相同的<strong class="example-control-reference" data-example-control="<%= rbtnSingleRadio.ClientID %>"
                        title="可选项">单选框</strong>互斥，不同分组相互独立。 本页<strong class="example-control-reference" data-example-control="<%= rbtnFirst.ClientID %>"
                        title="第 2 个单选框（可选项 1）">单选框（分组）</strong>声明值为 <code>MyRadioGroup1</code>。</li>
                <li><code>Checked</code>（<strong class="example-control-reference" data-example-control="<%= rbtnFirst.ClientID %>" title="第 2 个单选框（可选项 1）">第 2
                        个单选框（可选项 1）</strong>）：指定<strong class="example-control-reference" data-example-control="<%= rbtnSingleRadio.ClientID %>"
                        title="可选项">单选框</strong>的初始选中状态。 本页<strong class="example-control-reference" data-example-control="<%= rbtnFirst.ClientID %>"
                        title="第 2 个单选框（可选项 1）">单选框（分组）</strong>声明值为 <code>true</code>。</li>
                <li><code>OnCheckedChanged</code>（<strong class="example-control-reference" data-example-control="<%= rbtnFirstAuto.ClientID %>"
                        title="第 5 个单选框（可选项 1）">第 5 个单选框（可选项 1）</strong>）：用户改变当前分组选择后回发并显示结果。 本页<strong class="example-control-reference"
                        data-example-control="<%= rbtnFirstAuto.ClientID %>" title="第 5 个单选框（可选项 1）">单选框（自动回发）</strong>声明值为
                    <code>rbtnAuto_CheckedChanged</code>。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
