﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class AccesoDatos
    {
        public SqlDataReader lector { get; set; }
        public SqlConnection conexion { get; }
        public SqlCommand comando { get; set; }


        public AccesoDatos()
        {
            conexion = new SqlConnection("data source = DESKTOP - BDJOUS3\\SQLEXPRESS; initial catalog = CATALOGO_DB; integrated security = sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;
        }
        public void SetQuery(string query)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = query;

        }
        public void AgregarParametro(string nombre ,Object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public void EjecutarLector ()
        {
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void CerrarConexion()
        {
            conexion.Close();
        }
        internal void EjecutarAccion() 
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex ;
            }
                finally
            {
                conexion.Close();
            }
        }
    }

    
}
