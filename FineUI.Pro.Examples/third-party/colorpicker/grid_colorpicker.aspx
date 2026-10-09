<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_colorpicker.aspx.cs"
    Inherits="FineUI.Pro.Examples.third_party.colorpicker.grid_colorpicker" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <link rel="stylesheet" href="<%= PageContext.ResolveUrl("~/res/third-party/spectrum/spectrum.css") %>" />
        <style>
            .mycolor {
                display: inline-block !important;
                width: 100px;
                margin-right: 5px;
            }

            .mycolor .sp-replacer {
                border-width: 0;
                background-color: transparent;
            }

            .mycolor .sp-dd {
                display: none;
            }

            .mycolor .sp-preview {
                margin-right: 0;
                height: 100%;
            }

        </style>



    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField HeaderText="颜色" Width="150px" RendererFunction="renderInput1" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="获取用户输入的分组值" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-pro.js") %>"></script>
    <script>
        function renderInput1(value, params) {
            params.grid = this;
            return createGridTextInput(value, params, {
                id: 'tbxColor',
                cssClass: 'mycolor',
                width: '100px'
            });
        }

    </script>
    <script src="<%= PageContext.ResolveUrl("~/res/third-party/spectrum/spectrum.js") %>" type="text/javascript"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/third-party/spectrum/i18n/jquery.spectrum-zh-cn.js") %>" type="text/javascript"></script>
    <script>
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        F.ready(function() {

            $('.mycolor').each(function() {
                $(this).spectrum({
                    preferredFormat: "hex3",
                    showInput: true,
                    showPalette: true,
                    palette: [
                        ["#000", "#444", "#666", "#999", "#ccc", "#eee", "#f3f3f3", "#fff"],
                        ["#f00", "#f90", "#ff0", "#0f0", "#0ff", "#00f", "#90f", "#f0f"],
                        ["#f4cccc", "#fce5cd", "#fff2cc", "#d9ead3", "#d0e0e3", "#cfe2f3", "#d9d2e9", "#ead1dc"],
                        ["#ea9999", "#f9cb9c", "#ffe599", "#b6d7a8", "#a2c4c9", "#9fc5e8", "#b4a7d6", "#d5a6bd"],
                        ["#e06666", "#f6b26b", "#ffd966", "#93c47d", "#76a5af", "#6fa8dc", "#8e7cc3", "#c27ba0"],
                        ["#c00", "#e69138", "#f1c232", "#6aa84f", "#45818e", "#3d85c6", "#674ea7", "#a64d79"],
                        ["#900", "#b45f06", "#bf9000", "#38761d", "#134f5c", "#0b5394", "#351c75", "#741b47"],
                        ["#600", "#783f04", "#7f6000", "#274e13", "#0c343d", "#073763", "#20124d", "#4c1130"]
                    ]
                });
            });
        });

    </script>
</body>
</html>
