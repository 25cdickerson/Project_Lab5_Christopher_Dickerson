using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Project_Lab5_Christopher_Dickerson
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Click += new EventHandler(this.Click);
        }

        protected void Click(object sender, EventArgs e)
        {
            if (RequiredFieldValidator1.IsValid)
            {
                
                GridView2.Visible = true;
                Label2.Visible = true;
                //string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Lab5.mdf;Integrated Security=True";
                //using (SqlConnection connection = new SqlConnection())
                //{
                //    connection.ConnectionString = connectionString;

                //    connection.Open();

                //    string checkInt = "select * from Inventory where UnitsInStock<=" + int.Parse(TextBox1.Text);
                //    SqlCommand cmd = new SqlCommand(checkInt, connection);

                //    SqlDataReader reader = cmd.ExecuteReader();

                //    GridView2.DataSource = reader;
                //    GridView2.DataBind();


                //    connection.Close();
                //}

            }
        }
    }
}