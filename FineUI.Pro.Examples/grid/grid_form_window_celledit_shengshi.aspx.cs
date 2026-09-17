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
    public partial class grid_form_window_celledit_shengshi : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 绑定表格
                BindGrid();

                string shengScript = "window._SHENG=[[\"001\",\"北京\"],[\"002\",\"河南\"],[\"003\",\"河北\"],[\"004\",\"湖南\"],[\"005\",\"湖北\"],[\"006\",\"广西\"],[\"007\",\"安徽\"]];";
                string shiScript = "window._SHI={\"001\":[[\"001001\",\"北京市\"]],\"002\":[[\"002001\",\"郑州市\"],[\"002002\",\"开封市\"],[\"002003\",\"洛阳市\"],[\"002004\",\"平顶山市\"],[\"002005\",\"安阳市\"],[\"002006\",\"鹤壁市\"],[\"002007\",\"新乡市\"],[\"002008\",\"焦作市\"],[\"002009\",\"濮阳市\"],[\"002010\",\"许昌市\"],[\"002011\",\"漯河市\"],[\"002012\",\"三门峡市\"],[\"002013\",\"南阳市\"],[\"002014\",\"商丘市\"],[\"002015\",\"信阳市\"],[\"002016\",\"周口市\"],[\"002017\",\"驻马店市\"],[\"002018\",\"济源市\"]],\"003\":[[\"003001\",\"石家庄市\"],[\"003002\",\"唐山市\"],[\"003003\",\"秦皇岛市\"],[\"003004\",\"邯郸市\"],[\"003005\",\"邢台市\"],[\"003006\",\"保定市\"],[\"003007\",\"张家口市\"],[\"003008\",\"承德市\"],[\"003009\",\"沧州市\"],[\"003010\",\"廊坊市\"],[\"003011\",\"衡水市\"]],\"004\":[[\"004001\",\"长沙市\"],[\"004002\",\"株洲市\"],[\"004003\",\"湘潭市\"],[\"004004\",\"衡阳市\"],[\"004005\",\"邵阳市\"],[\"004006\",\"岳阳市\"],[\"004007\",\"常德市\"],[\"004008\",\"张家界市\"],[\"004009\",\"益阳市\"],[\"004010\",\"郴州市\"],[\"004011\",\"永州市\"],[\"004012\",\"怀化市\"],[\"004013\",\"娄底市\"],[\"004014\",\"湘西土家族苗族自治州\"]],\"005\":[[\"005001\",\"武汉市\"],[\"005002\",\"黄石市\"],[\"005003\",\"十堰市\"],[\"005004\",\"荆州市\"],[\"005005\",\"宜昌市\"],[\"005006\",\"襄樊市\"],[\"005007\",\"鄂州市\"],[\"005008\",\"荆门市\"],[\"005009\",\"孝感市\"],[\"005010\",\"黄冈市\"],[\"005011\",\"咸宁市\"],[\"005012\",\"随州市\"],[\"005013\",\"恩施土家族苗族自治州\"],[\"005014\",\"仙桃市\"],[\"005015\",\"天门市\"],[\"005016\",\"潜江市\"],[\"005017\",\"神农架林区\"]],\"006\":[[\"006001\",\"南宁市\"],[\"006002\",\"柳州市\"],[\"006003\",\"桂林市\"],[\"006004\",\"梧州市\"],[\"006005\",\"北海市\"],[\"006006\",\"防城港市\"],[\"006007\",\"钦州市\"],[\"006008\",\"贵港市\"],[\"006009\",\"玉林市\"],[\"006010\",\"百色市\"],[\"006011\",\"贺州市\"],[\"006012\",\"河池市\"],[\"006013\",\"来宾市\"],[\"006014\",\"崇左市\"]],\"007\":[[\"007001\",\"合肥市\"],[\"007002\",\"芜湖市\"],[\"007003\",\"蚌埠市\"],[\"007004\",\"淮南市\"],[\"007005\",\"马鞍山市\"],[\"007006\",\"淮北市\"],[\"007007\",\"铜陵市\"],[\"007008\",\"安庆市\"],[\"007009\",\"黄山市\"],[\"007010\",\"滁州市\"],[\"007011\",\"阜阳市\"],[\"007012\",\"宿州市\"],[\"007013\",\"巢湖市\"],[\"007014\",\"六安市\"],[\"007015\",\"亳州市\"],[\"007016\",\"池州市\"],[\"007017\",\"宣城市\"]]};";

                PageContext.RegisterPreStartupScript(shengScript + shiScript);
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

        // 保存数据
        protected void btnSaveAll_Click(object sender, EventArgs e)
        {
            if (Grid1.GetModifiedData().Count == 0)
            {
                labResult.Text = "";
                ShowNotify("表格数据没有变化！");
                return;
            }

            // 修改与删除先处理；新增行要等删除处理完，行序才与客户端一致
            foreach (JObject modifiedRow in Grid1.GetModifiedData())
            {
                string status = modifiedRow.Value<string>("status");

                if (status == "modified")
                {
                    int rowID = Convert.ToInt32(modifiedRow.Value<string>("id"));
                    DataRow row = FindRowByID(GetSourceData(), rowID);

                    UpdateDataRow(modifiedRow, row);
                }
                else if (status == "deleted")
                {
                    DeleteRowByID(GetSourceData(), Convert.ToInt32(modifiedRow.Value<string>("id")));
                }
            }


            // 新增行：客户端把它放在第几行，回发数据的 index 就是几，服务端照着插
            // （前提是表格不分页、也没在客户端排过序，否则 index 与数据源的行序对不上）
            DataTable table = GetSourceData();
            foreach (JObject modifiedRow in Grid1.GetModifiedData())
            {
                if (modifiedRow.Value<string>("status") == "newadded")
                {
                    table.Rows.InsertAt(CreateNewData(table, modifiedRow), modifiedRow.Value<int>("index"));
                }
            }

            labResult.Text = String.Format("用户修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()));


            BindGrid();

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }

        private DataRow CreateNewData(DataTable table, JObject modifiedRow)
        {
            DataRow rowData = table.NewRow();

            // 设置行ID（模拟数据库的自增长列）
            rowData["Id"] = GetNextRowID(GetSourceData());
            UpdateDataRow(modifiedRow, rowData);

            return rowData;
        }

        private void UpdateDataRow(JObject modifiedRow, DataRow rowData)
        {
            Dictionary<string, object> rowDict = modifiedRow.Value<JObject>("values").ToObject<Dictionary<string, object>>();

            // 姓名
            UpdateDataRow("Name", rowDict, rowData);

            // 性别
            UpdateDataRow("Gender", rowDict, rowData);

            // 入学年份
            UpdateDataRow("EntranceYear", rowDict, rowData);

            // 入学日期
            UpdateDataRow("EntranceDate", rowDict, rowData);

            // 是否在校
            UpdateDataRow("AtSchool", rowDict, rowData);

            // 所学专业
            UpdateDataRow("Major", rowDict, rowData);

            // 省
            UpdateDataRow("Sheng", rowDict, rowData);

            // 市
            UpdateDataRow("Shi", rowDict, rowData);

        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grid_form_window_celledit_shengshi";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                Session[KEY_FOR_DATASOURCE_SESSION] = GetTheDataTable();
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        /// <summary>
        /// 获取模拟表格（简单表格）
        /// </summary>
        /// <returns></returns>
        public DataTable GetTheDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Name", typeof(String)));
            table.Columns.Add(new DataColumn("EntranceYear", typeof(int)));
            table.Columns.Add(new DataColumn("AtSchool", typeof(bool)));
            table.Columns.Add(new DataColumn("Major", typeof(String)));
            table.Columns.Add(new DataColumn("Gender", typeof(int)));
            table.Columns.Add(new DataColumn("EntranceDate", typeof(String)));
            table.Columns.Add(new DataColumn("Sheng", typeof(String)));
            table.Columns.Add(new DataColumn("Shi", typeof(String)));


            DataRow row = table.NewRow();
            row[0] = 101;
            row[1] = "张萍萍";
            row[2] = 2000;
            row[3] = true;
            row[4] = "材料科学与工程系";
            row[5] = 0;
            row[6] = "2000-09-01";
            row[7] = "001";
            row[8] = "001001";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 102;
            row[1] = "陈飞";
            row[2] = 2000;
            row[3] = false;
            row[4] = "化学系";
            row[5] = 1;
            row[6] = "2001-09-01";
            row[7] = "003";
            row[8] = "003003";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 103;
            row[1] = "董婷婷";
            row[2] = 2000;
            row[3] = true;
            row[4] = "化学系";
            row[5] = 0;
            row[6] = "2008-09-01";
            row[7] = "005";
            row[8] = "005010";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 104;
            row[1] = "刘国";
            row[2] = 2002;
            row[3] = false;
            row[4] = "化学系";
            row[5] = 1;
            row[6] = "2002-09-01";
            row[7] = "007";
            row[8] = "007001";
            table.Rows.Add(row);


            row = table.NewRow();
            row[0] = 112;
            row[1] = "张三石";
            row[2] = 2012;
            row[3] = true;
            row[4] = "材料科学与工程系";
            row[5] = 1;
            row[6] = "2000-09-01";
            row[7] = "002";
            row[8] = "002017";
            table.Rows.Add(row);

            return table;
        }

        #endregion

        

       


    }
}
