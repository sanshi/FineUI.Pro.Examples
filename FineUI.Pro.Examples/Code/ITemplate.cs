using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;

using FineUI.Pro;
using AspNet = System.Web.UI.WebControls;


namespace FineUI.Pro.Examples
{

    #region GenderTemplate ChineseScoreTemplate


    public class GenderTemplate : ITemplate
    {

        public void InstantiateIn(System.Web.UI.Control container)
        {
            AspNet.Label labGender = new AspNet.Label();
            labGender.ID = "GenderItem";
            labGender.DataBinding += new EventHandler(labGender_DataBinding);
            container.Controls.Add(labGender);
        }

        private void labGender_DataBinding(object sender, EventArgs e)
        {
            AspNet.Label labGender = (AspNet.Label)sender;

            IDataItemContainer dataItemContainer = (IDataItemContainer)labGender.NamingContainer;

            int gender = Convert.ToInt32(((DataRowView)dataItemContainer.DataItem)["Gender"]);

            labGender.Text = (gender == 1) ? "男" : "女";
        }
    }


    public class ChineseScoreTemplate : ITemplate
    {
        public void InstantiateIn(System.Web.UI.Control container)
        {
            AspNet.TextBox tbxChineseScore = new AspNet.TextBox();
            tbxChineseScore.ID = "ChineseScoreItem";
            tbxChineseScore.DataBinding += new EventHandler(tbxChineseScore_DataBinding);
            container.Controls.Add(tbxChineseScore);
        }

        private void tbxChineseScore_DataBinding(object sender, EventArgs e)
        {
            AspNet.TextBox tbxChineseScore = (AspNet.TextBox)sender;

            IDataItemContainer dataItemContainer = (IDataItemContainer)tbxChineseScore.NamingContainer;

            int chineseScore = Convert.ToInt32(((DataRowView)dataItemContainer.DataItem)["ChineseScore"]);

            tbxChineseScore.Text = chineseScore.ToString();
        }

    }

    #endregion
}
