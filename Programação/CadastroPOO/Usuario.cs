using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CadastroPOO
{
    public class Usuario: Pessoa

    {
        public string Email { get; set;  }

        public string Senha { get; set; }

        public string NomeEmail
        {

            get
            {
                return CPFNome + " - " + Email; 
                // Ex: 123456
            }
        }
    }
}
