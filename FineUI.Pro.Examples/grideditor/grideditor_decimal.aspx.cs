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
    public partial class grideditor_decimal : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 绑定表格
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

        private DataRow CreateNewData(DataTable table, JObject modifiedRow)
        {
            DataRow rowData = table.NewRow();

            // 设置行ID（模拟数据库的自增长列）
            rowData["Id"] = GetNextRowID(GetSourceData());
            UpdateDataRow(modifiedRow, rowData);

            return rowData;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
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
            labResult.Text = String.Format("修改的数据：<pre>{0}</pre>", EncodeJson(Grid1.GetModifiedData()));

            BindGrid();

            ShowNotify("数据保存成功！（表格数据已重新绑定）");
        }

        private void UpdateDataRow(JObject modifiedRow, DataRow rowData)
        {
            Dictionary<string, object> rowDict = modifiedRow.Value<JObject>("values").ToObject<Dictionary<string, object>>();

            // 姓名
            UpdateDataRow("Name", rowDict, rowData);

            // 性别
            UpdateDataRow("Gender", rowDict, rowData);

            // 所学专业
            UpdateDataRow("Major", rowDict, rowData);

            // 语文成绩
            UpdateDataRow("ChineseScore", rowDict, rowData);

            // 数学成绩
            UpdateDataRow("MathScore", rowDict, rowData);
        }

        #endregion

        #region Data

        private static readonly string KEY_FOR_DATASOURCE_SESSION = "datatable_for_grideditor_decimal";

        // 模拟在服务器端保存数据
        // 特别注意：在真实的开发环境中，不要在Session放置大量数据，否则会严重影响服务器性能
        private DataTable GetSourceData()
        {
            if (Session[KEY_FOR_DATASOURCE_SESSION] == null)
            {
                DataTable table = new DataTable();
                table.Columns.Add(new DataColumn("Id", typeof(int)));
                table.Columns.Add(new DataColumn("Name", typeof(String)));
                table.Columns.Add(new DataColumn("EntranceYear", typeof(int)));
                table.Columns.Add(new DataColumn("AtSchool", typeof(bool)));
                table.Columns.Add(new DataColumn("Major", typeof(String)));
                table.Columns.Add(new DataColumn("Group", typeof(int)));
                table.Columns.Add(new DataColumn("Gender", typeof(int)));
                table.Columns.Add(new DataColumn("LogTime", typeof(DateTime)));
                table.Columns.Add(new DataColumn("Desc", typeof(string)));
                table.Columns.Add(new DataColumn("Guid", typeof(Guid)));

                // Hobby：reading,basketball,travel,movie,music
                // 爱好：读书, 篮球, 旅游, 电影, 音乐
                table.Columns.Add(new DataColumn("Hobby", typeof(String)));
                table.Columns.Add(new DataColumn("EntranceDate", typeof(String)));

                // 考试成绩
                table.Columns.Add(new DataColumn("ChineseScore", typeof(float)));
                table.Columns.Add(new DataColumn("MathScore", typeof(float)));
                table.Columns.Add(new DataColumn("TotalScore", typeof(float)));

                DataRow row = table.NewRow();
                row[0] = 101;
                row[1] = "张萍萍";
                row[2] = 2000;
                row[3] = true;
                row[4] = "材料科学与工程系";
                row[5] = 1;
                row[6] = 0;
                row[7] = DateTime.Now.AddDays(-100); // DBNull.Value;
                row[8] = "张萍萍，女，20岁，出生于中国南方的一个小山村，毕业于中国科学技术大学。毕业后就职于某大型国有企业，任部门经理，连续三年获得企业优秀员工称号。张萍萍凭借出色的领导能力和创新思维，带领团队完成了多个重大项目，赢得了同事和上级的一致认可。她积极参与公益活动，回馈家乡，致力于推动乡村教育发展，成为年轻一代的榜样。";
                row[9] = Guid.NewGuid();
                row[10] = "reading,travel,music";
                row[11] = "2000-09-01";
                row[12] = 80;
                row[13] = 90;
                table.Rows.Add(row);

                row = table.NewRow();
                row[0] = 102;
                row[1] = "陈飞";
                row[2] = 2000;
                row[3] = false;
                row[4] = "化学系";
                row[5] = 1;
                row[6] = 1;
                row[7] = DateTime.Now.AddDays(-100);
                row[8] = "陈飞，男，20岁，出生于中国北方的一个小山村，毕业于南方科学技术大学。";
                row[9] = Guid.NewGuid();
                row[10] = "basketball,travel,movie,reading,music";
                row[11] = "2001-09-01";
                row[12] = 85.8;
                row[13] = 90.2;
                table.Rows.Add(row);

                row = table.NewRow();
                row[0] = 103;
                row[1] = "董婷婷";
                row[2] = 2000;
                row[3] = true;
                row[4] = "化学系";
                row[5] = 2;
                row[6] = 0;
                row[7] = DateTime.Now.AddDays(-100);
                row[8] = "董婷婷，女，18岁，出生于中国海南岛的一个小山村，毕业于中国科学技术大学。董婷婷是在学校认识丈夫刘国的，有一天晚上下自习后，董婷婷发短信给刘国说“做我男朋友吧！”，然后他们就走到了一起。";
                row[9] = Guid.NewGuid();
                row[10] = "basketball,movie,music";
                row[11] = "2008-09-01";
                row[12] = 90.5;
                row[13] = 90.5;
                table.Rows.Add(row);

                row = table.NewRow();
                row[0] = 104;
                row[1] = "刘国";
                row[2] = 2002;
                row[3] = false;
                row[4] = "化学系";
                row[5] = 2;
                row[6] = 1;
                row[7] = DateTime.Now.AddDays(-100);
                row[8] = "刘国，男，22岁，出生于中国澳门的一个小山村，毕业于中国科学技术大学。刘国是作为交换生来中科大学习，在校期间认识了妻子董婷婷，虽然是被追到手了，不过在人前却总是说“老婆是我千辛万苦追来的！”。";
                row[9] = Guid.NewGuid();
                row[10] = "reading,basketball,movie";
                row[11] = "2002-09-01";
                // 默认为空
                row[12] = DBNull.Value;
                row[13] = DBNull.Value;
                table.Rows.Add(row);

                row = table.NewRow();
                row[0] = 105;
                row[1] = "康颖颖";
                row[2] = 2008;
                row[3] = true;
                row[4] = "数学系";
                row[5] = 3;
                row[6] = 0;
                row[7] = DateTime.Now.AddDays(-60);
                row[8] = "康颖颖，女，26岁，出生于中国福建的一个小山村，毕业于香港科学技术大学。";
                row[9] = Guid.NewGuid();
                row[10] = "reading,travel,movie,music";
                row[11] = "2008-09-01";
                // 默认为空
                row[12] = DBNull.Value;
                row[13] = DBNull.Value;
                table.Rows.Add(row);

                Session[KEY_FOR_DATASOURCE_SESSION] = table;
            }
            return (DataTable)Session[KEY_FOR_DATASOURCE_SESSION];
        }

        #endregion
    }
}
