<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="column.aspx.cs" Inherits="FineUI.Pro.Examples.layout.column" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .columnpanel {
            margin-right: 5px;
        }

        .rowpanel {
            margin-bottom: 5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="250px" ShowBorder="true" EnableCollapse="false" BodyPadding="10px" Layout="Column"
            ShowHeader="true" Title="面板（Height=250px Layout=Column）">
            <Items>
                <f:Panel ID="Panel1" Width="200px" Height="150px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label runat="server" Text="Width=200px Height=150px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" ColumnWidth="60%" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false" Layout="Fit">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="ColumnWidth=60%<br />长长的文本1<br />长长的文本2<br />长长的文本3<br />长长的文本4" EncodeText="false">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" ColumnWidth="40%" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="ColumnWidth=40%">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" Height="250px" ShowBorder="true" EnableCollapse="false" BodyPadding="10px" Layout="Column"
            ShowHeader="true" Title="面板（Height=250px Layout=Column）">
            <Items>
                <f:Panel ID="Panel6" Width="200px" Height="150px" CssClass="columnpanel" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="Width=200px Height=150px CssClass=columnpanel">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel7" ColumnWidth="60%" CssClass="columnpanel" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false"
                    Layout="Fit">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="ColumnWidth=60% CssClass=columnpanel<br />长长的文本1<br />长长的文本2<br />长长的文本3<br />长长的文本4"
                            EncodeText="false">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel8" ColumnWidth="40%" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="ColumnWidth=40%">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel9" IsFluid="true" Height="350px" Layout="Column" BodyPadding="10px" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" Title="面板（Height=350px Layout=Column BodyPadding=5）">
            <Items>
                <f:Panel ID="Panel13" ColumnWidth="50%" MarginRight="5px" Title="ColumnWidth=50% MarginRight=5" ShowBorder="true" ShowHeader="true"
                    runat="server">
                    <Items>
                        <f:Panel ID="Panel14" Height="150px" MarginBottom="5px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label8" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel15" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label9" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel16" ColumnWidth="50%" Title="ColumnWidth=50%" ShowBorder="true" ShowHeader="true" runat="server">
                    <Items>
                        <f:Panel ID="Panel17" Height="100px" MarginBottom="5px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label10" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel18" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label11" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <br />
        <strong>【推荐】</strong>使用HBox布局实现与上例相同的界面：
        <br />
        <hr />
        <br />
        <f:Panel ID="Panel10" IsFluid="true" Height="350px" Layout="HBox" EnableCollapse="false" BodyPadding="10px" BoxConfigSpace="5" ShowBorder="true"
            ShowHeader="true" runat="server" Title="面板（Height=350px Layout=HBox BodyPadding=5 BoxConfigSpace=5）">
            <Items>
                <f:Panel ID="Panel11" BoxFlex="1" Title="BoxFlex=1" ShowBorder="true" ShowHeader="true" runat="server">
                    <Items>
                        <f:Panel ID="Panel12" Height="150px" MarginBottom="5px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label6" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel19" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label7" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel20" BoxFlex="1" Title="BoxFlex=1 末项无额外间隔" ShowBorder="true" ShowHeader="true" runat="server">
                    <Items>
                        <f:Panel ID="Panel21" Height="100px" MarginBottom="5px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label12" runat="server" Text="Height=100px MarginBottom=5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel22" Height="100px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label13" runat="server" Text="Height=100px">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示按列宽把项目排列在同一行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>'
                        title="第 1 个面板（面板（Height=250px Layout=Column））">第 1 个面板（面板（Height=250px
                        Layout=Column））</strong>中改变浏览器宽度，对照同一行各列。<br />结果：百分比列随容器宽度伸缩，其它列保留本页指定尺寸。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Layout</code>（本页各面板，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="第 1 个面板（面板（Height=250px Layout=Column））">第 1
                        个面板（面板（Height=250px Layout=Column））</strong>）：各组分别设为<code>Column</code>、<code>Fit</code>、<code>HBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。
                </li>
                <li><code>ColumnWidth</code>（本页各面板，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel4").ClientID %>' title="第 3 个面板">第 3
                        个面板</strong>）：各组分别设为<code>60%</code>、<code>40%</code>、<code>50%</code>，规定当前子项占用的列宽。</li>
            </ul>
        </section>
    </template>
</body>
</html>
