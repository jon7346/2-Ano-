using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestePOO
{
         
        ///para realizar a herança utilizamos o sinal de dois pontos(:)
        ///e o nome da classe que herdaremos 
        ///uma classe pode possuir apenas 
        ///uma herança
        public class Aluno : Pessoa
        {
          public string RA { get; set; }
          public bool Matricula { get; set; }

          public Diciplina Disciplina { get; set; }
        }
    
}
