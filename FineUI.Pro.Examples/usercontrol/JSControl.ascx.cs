using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.usercontrol
{
    public partial class JSControl : System.Web.UI.UserControl
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
            // 通过JS脚本初始化
            //labUserInfo.Text = String.Format("{0}今年{1}岁，住在{2}。", UserName, UserAge, UserCountry);

            // 布局相关定义
            if (BoxFlex != null)
            {
                Panel1.BoxFlex = BoxFlex.Value;
            }

            if (!String.IsNullOrEmpty(Margin))
            {
                Panel1.Margin = Margin;
            }

            // 多次加载用户控件，但此脚本只会注册一次
            string scriptBlock = String.Format("<script src=\"{0}\" type=\"text/javascript\"></script>", PageContext.ResolveUrl("~/usercontrol/jscontrol.js"));
            PageContext.RegisterPostStartupScript("FineUIPro_Examples_JSControl", scriptBlock, false);

            // 注册初始化脚本
            JObject jo = new JObject();
            jo.Add("userName", UserName);
            jo.Add("userAge", UserAge);
            jo.Add("userCountry", UserCountry);
            PageContext.RegisterStartupScript(String.Format("initControlInfo('{0}',{1});", labUserInfo.ClientID, jo.ToString(Formatting.None)));

            // 按钮的客户端脚本。同一个页面会实例化多份用户控件，处理函数是共用的一份，
            // 所以把「本实例那个标签的客户端 id」挂到按钮的 data-tag 上，函数里再从 this 取回来。
            btnClientScript.AttributeDataTag = labUserInfo.ClientID;
            btnClientScript.ClickHandler = "onClientScriptClick";
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