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

// 普通表格点击复选框不会更新行数据，查询时读取当前图标，而不是 values 中的初始值。
// columnIds 指定需要提交的复选框列；selectedOnly 为 false 时读取全部行（包括折叠的树节点）。
// 行号和姓名随状态一起提交，后台直接展示即可；使用数组保留选择顺序，避免数字 ID 对象键被重新排序。
function getGridCheckRows(grid, columnIds, selectedOnly) {
    if (grid.cellEditing) {
        grid.saveEdit();
    }
    var allRowEls = grid.getRowEls();
    var rowDataList;
    if (selectedOnly === false) {
        rowDataList = [];
        allRowEls.each(function () {
            rowDataList.push(grid.getRowData($(this)));
        });
    } else {
        rowDataList = grid.getSelectedRows(true);
    }

    var rows = [];
    rowDataList.forEach(function (rowData) {
        var rowEl = grid.getRowEl(rowData.id);
        var values = {
            id: rowData.id,
            // 树节点的 index 只表示同级下标；用全部行的位置显示全表行号，折叠节点也占一行。
            rowNumber: grid.tree ? allRowEls.index(rowEl) + 1 : rowData.index + 1,
            name: rowData.values.Name,
            gender: parseInt(rowData.values.Gender, 10)
        };
        columnIds.forEach(function (columnId) {
            values[columnId] = rowEl.find('.f-grid-cell-' + columnId + ' .f-grid-checkbox').hasClass('f-checked');
        });
        rows.push(values);
    });
    return rows;
}

// 批量设值前把行数据同步到当前界面，保证原来绑定为 true、后来手动取消的行也能再次勾选。
// 使用公开的更新接口同步图标和开关文字，不需要给普通表格开启单元格编辑。
function setGridCheckColumns(grid, rowIds, columnIds, isChecked) {
    rowIds.forEach(function (rowId) {
        var rowEl = grid.getRowEl(rowId);
        var rowData = grid.getRowData(rowEl);
        columnIds.forEach(function (columnId) {
            rowData.values[columnId] = rowEl.find('.f-grid-cell-' + columnId + ' .f-grid-checkbox').hasClass('f-checked');
            grid.updateCellValue(rowId, columnId, isChecked, true);
        });
    });
}

// 工具栏和右键菜单复用同一套批量勾选逻辑，只处理当前选中的行。
function setSelectedCheckColumns(gridId, columnIds, isChecked) {
    var grid = F(gridId);
    setGridCheckColumns(grid, grid.getSelectedRows(), columnIds, isChecked);
}

// 框架先切换复选框，再把当前状态交给后台；点击禁用的单元格不触发自定义回发。
function bindGridCheckChange(grid, columnId) {
    grid.el.on('click', '.f-grid-cell-' + columnId + ' .f-grid-checkbox', function (event) {
        var checkboxEl = $(this);
        if (checkboxEl.hasClass('f-state-disabled')
            || checkboxEl.parentsUntil('.f-grid-row', '.f-state-disabled').length) {
            return;
        }
        var rowData = grid.getRowData(checkboxEl.closest('.f-grid-row'));
        F.customEvent('GridCheckChanged', {
            rowId: rowData.id,
            columnId: columnId,
            isChecked: checkboxEl.hasClass('f-checked')
        });
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
