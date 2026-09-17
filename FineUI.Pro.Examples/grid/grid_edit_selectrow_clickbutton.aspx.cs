using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_edit_selectrow_clickbutton : PageBase
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
            ViewState["UseDataSource1"] = true;

            DataTable table = GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion BindGrid

        #region Events

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataTable table;
            if (Convert.ToBoolean(ViewState["UseDataSource1"]))
            {
                ViewState["UseDataSource1"] = false;
                table = DataSourceUtil.GetDataTable2();
            }
            else
            {
                ViewState["UseDataSource1"] = true;
                table = DataSourceUtil.GetDataTable();
            }

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<table class=\"result\" style=\"width:350px;\"><tr><th>编号</th><th>姓名</th><th>用户输入的分组号</th></tr>");
            for (int i = 0, count = Grid1.Rows.Count; i < count; i++)
            {
                sb.Append("<tr>");
                object[] rowDataKeys = Grid1.DataKeys[i];
                sb.AppendFormat("<td>{0}</td>", rowDataKeys[0]);
                sb.AppendFormat("<td>{0}</td>", rowDataKeys[1]);
                GridRow row = Grid1.Rows[i];
                System.Web.UI.WebControls.TextBox tbxGroupName = (System.Web.UI.WebControls.TextBox)row.FindControl("tbxGroupName");
                sb.AppendFormat("<td>{0}</td>", tbxGroupName.Text);

                sb.Append("</tr>");
            }

            sb.Append("</table>");

            labResult.Text = sb.ToString();
        }

        #endregion Events

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Alert.ShowInParent("保存成功！", "提示", MessageBoxIcon.Information);
            return;
        }

        #region GetDataTable

        /// <summary>
        /// 获取模拟表格
        /// </summary>
        /// <returns></returns>
        public static DataTable GetDataTable()
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
            table.Columns.Add(new DataColumn("ChineseScore", typeof(Int32)));
            table.Columns.Add(new DataColumn("MathScore", typeof(Int32)));
            table.Columns.Add(new DataColumn("TotalScore", typeof(Int32)));

            // 体检结果
            table.Columns.Add(new DataColumn("ShenGao", typeof(Int32)));
            table.Columns.Add(new DataColumn("TiZhong", typeof(Int32)));
            table.Columns.Add(new DataColumn("XueYaDi", typeof(String)));
            table.Columns.Add(new DataColumn("XueYaGao", typeof(String)));
            table.Columns.Add(new DataColumn("ShiLiZuo", typeof(Single)));
            table.Columns.Add(new DataColumn("ShiLiYou", typeof(Single)));
            table.Columns.Add(new DataColumn("ShiLiZuoJiaoZhen", typeof(Single)));
            table.Columns.Add(new DataColumn("ShiLiYouJiaoZhen", typeof(Single)));

            // 合并单元格需要的字段
            table.Columns.Add(new DataColumn("GroupB", typeof(int)));

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
            row[14] = 170;
            row[15] = 180;
            row[16] = 150;
            row[17] = 80;
            row[18] = 120;
            row[19] = 0.2;
            row[20] = 0.5;
            row[21] = 1.0;
            row[22] = 1.2;
            row[23] = 1;
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
            row[12] = 85;
            row[13] = 90;
            row[14] = 175;
            row[15] = 160;
            row[16] = 120;
            row[17] = 70;
            row[18] = 110;
            row[19] = 0.3;
            row[20] = 0.3;
            row[21] = 1.2;
            row[22] = 1.2;
            row[23] = 1;
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
            row[12] = 90;
            row[13] = 90;
            row[14] = 180;
            row[15] = 190;
            row[16] = 130;
            row[17] = 82;
            row[18] = 125;
            row[19] = 0.8;
            row[20] = 0.6;
            row[21] = 1.2;
            row[22] = 1.0;
            row[23] = 2;
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
            row[12] = 95;
            row[13] = 95;
            row[14] = 190;
            row[15] = 170;
            row[16] = 130;
            row[17] = 76;
            row[18] = 112;
            row[19] = 1.0;
            row[20] = 1.0;
            row[21] = 1.0;
            row[22] = 1.0;
            row[23] = 2;
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
            row[12] = 85;
            row[13] = 95;
            row[14] = 180;
            row[15] = 159;
            row[16] = 90;
            row[17] = 77;
            row[18] = 128;
            row[19] = 0.6;
            row[20] = 0.9;
            row[21] = 1.2;
            row[22] = 1.2;
            row[23] = 3;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 106;
            row[1] = "彭博";
            row[2] = 2008;
            row[3] = true;
            row[4] = "数学系";
            row[5] = 3;
            row[6] = 1;
            row[7] = DateTime.Now.AddDays(-50);
            row[8] = "彭博，男，28岁，出生于中国浙江的一个小山村，毕业于电子科学技术大学。";
            row[9] = Guid.NewGuid();
            row[10] = "basketball,travel,music";
            row[11] = "2003-09-01";
            row[12] = 60;
            row[13] = 100;
            row[14] = 160;
            row[15] = 175;
            row[16] = 150;
            row[17] = 88;
            row[18] = 126;
            row[19] = 0.1;
            row[20] = 0.3;
            row[21] = 1.5;
            row[22] = 1.2;
            row[23] = 3;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 107;
            row[1] = "黄婷婷";
            row[2] = 2008;
            row[3] = true;
            row[4] = "数学系";
            row[5] = 3;
            row[6] = 0;
            row[7] = DateTime.Now.AddDays(-50);
            row[8] = "黄婷婷，女，25岁，出生于中国北方的一个小山村，毕业于北京科学技术大学。";
            row[9] = Guid.NewGuid();
            row[10] = "travel,movie,music,reading";
            row[11] = "2000-09-01";
            row[12] = 100;
            row[13] = 80;
            row[14] = 180;
            row[15] = 160;
            row[16] = 80;
            row[17] = 70;
            row[18] = 110;
            row[19] = 0.8;
            row[20] = 0.8;
            row[21] = 1.2;
            row[22] = 1.2;
            row[23] = 3;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 108;
            row[1] = "唐超";
            row[2] = 2004;
            row[3] = false;
            row[4] = "物理系";
            row[5] = 3;
            row[6] = 1;
            row[7] = DateTime.Now.AddDays(-50);
            row[8] = "唐超，男，26岁，出生于中国河南的一个小山村，毕业于中国科学技术大学。作为刘国的同班同学，唐超是班里的尖子生，本科还没毕业就被哈佛大学录取了，现在好像还没毕业呢。";
            row[9] = Guid.NewGuid();
            row[10] = "reading,movie,music,basketball";
            row[11] = "2004-09-01";
            row[12] = 80;
            row[13] = 80;
            row[14] = 160;
            row[15] = 188;
            row[16] = 130;
            row[17] = 82;
            row[18] = 130;
            row[19] = 0.5;
            row[20] = 0.8;
            row[21] = 1.3;
            row[22] = 1.2;
            row[23] = 3;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 109;
            row[1] = "杨婷婷";
            row[2] = 2004;
            row[3] = true;
            row[4] = "物理系";
            row[5] = 5;
            row[6] = 0;
            row[7] = DateTime.Now.AddDays(-50);
            row[8] = "杨婷婷，女，25岁，出生于中国广西的一个小山村，毕业于南方科学技术大学。杨婷婷的父母都是中科大的高材生，他们很高兴送女儿上一所前中科大校长创办的大学，而南科大自己颁发的学位文凭也颇受争议。";
            row[9] = Guid.NewGuid();
            row[10] = "reading,basketball,movie";
            row[11] = "2003-09-01";
            row[12] = 90;
            row[13] = 60;
            row[14] = 150;
            row[15] = 166;
            row[16] = 110;
            row[17] = 70;
            row[18] = 116;
            row[19] = 0.8;
            row[20] = 1.0;
            row[21] = 0.8;
            row[22] = 1.0;
            row[23] = 5;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 110;
            row[1] = "徐鹏";
            row[2] = 2002;
            row[3] = false;
            row[4] = "物理系";
            row[5] = 5;
            row[6] = 1;
            row[7] = DateTime.Now.AddDays(-50);
            row[8] = "徐鹏，男，23岁，出生于中国安徽的一个小山村，毕业于国防科学技术大学。";
            row[9] = Guid.NewGuid();
            row[10] = "reading,basketball,travel";
            row[11] = "2002-09-01";
            row[12] = 60;
            row[13] = 90;
            row[14] = 150;
            row[15] = 198;
            row[16] = 145;
            row[17] = 83;
            row[18] = 128;
            row[19] = 1.2;
            row[20] = 1.5;
            row[21] = 1.2;
            row[22] = 1.5;
            row[23] = 5;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 111;
            row[1] = "董国";
            row[2] = 2020;
            row[3] = true;
            row[4] = "自动化系";
            row[5] = 5;
            row[6] = 1;
            row[7] = DateTime.Now.AddDays(-5);
            row[8] = "董国，男，22岁，出生于中国台湾的一个小山村，毕业于台湾科学技术大学。";
            row[9] = Guid.NewGuid();
            row[10] = "reading,movie,music,basketball";
            row[11] = "2006-09-01";
            row[12] = 90;
            row[13] = 70;
            row[14] = 160;
            row[15] = 158;
            row[16] = 76;
            row[17] = 69;
            row[18] = 109;
            row[19] = 0.8;
            row[20] = 0.6;
            row[21] = 1.2;
            row[22] = 1.2;
            row[23] = 5;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 112;
            row[1] = "张三石";
            row[2] = 2012;
            row[3] = true;
            row[4] = "材料科学与工程系";
            row[5] = 5;
            row[6] = 1;
            row[7] = DateTime.Now.AddDays(-5);
            row[8] = "张三石，男，28岁，出生于中国河南的一个小山村，毕业于中国科学技术大学。";
            row[9] = Guid.NewGuid();
            row[10] = "reading,movie,music";
            row[11] = "2000-09-01";
            row[12] = 99;
            row[13] = 98;
            row[14] = 197;
            row[15] = 183;
            row[16] = 125;
            row[17] = 80;
            row[18] = 120;
            row[19] = 0.8;
            row[20] = 0.6;
            row[21] = 1.2;
            row[22] = 1.2;
            row[23] = 5;
            table.Rows.Add(row);

            return table;
        }

        #endregion GetDataTable
    }
}