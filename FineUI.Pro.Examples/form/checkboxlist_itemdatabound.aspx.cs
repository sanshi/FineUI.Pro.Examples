using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace FineUI.Pro.Examples.form
{
    public partial class checkboxlist_itemdatabound : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 手工设置复选框列表项的提示信息
                CheckBoxList1.Items[0].Attributes["data-qtip"] = "这是第一个选项的提示信息";
                CheckBoxList1.Items[1].Attributes["data-qtip"] = "这是第二个选项的提示信息";
                CheckBoxList1.Items[2].Attributes["data-qtip"] = "这是第三个选项的提示信息";

                BindCheckBoxList2();
            }
        }


        #region BindCheckBoxList

        public class TestClass
        {
            private string _id;

            public string Id
            {
                get { return _id; }
                set { _id = value; }
            }
            private string _name;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }

            public TestClass(string id, string name)
            {
                _id = id;
                _name = name;
            }

        }

        private void BindCheckBoxList2()
        {
            List<TestClass> myList = new List<TestClass>();
            myList.Add(new TestClass("item1", "数据绑定值 1"));
            myList.Add(new TestClass("item2", "数据绑定值 2"));
            myList.Add(new TestClass("item3", "数据绑定值 3"));
            myList.Add(new TestClass("item4", "数据绑定值 4"));

            CheckBoxList2.DataTextField = "Name";
            CheckBoxList2.DataValueField = "Id";
            CheckBoxList2.DataSource = myList;
            CheckBoxList2.DataBind();

            CheckBoxList2.SelectedValueArray = new string[] { "item1", "item3" };
        }
        #endregion

        #region Events


        /// <summary>
        /// 复选框列表项数据绑定时触发
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CheckBoxList2_ItemDataBound(object sender, CheckItemEventArgs e)
        {
            TestClass dataItem = e.DataItem as TestClass;

            e.Item.Attributes["data-qtip"] = String.Format("{0}（值：{1}）", dataItem.Name, dataItem.Id);
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShowNotify("列表一：" + String.Join(", ", CheckBoxList1.SelectedValueArray) + " 列表二：" + String.Join(", ", CheckBoxList2.SelectedValueArray));
        }



        #endregion

        
    }
}
