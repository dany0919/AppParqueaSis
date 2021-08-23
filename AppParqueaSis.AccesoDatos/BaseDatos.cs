using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppParqueaSis.AccesoDatos
{
    public class BaseDatos
    {
        private static string cadenaConexion = "Data Source=DANNY-PC\\SQLEXPRESS;Initial Catalog=PARQUEASIS; User ID=usr_parqueasis;Password=usr_parqueasis;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public static int EjecutarNoQuery(string procedimiento, SqlParameter[] sqlParameters)
        {
            int resultado;
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadenaConexion))
                {
                    conexion.Open();

                    SqlCommand sqlComando = new SqlCommand();
                    sqlComando.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlComando.CommandText = procedimiento;
                    sqlComando.Connection = conexion;
                    sqlComando.Parameters.AddRange(sqlParameters);

                    resultado = sqlComando.ExecuteNonQuery();

                    conexion.Close();
                }
            }
            catch(SqlException sqlEx)
            {
                //Guardar la excepcion en un log
                resultado = -1;
            }

            return resultado;
        }

        public static DataSet EjecutarConsulta(string procedimiento, SqlParameter[] sqlParameters)
        {
            DataSet dataSet = new DataSet();
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadenaConexion))
                {
                    conexion.Open();

                    SqlCommand sqlComando = new SqlCommand();
                    sqlComando.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlComando.CommandText = procedimiento;
                    sqlComando.Connection = conexion;
                    sqlComando.Parameters.AddRange(sqlParameters);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlComando);
                    
                    dataAdapter.Fill(dataSet);

                    conexion.Close();
                }
            }
            catch (SqlException sqlEx)
            {
                //Guardar la excepcion en un log
                
            }

            return dataSet;
        }
    }
}
