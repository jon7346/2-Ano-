using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CadastroPOO
{ 
    public class UsuarioExecucao
    {
        //Criar uma lista para armazenar 
        //um conjunto de objetos(Usuarios) 


        // tornar a lista privada  para somente 
        //classe UsuarioExecução ter acesso  
        private List<Usuario> ListaUsuario = new List<Usuario>(); 

       //Método para adicionar um usuário a lista 
       public void Adicionar(Usuario usuario)
        {
            ListaUsuario.Add(usuario); 
        }

        //Método para remover um usuário da lista

        public void Remover(Usuario usuario)
        {
            ListaUsuario.Remove(usuario);
        }
        public List<Usuario> ListarTodos()
        {
            return ListaUsuario;
        }
    }
}
