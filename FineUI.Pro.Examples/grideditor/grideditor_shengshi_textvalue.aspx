<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_shengshi_textvalue.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_shengshi_textvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false"
            runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Sheng" DataField="Sheng"
                    HeaderText="所在省" RendererFunction="renderSheng">
                    <Editor>
                        <f:DropDownList ID="ddlSheng" Required="true" runat="server">
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="Shi" DataField="Shi"
                    HeaderText="所在市" RendererFunction="renderShi">
                    <Editor>
                        <f:DropDownList ID="ddlShi" Required="true" runat="server">
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="beforeedit" Handler="onGridBeforeEdit" />
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>如果未设置省份，则所在市下拉列表禁用，并且显示提示信息 - 请先选择省！
            </li>
            <li>选择省份后，所在市下拉列表数据动态加载
            </li>
            <li>更改省份后，如果所在所在市不属于当前省份，则清空所在市
            </li>
            <li>省市单元格保存的值是代码，而非名称
            </li>
        </ul>
    </form>
    <script>

        var gridClientID = '<%= Grid1.ClientID %>';
        var ddlShiClientID = '<%= ddlShi.ClientID %>';
        var ddlShengClientID = '<%= ddlSheng.ClientID %>';

        // 省市的数据输出到前台，类似如下结构
        /*
        window._SHENG = [
            ["001", "北京"],
            ["002", "河南"],
            ["003", "河北"],
            ["004", "湖南"],
            ["005", "湖北"],
            ["006", "广西"],
            ["007", "安徽"]
        ];
        window._SHI = {
            "001": [
                ["001001", "北京市"]
            ],
            "002": [
                ["002001", "郑州市"],
                ["002002", "开封市"],
                ["002003", "洛阳市"],
                ["002004", "平顶山市"],
                ["002005", "安阳市"],
                ["002006", "鹤壁市"],
                ["002007", "新乡市"],
                ["002008", "焦作市"],
                ["002009", "濮阳市"],
                ["002010", "许昌市"],
                ["002011", "漯河市"],
                ["002012", "三门峡市"],
                ["002013", "南阳市"],
                ["002014", "商丘市"],
                ["002015", "信阳市"],
                ["002016", "周口市"],
                ["002017", "驻马店市"],
                ["002018", "济源市"]
            ]
        };
        */

        // 渲染性别单元格
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        // 渲染省单元格
        function renderSheng(value) {
            return getShengName(value);
        }

        // 渲染市单元格
        function renderShi(value, params) {
            var shengValue = params.rowValue['Sheng']; // 'Sheng' - ColumnID
            return getShiName(shengValue, value);
        }

        // 根据省代码获取省名称
        function getShengName(shengValue) {
            var shengName = '', sheng;
            if (shengValue) {
                for (var i = 0, count = window._SHENG.length; i < count; i++) {
                    sheng = window._SHENG[i];
                    if (shengValue == sheng[0]) {
                        shengName = sheng[1];
                        break;
                    }
                }
            }
            return shengName;
        }

        // 根据省代码和市代码获取市名称
        function getShiName(shengValue, shiValue) {
            var shiData = window._SHI[shengValue], shi, shiName = '';
            if (shiData) {
                for (var i = 0, count = shiData.length; i < count; i++) {
                    shi = shiData[i];
                    if (shiValue == shi[0]) {
                        shiName = shi[1];
                        break;
                    }
                }
            }
            return shiName;
        }

        // 页面加载完毕
        F.ready(function () {
            F(ddlShengClientID).loadData(window._SHENG);
        });

        // 单元格编辑前
        function onGridBeforeEdit(event, value, params) {
            var grid = F(gridClientID);

            if (params.columnId === 'Shi') {
                var ddlShi = F(ddlShiClientID);

                var sheng = grid.getCellValue(params.rowId, 'Sheng');

                var shidata = window._SHI[sheng];
                if (shidata) {
                    ddlShi.enable();
                    ddlShi.setEmptyText('');
                    ddlShi.loadData(shidata);
                } else {
                    ddlShi.setEmptyText('请先选择省！');
                    ddlShi.disable();
                }
            }
        }

        // 单元格编辑后
        function onGridAfterEdit(event, value, params) {
            var grid = F(gridClientID);

            if (params.columnId === 'Sheng') {
                var shidata = window._SHI[value];
                if (shidata) {
                    var shi = grid.getCellValue(params.rowId, 'Shi');
                    // 如果结束编辑时，市 不属于 当前 省，则清空 市
                    if ($.inArray(shi, shidata) < 0) {
                        grid.updateCellValue(params.rowId, 'Shi', '');
                    }
                }
            }
        }

    </script>
</body>
</html>
