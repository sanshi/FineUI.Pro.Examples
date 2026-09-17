using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_clearselectionbeforepaging_database_details : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable(Grid1.PageIndex, Grid1.PageSize);

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            return DataSourceUtil.GetDataTable2().Rows.Count;
        }

        /// <summary>
        /// 模拟数据库分页（实际项目中请直接使用SQL语句返回分页数据！）
        /// </summary>
        /// <returns></returns>
        private DataTable GetPagedDataTable(int pageIndex, int pageSize)
        {
            DataTable source = DataSourceUtil.GetDataTable2();

            DataTable paged = source.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > source.Rows.Count)
            {
                rowend = source.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(source.Rows[i]);
            }

            return paged;
        }

        #endregion

        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            SyncDetails();

            List<string> selectedRowIDs = new List<string>(Grid1.SelectedRowIDArray);

            StringBuilder sb = new StringBuilder();
            if (selectedRowIDs.Count > 0)
            {
                sb.AppendFormat("<p><strong>共选中了 {0} 行：</strong></p>", selectedRowIDs.Count);
                sb.Append("<table class=\"result\">");

                sb.Append("<tr>");
                sb.Append("<th>标识符</th>");
                sb.Append("<th>姓名</th>");
                sb.Append("<th>专业</th>");
                sb.Append("</tr>");

                Dictionary<string, object[]> syncedDetails = ViewState["SyncedDetails"] as Dictionary<string, object[]>;

                foreach (string selectedRowID in selectedRowIDs)
                {
                    if (syncedDetails.ContainsKey(selectedRowID))
                    {
                        object[] rowDataKey = syncedDetails[selectedRowID];
                        string rowId = rowDataKey[0].ToString();
                        string rowName = rowDataKey[1].ToString();
                        string rowMajor = rowDataKey[2].ToString();

                        sb.Append("<tr>");
                        sb.AppendFormat("<td>{0}</td>", rowId);
                        sb.AppendFormat("<td>{0}</td>", rowName);
                        sb.AppendFormat("<td>{0}</td>", rowMajor);
                        sb.Append("</tr>");
                    }
                }

                sb.Append("</table>");
            }
            else
            {
                sb.Append("<strong>没有选中任何一行！</strong>");
            }

            labResult.Text = sb.ToString();
        }

        protected void Grid1_PageIndexChanged(object sender, GridPageEventArgs e)
        {
            SyncDetails();

            BindGrid();
        }

        private void SyncDetails()
        {
            Dictionary<string, object[]> syncedDetails = ViewState["SyncedDetails"] as Dictionary<string, object[]>;
            if (syncedDetails == null)
            {
                syncedDetails = new Dictionary<string, object[]>();
            }

            List<string> selectedRowIDs = new List<string>(Grid1.SelectedRowIDArray);
            for (int i = 0; i < Grid1.DataKeys.Count; i++)
            {
                object[] rowDataKey = Grid1.DataKeys[i];
                string rowId = rowDataKey[0].ToString();

                if (selectedRowIDs.Contains(rowId))
                {
                    if (!syncedDetails.ContainsKey(rowId))
                    {
                        syncedDetails[rowId] = rowDataKey;
                    }
                }
                else
                {
                    if (syncedDetails.ContainsKey(rowId))
                    {
                        syncedDetails.Remove(rowId);
                    }
                }
            }

            ViewState["SyncedDetails"] = syncedDetails;
        }

        #endregion

    }
}
