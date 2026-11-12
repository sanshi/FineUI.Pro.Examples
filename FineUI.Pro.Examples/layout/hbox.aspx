<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BodyPadding="10px"
            BoxConfigSpace="5" ShowHeader="true" Title="面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" BoxFlex="1" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="面板2" Width="150px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="Width=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" Title="面板3" BoxFlex="2" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=2">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="Stretch"
            BoxConfigPosition="End" BodyPadding="10px" BoxConfigSpace="5" ShowHeader="true"
            Title="面板（Layout=HBox Height=350 BoxConfigAlign=Stretch BoxConfigPosition=End）">
            <Items>
                <f:Panel ID="Panel6" Title="面板1" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel7" Title="面板2" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel8" Title="面板3" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label6" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel9" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="Stretch"
            BoxConfigPosition="Center" BodyPadding="10px" BoxConfigSpace="5" ShowHeader="true"
            Title="面板（Layout=HBox Height=350 BoxConfigAlign=Stretch BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel10" Title="面板1" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label7" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel11" Title="面板2" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label8" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel12" Title="面板3" Width="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label9" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel13" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="Center"
            BoxConfigPosition="End" BodyPadding="10px" BoxConfigSpace="5" ShowHeader="true"
            Title="面板（Layout=HBox Height=350 BoxConfigAlign=Center BoxConfigPosition=End）">
            <Items>
                <f:Panel ID="Panel14" Title="面板1" Width="200px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label10" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel15" Title="面板2" Width="200px" Height="150px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label11" runat="server" Text="Width=200px Height=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel16" Title="面板3" Width="200px" Height="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label12" runat="server" Text="Width=200px Height=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel21" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="End"
            BoxConfigPosition="Center" BodyPadding="10px" BoxConfigSpace="5" ShowHeader="true"
            Title="面板（Layout=HBox Height=350 BoxConfigAlign=End BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel22" Title="面板1" Width="200px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label16" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel23" Title="面板2" Width="200px" Height="150px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label17" runat="server" Text="Width=200px Height=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel24" Title="面板3" Width="200px" Height="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label18" runat="server" Text="Width=200px Height=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel17" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="StretchMax"
            BoxConfigPosition="Center" BodyPadding="10px" BoxConfigSpace="5" ShowHeader="true"
            Title="面板（Layout=HBox Height=350 BoxConfigAlign=StretchMax BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel18" Title="面板1" Width="200px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label13" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel19" Title="面板2" Width="200px" Height="150px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label14" runat="server" Text="Width=200px Height=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel20" Title="面板3" Width="200px" Height="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label15" runat="server" Text="Width=200px Height=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel25" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox"
            BoxConfigAlign="StretchMaxCenter" BoxConfigPosition="Center" BodyPadding="10px" BoxConfigSpace="5" ShowHeader="true"
            Title="面板（Layout=HBox Height=350 BoxConfigAlign=StretchMaxCenter BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel26" Title="面板1" Width="200px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label19" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel27" Title="面板2" Width="200px" Height="150px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label20" runat="server" Text="Width=200px Height=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel28" Title="面板3" Width="200px" Height="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label21" runat="server" Text="Width=200px Height=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel31" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="StretchMaxEnd"
            BoxConfigPosition="Center" BodyPadding="10px" BoxConfigSpace="5" ShowHeader="true"
            Title="面板（Layout=HBox Height=350 BoxConfigAlign=StretchMaxEnd BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel32" Title="面板1" Width="200px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label23" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel33" Title="面板2" Width="200px" Height="150px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label24" runat="server" Text="Width=200px Height=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel34" Title="面板3" Width="200px" Height="200px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label25" runat="server" Text="Width=200px Height=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel29" IsFluid="true" runat="server" Height="350px" ShowBorder="true" EnableCollapse="false" Layout="HBox" BoxConfigAlign="Center"
            BoxConfigPosition="Center" BodyPadding="10px" ShowHeader="true" Title="面板（Layout=HBox Height=350 BoxConfigAlign=Center BoxConfigPosition=Center）">
            <Items>
                <f:Panel ID="Panel30" Title="面板（居中显示）" Width="200px" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label22" runat="server" Text="Width=200px Height=100px">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把子面板水平排列，并按比例分配剩余宽度。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）">面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）</strong>中横向调整浏览器宽度。<br />结果：同一行的固定宽度项目保留自身宽度，<code>BoxFlex</code> 项按比例分配剩余空间。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（本页各面板，如<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）">面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）</strong>）：设为<code>HBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>BoxFlex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）的面板1">面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）的面板1</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel4").ClientID %>' title="面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）的面板3">面板（Layout=HBox Height=350）（默认值：BoxConfigAlign=Stretch BoxConfigPosition=Start）的面板3</strong>）：各组分别设为<code>1</code>、<code>2</code>，直接子项按此比例分配父容器剩余空间。</li>
    </ul>
</section>
</template>
</body>
</html>
