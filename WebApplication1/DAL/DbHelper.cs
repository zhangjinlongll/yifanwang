using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace DAL
{
    public class DbHelper
    {
        public static string connString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        /// <summary>
        /// 获取数据 返回DataSet
        /// </summary>
        /// <param name="cmdText"></param>
        /// <param name="cmdParams"></param>
        /// <returns></returns>
        public static  DataSet ExecuteDataTable(string cmdText, SqlParameter[] cmdParams)
        {
            using (SqlConnection sqlConn = new SqlConnection(connString))
            {
                try
                {
                    DataSet dataTable = new DataSet();
                    SqlDataAdapter sda = new SqlDataAdapter(cmdText, sqlConn);
                    if (cmdParams != null)
                    {
                        foreach (SqlParameter param in cmdParams)
                        sda.SelectCommand.Parameters.Add(param);
                    }
                        sda.SelectCommand.CommandType = CommandType.Text;
                        sda.Fill(dataTable);
                        sda.SelectCommand.Parameters.Clear();
                        return dataTable;
                }
                finally
                {
                    CloseConn(sqlConn);
                }
            }
        }

        /// <summary>
        /// 新增、修改、删除 返回所属的行数
        /// </summary>
        /// <param name="cmdText">文本字符串</param>
        /// <param name="cmdParms">字符</param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string cmdText, SqlParameter[] cmdParms)
        {
            using (SqlConnection sqlConn = new SqlConnection(connString))
                try
                {

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        PrepareCommand(cmd, sqlConn, null, cmdText, cmdParms);
                        int val = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();

                        return val;
                    }

                }
                finally
                {
                    CloseConn(sqlConn);//关闭连接实例
                }
        }

        /// <summary>
        /// 准备执行前的准备
        /// </summary>
        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] cmdParms)
        {

            if (conn.State != ConnectionState.Open)
                conn.Open();//打开连接

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;//运用事务
            cmd.CommandType = CommandType.Text;
            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }

        /// <summary>
        /// 关闭连接
        /// </summary>
        private static void CloseConn(SqlConnection conn)
        {
            if (conn.State != ConnectionState.Closed)
                conn.Close();//关闭连接
            conn.Dispose();
        }

    }

}
