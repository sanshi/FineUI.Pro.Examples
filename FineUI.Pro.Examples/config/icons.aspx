<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="icons.aspx.cs" Inherits="FineUI.Pro.Examples.config.icons" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        ul.icons {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        ul.icons li {
            display: inline-block;
            margin: 0 10px 10px 0;
            text-align: center;
            border-style: solid;
            border-width: 1px;
            padding: 10px 5px;
            width: 180px;
        }

        ul.icons li img {
            width: 16px;
            height: 16px;
        }

        ul.icons li .title {
            margin-top: 10px;
        }

        .mysearch {
            text-align: left;
        }

        .mysearch .f-field-textbox {
            height: 46px;
            font-size: 24px;
            line-height: 28px;
            padding: 8px 12px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server"></f:PageManager>
        <div class="mysearch">
            <f:TextBox ID="tbxSearch" ShowLabel="false" EmptyText="搜索图标" runat="server" Width="350px">
                <Listeners>
                    <f:Listener Event="change" Handler="onSearchBoxChange" />
                </Listeners>
            </f:TextBox>
        </div>
        <br />
        <asp:Literal EnableViewState="false" runat="server" ID="litIcons"></asp:Literal>
    </form>
    <script>
        function onSearchBoxChange(event) {
            var keyword = this.getValue().toLowerCase();

            $('ul.icons li').each(function() {
                var cnode = $(this),
                    title = cnode.find('.title').text().toLowerCase();

                if (title.indexOf(keyword) >= 0) {
                    cnode.show();
                } else {
                    cnode.hide();
                }
            });
        }


        F.ready(function() {
            $('ul.icons li').hover(function() {
                $(this).addClass('f-state-hover');
            }, function() {
                $(this).removeClass('f-state-hover');
            });
        });

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按名称搜索内置图片图标，并对照图像选择控件需要的图标。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>查找图标</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxSearch").ClientID %>'
                        title="搜索图标">搜索图标</strong>输入 <code>Add</code>。<br />结果：浏览器即时筛选名称匹配的图标，清空搜索后恢复完整列表。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Icon</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxSearch").ClientID %>'
                        title="搜索图标">搜索图标</strong>）：使用内置图标枚举名称配置控件图片图标；列表中的文字用于辨认图标。</li>
            </ul>
        </section>
    </template>
</body>
</html>
