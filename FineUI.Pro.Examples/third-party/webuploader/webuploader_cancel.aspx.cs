using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.thirdparty
{
    public partial class webuploader_cancel : WebUploaderPageBase
    {
        private static readonly string KEY_FOR_DATASOURCE_SESSION = "webuploader.webuploader_cancel";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
 

                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_Rebind")
            {
                BindGrid();
            }
            else if (e.EventName == "Grid1_DeleteRows")
            {
                DeleteSelectedRows(e.EventArgumentsAsJObject.Value<JArray>("selectedRows").ToObject<string[]>());
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            Grid1.DataSource = GetSourceData(KEY_FOR_DATASOURCE_SESSION);
            Grid1.DataBind();
        }

        #endregion

        #region Events

        // 删除按钮走自定义回发（客户端确认后由页面脚本发起，选中行的标识随事件带上来）
        private void DeleteSelectedRows(string[] rowIDs)
        {
            foreach (string rowID in rowIDs)
            {
                DeleteRow(KEY_FOR_DATASOURCE_SESSION, rowID);
            }

            BindGrid();
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DeleteRow(KEY_FOR_DATASOURCE_SESSION, e.RowID);

                BindGrid();
            }
        }
        #endregion

    }
}
