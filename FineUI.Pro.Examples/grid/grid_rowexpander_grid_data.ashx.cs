using System;
using System.Collections.Generic;
using System.Web;
using Newtonsoft.Json.Linq;


namespace FineUI.Pro.Examples.grid
{
    /// <summary>
    /// grid_rowexpander_grid_data 的摘要说明
    /// </summary>
    public class grid_rowexpander_grid_data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string rowId = context.Request.QueryString["id"];
            int rowIdInt = Convert.ToInt32(rowId);

            JArray ja = new JArray();

            Random rd = new Random();
            for (int i = 0; i < 3; i++)
            {
                JArray jaItem = new JArray();

                if (i == 0)
                {
                    jaItem.Add("入学");
                }
                else if (i == 1)
                {
                    jaItem.Add("期中");
                }
                else if (i == 2)
                {
                    jaItem.Add("期末");
                }

                int randomMinValue = 80;
                int randomMaxValue = 100;
                if (rowIdInt % 2 == 0)
                {
                    randomMinValue = 40;
                    randomMaxValue = 80;
                }
                jaItem.Add(rd.Next(randomMinValue, randomMaxValue));
                jaItem.Add(rd.Next(randomMinValue, randomMaxValue));
                jaItem.Add(rd.Next(randomMinValue, randomMaxValue));
                jaItem.Add(rd.Next(randomMinValue, randomMaxValue));
                jaItem.Add(rd.Next(randomMinValue, randomMaxValue));

                ja.Add(jaItem);
            }

            context.Response.ContentType = "text/plain";
            context.Response.Write(ja.ToString(Newtonsoft.Json.Formatting.None));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}