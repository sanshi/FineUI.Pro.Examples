using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.gridrowheight
{
    public partial class grid_100_lockcolumn : PageBase
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
            DataTable table = DataSourceUtil.GetDataTable();

            int newtableID = 101;
            DataTable newtable = table.Clone();
            for (int i = 0; i <= 8; i++)
            {
                foreach (DataRow row in table.Rows)
                {
                    newtable.ImportRow(row);

                    var newImportedRow = newtable.Rows[newtable.Rows.Count - 1];
                    newImportedRow["Id"] = newtableID;
                    if (i > 0)
                    {
                        newImportedRow["Name"] = String.Format("{0}（{1}）", newImportedRow["Name"], i);
                    }

                    newtableID++;
                }
            }

            Grid1.DataSource = newtable;
            Grid1.DataBind();

        }

        protected string GetHobby(object hobbyObj)
        {
            List<string> hobbyList = new List<string>();
            // Hobby：reading,basketball,travel,movie,music
            // 爱好：读书, 篮球, 旅游, 电影, 音乐 
            string[] hobbies = hobbyObj.ToString().ToLower().Split(',');

            foreach (string hobby in hobbies)
            {
                if (hobby == "reading")
                {
                    hobbyList.Add("读书");
                }
                else if (hobby == "basketball")
                {
                    hobbyList.Add("篮球");
                }
                else if (hobby == "travel")
                {
                    hobbyList.Add("旅游");
                }
                else if (hobby == "movie")
                {
                    hobbyList.Add("电影");
                }
                else if (hobby == "music")
                {
                    hobbyList.Add("音乐");
                }
            }

            return String.Join(", ",  hobbyList.ToArray());
        }

        #endregion



    }
}
