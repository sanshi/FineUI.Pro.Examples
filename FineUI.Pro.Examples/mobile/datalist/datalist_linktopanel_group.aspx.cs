using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.mobile.datalist
{
    public partial class datalist_linktopanel_group : MobilePageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }


        private void LoadData()
        {
            DataList1.DataGroupField = "Group";
            DataList1.DataSource = DataSourceUtil.GetCountryTable();
            DataList1.DataBind();
        }


        

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;

            string name = row["Name"].ToString();

            e.Item.TextRawHtml = new RawHtml(DATALIST_ITEM_TEMPLATE, 
                PageContext.ResolveUrl("~/res/icon/flag_" + row["Image"] + ".png"), 
                HttpUtility.HtmlEncode(row["Name"]), 
                HttpUtility.HtmlEncode(row["Desc"]));

            e.Item.NavigateUrl = "#";
            e.Item.ShowArrow = true;

        }
 
    }
}
