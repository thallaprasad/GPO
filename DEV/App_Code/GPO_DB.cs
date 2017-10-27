using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Collections.Generic;

/// <summary>
/// Summary description for ADO_DB
/// </summary>
public class GPO_DB
{
    public SqlConnection gpoConn = new SqlConnection(ConfigurationManager.ConnectionStrings["gpoConStr"].ConnectionString);
    public SqlCommand gpoCommand;
    public SqlDataAdapter gpoAdapter;
    public SqlDataReader gpoDataReader;
    public DataTable gpoDataTable;
    public DataSet gpoDataset;
    public DataRow gpoDataRow;
    public SqlTransaction gpoTransaction;

    public GPO_DB()
    {

    }


    //public SqlConnection ConString()
    //{

    //    try
    //    {
    //        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["gpoConStr"].ConnectionString);
    //        return sqlCon;

    //    }
    //    catch
    //    {
    //        throw;
    //    }
    //}

    public SqlConnection OpenConnection()
    {
        try
        {
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }
            gpoConn.Open();
            return gpoConn;
        }

        catch
        {
            throw;
        }
    }

    public void CloseConnection()
    {
        try
        {
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }
        }
        catch
        {
            throw;
        }
    }

    public int ExecuteNonQuery(string strProc, Hashtable htInputValue)
    {
        if (gpoConn.State == ConnectionState.Closed)
        {
            gpoConn.Open();
        }

        try
        {

            gpoCommand = new SqlCommand(strProc, gpoConn);
            gpoCommand.CommandTimeout = 250;
            gpoCommand.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry entry in htInputValue)
            {
                gpoCommand.Parameters.Add(new SqlParameter(entry.Key.ToString(), entry.Value.ToString()));
            }
            return (gpoCommand.ExecuteNonQuery());
            gpoConn.Close();

        }
        catch
        {
            if (gpoConn != null)
                SqlConnection.ClearPool(gpoConn);
            throw;
        }
    }
    public DataSet DataInDataset(string strProc, Hashtable htInputValue)
    {
        gpoDataset = new DataSet();
        gpoCommand = new SqlCommand();
        try
        {
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }

            gpoCommand = new SqlCommand(strProc, gpoConn);
            gpoCommand.CommandTimeout = 250;
            gpoCommand.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry entry in htInputValue)
            {
                gpoCommand.Parameters.Add(new SqlParameter(entry.Key.ToString(), entry.Value.ToString()));
            }

            gpoAdapter = new SqlDataAdapter(gpoCommand);
            gpoAdapter.Fill(gpoDataset);

        }
        catch
        {
            throw;
        }
        finally
        {
            gpoCommand.Dispose();
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }

        }
        return gpoDataset;
    }
    public DataTable DataInDataTable(string strProc, Hashtable htInputValue)
    {
        gpoDataTable = new DataTable();
        gpoCommand = new SqlCommand();
        try
        {
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }
            gpoConn.Open();
            gpoCommand = new SqlCommand(strProc, gpoConn);
            gpoCommand.CommandTimeout = 250;
            gpoCommand.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry entry in htInputValue)
            {
                gpoCommand.Parameters.Add(new SqlParameter(entry.Key.ToString(), entry.Value.ToString()));
            }

            gpoDataReader = gpoCommand.ExecuteReader(CommandBehavior.CloseConnection);
            gpoDataTable.Load(gpoDataReader);


        }
        catch
        {
            throw;
        }
        finally
        {
            gpoCommand.Dispose();
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }

        }
        return gpoDataTable;
    }

    public DataSet DataInDataset(string strProc)
    {
        gpoDataset = new DataSet();
        gpoCommand = new SqlCommand();
        try
        {
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }

            gpoCommand = new SqlCommand(strProc, gpoConn);
            gpoCommand.CommandTimeout = 250;
            gpoCommand.CommandType = CommandType.StoredProcedure;

            gpoAdapter = new SqlDataAdapter(gpoCommand);
            gpoAdapter.Fill(gpoDataset);

        }
        catch
        {
            throw;
        }
        finally
        {
            gpoCommand.Dispose();
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }

        }
        return gpoDataset;
    }
    public DataTable DataInDataTable(string strProc)
    {
        gpoDataTable = new DataTable();
        gpoCommand = new SqlCommand();
        try
        {
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }
            gpoConn.Open();
            gpoCommand = new SqlCommand(strProc, gpoConn);
            gpoCommand.CommandTimeout = 250;
            gpoCommand.CommandType = CommandType.StoredProcedure;
            gpoDataReader = gpoCommand.ExecuteReader(CommandBehavior.CloseConnection);
            gpoDataTable.Load(gpoDataReader);


        }
        catch
        {
            throw;
        }
        finally
        {
            gpoCommand.Dispose();
            if (gpoConn.State == ConnectionState.Open)
            {
                gpoConn.Close();
            }

        }
        return gpoDataTable;
    }

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);

    }
    protected virtual void Dispose(bool disposing)
    {
        if (disposing)
        {
            gpoConn.Dispose();
            if (gpoCommand != null)
            {
                gpoCommand.Dispose();
            }
            if (gpoAdapter != null)
            {
                gpoAdapter.Dispose();
            }
            if (gpoDataReader != null)
            {
                gpoDataReader.Dispose();
            }
            if (gpoDataTable != null)
            {
                gpoDataTable.Dispose();
            }

            if (gpoDataset != null)
            {
                gpoDataset.Dispose();
            }



        }

    }


}