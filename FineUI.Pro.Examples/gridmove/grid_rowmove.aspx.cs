using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_rowmove : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_RowMove")
            {
                JArray rowIds = e.EventArgumentsAsJObject.Value<JArray>("rowIds");
                DataTable originalTable = DataSourceUtil.GetDataTable();
                DataTable newTable = originalTable.Clone();

                foreach (string rowId in rowIds)
                {
                    DataRow rowInOriginalTable = FindRow(rowId, originalTable);
                    if (rowInOriginalTable != null)
                    {
                        newTable.ImportRow(rowInOriginalTable);
                    }
                }

                Session[KEY_FOR_DATASOURCE_SESSION] = newTable;
                ShowNotify("数据保存成功！");
            }
        }

        private DataRow FindRow(string rowId, DataTable table)
        {
            foreach (DataRow row in table.Rows)
            {
                if (row["Id"].ToString() == rowId)
                {
                    return row;
                }
            }
            return null;
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = GetSavedDataSource();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }



        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "grid_rowmove_datasource";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSavedDataSource()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = DataSourceUtil.GetDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }


        #endregion


    }
}
