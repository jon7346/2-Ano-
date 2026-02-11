using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetoMVC.Models
{ 
    //Classe de objeto Usuario 
    //espelhando a tabela Usuario do banco de dados 
    public class Usuario
    {
        public int UsuarioId { get; set; }
        public string Nome { get; set; }

        public string Email { get; set; } 

        public string Senha { get; set; }
    }

    //Criar uma classe com uma coleção de objetos Usuario 
    // teremos uma coleção de usuarios 
    // ou seja tipo de coleção é de usuario 
    // precisamos herdar da classe List
    public class UsuarioCollection : List<Usuario>
    {

    }
    //Terceiro passoa é criar a classe de conexão com o banco de dados na camada de serviços 


}

