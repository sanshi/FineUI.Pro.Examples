using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.griddataurl
{
    public partial class griddataurl_rowdoubleclick : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        

        #region Events

        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            // 网址数据源模式下，DataKeys 无效！
            JObject rowValue = GetDataUrlSelectedRowValue(e.RowID);

            ShowNotify(String.Format("你双击了第 {0} 行，行ID：{1}，姓名：{2}", e.RowIndex + 1, e.RowID, rowValue.Value<string>("Name")));

        }

        #endregion

    }
}
