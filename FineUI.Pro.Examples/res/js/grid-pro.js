// Pro 普通列示例专用的渲染和输入辅助函数，按页面需要加载。
// 这些函数配合 Pro 的行命令与表单回发，不作为其它端的公共资源分发。

// 保留由页面自己的点击处理器执行的编辑、删除动作。
// 去掉框架行命令标记，避免自定义点击之外又触发一次行命令。
function renderClientAction(value, params, command) {
    var link = $(value).removeClass('f-grid-command');
    link.find('img').addClass('f-grid-imagefield');
    return link;
}

// 动态列仍显示普通文本，同时保留悬停时查看完整专业名称的提示。
function renderMajorText(value, params) {
    return $('<span>').text(value).attr('data-qtip', F.htmlEncode(value));
}

// 禁用的复选框仍展示当前值，但不能通过点击或单元格编辑修改。
function renderDisabledCheck(value, params) {
    params.cellCls = 'f-state-disabled f-grid-cell-uneditable';
    return value;
}

// 批量勾选时同时更新单元格和原始数据，后续回发才能读到新的布尔值。
function setSelectedCheckColumns(gridId, columnIds, isChecked) {
    var grid = F(gridId);
    var values = {};
    columnIds.forEach(function (columnId) {
        values[columnId] = isChecked;
    });
    grid.getSelectedRows().forEach(function (rowId) {
        grid.updateCellValue(rowId, values);
    });
}

// 在普通渲染列中创建原生输入框。名称包含表格、行 ID 和输入框 ID，
// 例如 Grid1_101_tbxGroupName，回发时即使行被排序，也能准确取得这一行的输入值。
function getGridInputName(params, inputId) {
    return params.grid.id + '_' + params.rowData.id + '_' + inputId;
}

function createGridTextInput(value, params, options) {
    return $('<input>').attr({
        type: 'text',
        id: getGridInputName(params, options.id),
        name: getGridInputName(params, options.id),
        value: value == null ? '' : value,
        tabindex: options.tabIndex == null ? params.rowIndex + 10 : options.tabIndex
    }).addClass(options.cssClass).css('width', options.width);
}

// 用浏览器输入控件展示选择项，后台直接读取表单值，无需为每行创建 ASP.NET 控件。
// 性别值既支持原始的 0/1，也支持已经转换的“男/女”；兴趣爱好保留逗号分隔的标识符。
function createGridChoiceInput(value, params, options) {
    var name = getGridInputName(params, options.id);
    var gender = String(value) === '1' || value === '男' ? '男' : '女';
    if (options.type === 'DropDownList') {
        var select = $('<select>').attr({ id: name, name: name }).addClass(options.cssClass)
            .append($('<option>').val('男').text('男'))
            .append($('<option>').val('女').text('女'));
        // 渲染器返回的节点会先转换为 HTML；把初始选项写成属性，浏览器重建节点后仍能保留女选项。
        select.find('option').filter(function () {
            return this.value === gender;
        }).attr('selected', 'selected');
        return select;
    }

    var container = $('<span>').addClass(options.cssClass);
    var choices = options.type === 'CheckBoxList'
        ? [['reading', '读书'], ['basketball', '篮球'], ['travel', '旅游'], ['movie', '电影'], ['music', '音乐']]
        : [['男', '男'], ['女', '女']];
    var selected = String(value || '').split(',');
    choices.forEach(function (choice) {
        var checkbox = options.type === 'CheckBoxList';
        var input = $('<input>').attr({
            type: checkbox ? 'checkbox' : 'radio',
            name: name,
            value: choice[0]
        });
        var isSelected = checkbox ? selected.indexOf(choice[0]) >= 0 : gender === choice[0];
        if (isSelected) {
            input.attr('checked', 'checked');
        }
        container.append($('<label>').append(input, document.createTextNode(choice[1])));
    });
    return container;
}
