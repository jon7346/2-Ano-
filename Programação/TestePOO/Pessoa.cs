using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestePOO
{
    public class Pessoa
    {
        // atributo 
        // dividido em 4 partes  
        // nivel de acesso 
        // tipo de dado 
        // nome do atributo
        // Manipulação (Get, Set)
        // get = leitura  const no javascript 
        // set = gravação let no javascript 
        public string Nome { get; set; }


        //cria automático 
        //prop 
        public string CPF { get; set; }

        public DateTime DtNascimento{ get; set; }

        ///Adicionar um atributo somente leitura 
        ///para exibir o cpf e o Nome Concatenado 
        
        public string CPFNome
        {
            get
            {
                return CPF + " - " + Nome;
            }
        }
    }
}
