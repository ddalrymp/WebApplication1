using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

namespace WebApplication1
{
    public class IISHandler1 : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the Web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            String authHeader = context.Request.Headers.Get("Authorization");
            if (authHeader == null)
            {
                // ask for credentials ( basic auth )
                context.Response.StatusCode = 401;
                context.Response.Headers.Add("WWW-Authenticate", "Basic");
            } else
            {
                // Authorization: Bearer is *not* stored on the browser client
                // debating the usefullness of a Bearer token being returned - or any token.
                context.Response.Headers.Add("Authorization", "Bearer FooBar");
                //write your handler implementation here.
                context.Response.ContentType = "text/plain";
                context.Response.Write("HelloWorld - Change 02\n");
                context.Response.Write("Authorization: " + authHeader + "\n");
                context.Response.Write("AppStartTime: " + context.Application["AppStartTime"]);

                try
                {
                    String connStr = WebConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connStr);
                    conn.Open();
                    context.Response.Write("\nConnected to " + connStr + "");
                    SqlCommand cmd = new SqlCommand();
                    SqlDataReader reader;

                    cmd.CommandText = "SELECT Id FROM MyFirstTable";
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;

                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        context.Response.Write("\n Id = " + reader.GetInt32(0));
                    }
                    conn.Close();
                    context.Response.Write("\nClosed Connection");
                }
                catch (Exception ex)
                {
                    context.Response.Write("\nException: " + ex.ToString());
                }

            }
        }

        #endregion
    }
}
