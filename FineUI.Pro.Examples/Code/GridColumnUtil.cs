using System;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples
{
    /// <summary>
    /// 从表格合并后的数据读取复选框状态。RenderCheckField 的值是布尔数据，
    /// 例如用户将 101 行的“是否在校”勾选后，读取该行 values 中对应列的 true。
    /// </summary>
    public static class GridColumnUtil
    {
        public static bool GetCheckedState(Grid grid, string columnID, int rowIndex)
        {
            string rowID = grid.Rows[rowIndex].RowID;
            foreach (JObject row in grid.GetMergedData())
            {
                if (row.Value<string>("id") == rowID)
                {
                    return Convert.ToBoolean(row["values"][columnID]);
                }
            }
            return false;
        }

        public static void SetCheckedState(Grid grid, string columnID, int rowIndex, bool isChecked)
        {
            grid.Rows[rowIndex].SetCellValue(columnID, isChecked);
            // 同一次回发中可能先读取、再修改、再读取；同步已经生成的合并数据，避免读到旧值。
            string rowID = grid.Rows[rowIndex].RowID;
            foreach (JObject row in grid.GetMergedData())
            {
                if (row.Value<string>("id") == rowID)
                {
                    row["values"][columnID] = isChecked;
                    break;
                }
            }
            JObject values = new JObject();
            values.Add(columnID, isChecked);
            PageContext.RegisterStartupScript(grid.GetUpdateCellValueReference(rowIndex, values));
        }
    }
}
