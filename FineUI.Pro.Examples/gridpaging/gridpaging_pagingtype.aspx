<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pagingtype.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pagingtype" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="60px" />
                <f:RenderField Width="150px" DataField="Id" HeaderText="ID" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="EntranceTime" HeaderText="时间" />
            </Columns>
        </f:Grid>
        <br />
        <f:CheckBox runat="server" ID="cbxShowPagingMessage" Checked="true" Text="显示分页信息">
            <Listeners>
                <f:Listener Event="change" Handler="OnCheckBoxChange" />
            </Listeners>
        </f:CheckBox>
        <br />
        <br />
        分页工具栏的类型：
        <br />
        <br />
        <f:ButtonGroup ID="bgPagingType" runat="server" EnablePressGroup="true">
            <Items>
                <f:Button Text="Arrow" EnablePress="true" runat="server" />
                <f:Button Text="NumberBox" EnablePress="true" runat="server" />
                <f:Button Text="ArrowNumberBox" EnablePress="true" Pressed="true" runat="server" />
                <f:Button ID="btnNumber" ClientIDMode="Static" Text="NumberButton" EnablePress="true" runat="server" />
                <f:Button Text="ArrowNumberButton" EnablePress="true" runat="server" />
            </Items>
            <Listeners>
                <f:Listener Event="presschange" Handler="onButtonGroupPressChange" />
            </Listeners>
        </f:ButtonGroup>
        <br />
        数字分页按钮的个数：
        <br />
        <br />
        <f:DropDownList runat="server" ID="ddlMaxPagingNumberButton" Width="120px">
            <Items>
                <f:ListItem Text="5" Value="5" Selected="true" />
                <f:ListItem Text="8" Value="8" />
                <f:ListItem Text="10" Value="10" />
            </Items>
            <Listeners>
                <f:Listener Event="change" Handler="onDropDownListChange" />
            </Listeners>
        </f:DropDownList>
    </form>
    <script>
        var cbxShowPagingMessageClientID = '<%= cbxShowPagingMessage.ClientID %>';
        var bgPagingTypeClientID = '<%= bgPagingType.ClientID %>';
        var ddlMaxPagingNumberButtonClientID = '<%= ddlMaxPagingNumberButton.ClientID %>';


        function getPressedPaingType() {
            var pressedPaingType = '';
            $.each(F(bgPagingTypeClientID).items, function(index, item) {
                if (item.isPressed()) {
                    pressedPaingType = item.getText();
                    return false; // break
                }
            });
            return pressedPaingType;
        }

        function reloadPage() {
            var pressedPaingType = getPressedPaingType();
            window.location.href = './gridpaging_pagingtype.aspx?type=' + pressedPaingType + '&message=' + F(cbxShowPagingMessageClientID).isChecked() +
                '&maxnumberbutton=' + F(ddlMaxPagingNumberButtonClientID).getValue();
        }

        function OnCheckBoxChange(event, checked) {
            reloadPage();
        }

        function onButtonGroupPressChange(event, btnObj, btnChecked) {
            reloadPage();
        }

        function onDropDownListChange(event) {
            reloadPage();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>切换分页栏的箭头、页码输入框和数字按钮组合，并调整分页信息及数字按钮数量。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换分页栏组成</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control="btnNumber"
                        title="NumberButton">NumberButton</strong>，再尝试点击其他分页类型按钮。<br />结果：页面重新采用所选分页类型，数字按钮、输入框及箭头随类型变化；仍可通过新分页栏换页。</li>
                <li>切换<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxShowPagingMessage").ClientID %>'
                        title="显示分页信息">显示分页信息</strong>，修改旁边的数字按钮数量选项。<br />结果：分页统计文字及最多显示的数字页码数量随配置变化。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PagingType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：选择箭头、输入框或数字按钮组成的分页栏。</li>
                <li><code>ShowPagingMessage</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：控制分页统计文字是否显示。</li>
                <li><code>MaxPagingNumberButton</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：限制数字分页按钮的数量。</li>
            </ul>
        </section>
    </template>
</body>
</html>
