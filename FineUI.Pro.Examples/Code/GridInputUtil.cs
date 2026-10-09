using System;
using System.Web;

namespace FineUI.Pro.Examples
{
    /// <summary>
    /// 读取普通渲染列中的原生输入控件。使用稳定行 ID 定位，例如 Grid1_101_tbxGroupName，
    /// 避免排序或分页后把其它行的输入值当作当前行的值。
    /// </summary>
    public static class GridInputUtil
    {
        public static string GetValue(Grid grid, string rowID, string inputID)
        {
            string name = grid.ClientID + "_" + rowID + "_" + inputID;
            return HttpContext.Current.Request.Form[name] ?? String.Empty;
        }
    }
}
