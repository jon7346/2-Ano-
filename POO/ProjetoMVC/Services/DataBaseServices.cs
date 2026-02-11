using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoMVC.Services

{
    //Servidor : Host/Ip 
    //Catalogo: nome_banco 
    // Autenticação : Usuario e senha // UsuarioMaquina 
 
    public class DataBaseServices
    {
        //Classe de conexão com o banco de dados 
        //Importar as bibliotecas de banco de dados 
        //Using System.Data
        //Using System.Data.sqlClient
        //Método de conexão com o banco de dados 
       
            //metodo de conexão de com o banco de dados 
            //será privado pois só será usado apenas 
            //dentro da propria classe 

            private SqlConnection GetConnection()
            {
                //Variaavel para armazenar a conexão 
                SqlConnection connection = new SqlConnection();

                //definir a string de conexão 
                //inseiri os dados de conexão com o banco de dados 
                //Usando 
                //Servidor: Host/IP
                //Catalogo : nome do banco de dados 
                //autenticação : Úsuario e Senha ou windows 
                // o caracter especial \ não pode ser usado individualmente, devemos usar como \\
                connection.ConnectionString = "Data Source=JONATHANBOOK4\\MSSQLSERVERO1;" + "Initial Catalog=MVC_Aula;" + "Integrated Security=SSPI;";// Autenticação do windows 
                //Exemplo de autentticação com usuário e senha 
                //"User Id=sa;Password=123456;"

                //abrir a conexão 
                connection.Open();

                //retornamos a conexão aberta
                return connection; 
            }
        
            //Método para exucutar comandos de manupulação de dados 
            // insert, updade, delete 
            //retornando a quantidade de linhas afetadas 
            //programar com poucas linhas = programação funcional 
            public int ExecuteSql(SqlCommand command)
            {
                //Abrir a conexão com banco 
                command.Connection = GetConnection();
                //executar o comando no banco 
                //E retornar as linhas afetadas
                //Rwtornos: 
                // 0 - 0 comando não foi exucutado 
                // 1 - Apenas um registro afetado 
                // n - mais de um registro afetado 
                //n é quantidade de numero e não letra 
                return command.ExecuteNonQuery();


            }
            //Método de consulta para retornar uma tabela de informações 
            public DataTable GetDataTable(SqlCommand command)
            {
                command.Connection = GetConnection();

                //retorna a execução da consulta 

                SqlDataAdapter sqlData = new SqlDataAdapter(command);

                // precisamos converter a informação de 
                //banco de dados em DataTable 
                //Variavel para o DataTable

                DataTable DataTable = new DataTable();

                //preencer o dataTable com o retorno do vanco 
                sqlData.Fill(DataTable);

                return DataTable; 
            }


        }

    }

