using System;
using System.Collections.Generic;

namespace FineUI.Pro.Examples
{
    /// <summary>
    /// 表格行选择示例共用工具。选择状态始终使用稳定行ID；只有调用仍要求行位置的列接口时，
    /// 才把选中ID解析为当前控件行。
    /// </summary>
    public static class GridSelectionUtil
    {
        /// <summary>
        /// 获取当前选中的控件行，返回顺序与SelectedRowIDArray一致。
        /// </summary>
        public static List<GridRow> GetSelectedRows(Grid grid)
        {
            List<GridRow> selectedRows = new List<GridRow>();
            foreach (string rowID in grid.SelectedRowIDArray)
            {
                GridRow row = grid.FindRow(rowID);
                if (row == null)
                {
                    throw new InvalidOperationException("找不到选中的表格行，行ID：" + rowID);
                }
                selectedRows.Add(row);
            }
            return selectedRows;
        }

        /// <summary>
        /// 判断指定稳定行ID是否处于选中状态。
        /// </summary>
        public static bool IsRowSelected(Grid grid, string rowID)
        {
            return Array.IndexOf(grid.SelectedRowIDArray, rowID) >= 0;
        }
    }
}
