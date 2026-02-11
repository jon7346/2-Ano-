using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CadastroPOO
{
    public class Pessoa
    {
        public string Nome { get; set; }
        public string CPF { get; set; }
        public DateTime DtNascimento { get; set; }

        //Propriedades somente leitura 
        //Enclapisulamento 
        public string CPFNome
        {
            get
            {
                return CPF + " - " + Nome.ToUpper(); 
                // Ex: 12345678901 - LUCAS 
            }
        }

         //propriedade que retorna a idade 
         //calculada ccom base na Dtnascimento 

        public int Idade
        {
            get
            {
                // para descobrir a idade 
                // realizamos a conta 
                // data atual - datta nascimento 
                // Iremos usar o comando Now 
                // para recuperar a data 
                // atual do computador 
                // Porém iremos calcular com basee no dia 
                // para maior prescisão 
                DateTime dataAtual = DateTime.Now;

                int idade = dataAtual.Year - DtNascimento.Year;

                //Olhar com base na data 
                // se mes maior que o mes de nascim
                if (dataAtual.Month < DtNascimento.Month ||
                    (dataAtual.Month == DtNascimento.Month &&
                    dataAtual.Day < dataAtual.Day))
                {

                    idade--;


                }
                return idade;

            }
        }

    }
}
