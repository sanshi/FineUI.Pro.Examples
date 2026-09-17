using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grideditor
{
    public partial class grideditor_renderfunction_params : PageBase
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
            DataTable table = GetSourceData();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        
        #endregion

        #region Events

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (JObject modifiedRow in Grid1.GetModifiedData())
            {
                if (modifiedRow.Value<string>("status") == "modified")
                {
                    Dictionary<string, object> rowDict = modifiedRow.Value<JObject>("values").ToObject<Dictionary<string, object>>();

                    // 按行标识找到数据源里对应的行（行标识由客户端随修改记录一并回传）
                    DataRow rowData = FindRowByID(GetSourceData(), Convert.ToInt32(modifiedRow.Value<string>("id")));

                    // 姓名
                    if (rowDict.ContainsKey("Name"))
                    {
                        rowData["Name"] = rowDict["Name"];
                    }
                    // 性别
                    if (rowDict.ContainsKey("Gender"))
                    {
                        rowData["Gender"] = rowDict["Gender"];
                    }
                    // 入学年份
                    if (rowDict.ContainsKey("EntranceYear"))
                    {
                        rowData["EntranceYear"] = rowDict["EntranceYear"];
                    }
                    // 入学日期
                    if (rowDict.ContainsKey("EntranceDate"))
                    {
                        rowData["EntranceDate"] = rowDict["EntranceDate"];
                    }
                    // 是否在校
                    if (rowDict.ContainsKey("AtSchool"))
                    {
                        rowData["AtSchool"] = rowDict["AtSchool"];
                    }
                    // 所学专业
                    if (rowDict.ContainsKey("Major"))
                    {
                        rowData["Major"] = rowDict["Major"];
                    }

                }
            }

            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()));

            BindGrid();

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }




        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_renderfunction_params";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
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
