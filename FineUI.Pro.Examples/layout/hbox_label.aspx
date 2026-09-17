<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_label.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_label" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .zuckerberg {
            padding: 10px;
        }

        .mylabel {
            border-width: 1px;
            border-style: solid;
        }

            .mylabel .f-field-label {
                margin: 0;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="200px" ShowBorder="true" EnableCollapse="true"
            Layout="HBox" BodyPadding="10px" BoxConfigChildMargin="0 5 0 0" ShowHeader="true" Title="面板（ContentPanel）">
            <Items>
                <f:ContentPanel ID="Panel1" runat="server" ShowBorder="true" ShowHeader="false" AutoScroll="true" BoxFlex="1">
                    <div class="zuckerberg">
                        <p>
                            <a href="http://baike.baidu.com/view/1299586.htm" target="_blank"><b>马克·扎克伯格</b></a>
                        </p>
                        <p>
                            马克·艾略特·扎克伯格（Mark Elliot Zuckerberg），美国社交网站Facebook的创办人，被人们冠以“第二盖茨”的美誉。哈佛大学计算机和心理学专业辍学生。据《福布斯》杂志保守估计，马克·扎克伯格拥有135亿美元身家，是2008年全球最年轻的巨富，也是历来全球最年轻的自行创业亿万富豪。
                        </p>
                        <p>
                            2014年2月10日，马克·扎克伯格及其华裔妻子普莉希拉·陈登上美国《慈善纪事报》2013年年度慈善排行榜榜首。
                        </p>
                    </div>
                </f:ContentPanel>
                <f:Panel ID="Panel4" BoxFlex="2" Margin="0" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=2 Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" Height="200px" ShowBorder="true" EnableCollapse="true"
            Layout="HBox" BodyPadding="10px" BoxConfigChildMargin="0 5 0 0" ShowHeader="true" Title="面板（Label）">
            <Items>
                <f:Label ID="Label1" runat="server" CssClass="mylabel f-widget-content" EncodeText="false" AutoScroll="true" BoxFlex="1">
                </f:Label>
                <f:Panel ID="Panel8" BoxFlex="2" Margin="0" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label6" runat="server" Text="BoxFlex=2 Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
