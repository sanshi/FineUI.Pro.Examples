using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


namespace FineUI.Pro.Examples.usercontrol
{
    public partial class UserInfoControl : System.Web.UI.UserControl
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
            
            labUserInfo.Text = String.Format("{0}今年{1}岁，住在{2}。", UserName, UserAge, UserCountry);


            // 布局相关定义
            if (BoxFlex != null)
            {
                Panel1.BoxFlex = BoxFlex.Value;
            }

            if (!String.IsNullOrEmpty(Margin))
            {
                Panel1.Margin = Margin;
            }
        }


        private int? boxFlex;
        public int? BoxFlex
        {
            get { return boxFlex; }
            set { boxFlex = value; }
        }


        private string margin;
        public string Margin
        {
            get { return margin; }
            set { margin = value; }
        }


        private string userName;
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }


        private int userAge;
        public int UserAge
        {
            get { return userAge; }
            set { userAge = value; }
        }

        private string userCountry;
        public string UserCountry
        {
            get { return userCountry; }
            set { userCountry = value; }
        }
    }
}