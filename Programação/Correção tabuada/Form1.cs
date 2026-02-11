using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Correção_tabuada
{
    public partial class Form1 : Form
    {
        //Aceitar somente numero inteiros 
        //Validar se o numeros são maiores 
        /// que zero e menores que cem 
        /// se não forem, exibir uma messagem 
        /// alertando o usuário 
        /// validar se o segundo numero é meio que o primeiro 
        /// se não for, exibir mensagem ao usuario 
        /// utilizar comando for para exibir 
        /// o resultado no listbox 

        public Form1()
        {
            InitializeComponent();

        }
        bool IsNumeroInteiro(string pvalor)
        {
            //primeiro validar se o valor 
            //não está vazio 

            //tudo que vem antes do ";" funciona dentro do if 
            // os "{}" são usado pra criar blocos executados dentro do if 
            if (pvalor == "")
                return false; //encerro a função


            //Criar i laço de repetição 
            ///para validar os carateres 
            ///da string, passando 
            ///caracter por carater
            for (int i = 0; i < pvalor.Length; i++)
            {
                //verifica o numero e se tiver uma  letra ele retorna false e cancela o código 
                //'!' é negação 
                if (!char.IsDigit(pvalor[1]))
                    return true;
            }
            return true;
        }
            bool IsIntervalovalido(int valor)
            {
                //Estou retornando o resultado 
                //direto na condição 
                //validar o intervalo 
                //$$ significa o E da tabela verdade 
                //|| significo  o OU da tabela verdader 
                return (valor > 0 && valor < 100);

            }
            bool IsCamposValidos(string valorIInicial, string valorFinal)
            {
                // validar se o campo Inicial 
                //é somente numero inteiro 
                //Usamos a negação ! pois iremos 
                /// apresentar apenas a mensage 
                /// se o valor for invalido 
                if (!IsNumeroInteiro(valorIInicial))
                {
                    MessageBox.Show("informe um número inicial válido.");
                    return false; //encerro a função 
                }
                if (!IsNumeroInteiro(valorFinal))
                {
                    MessageBox.Show("informe um número final válido.");
                    return false; //encerro a função 
                }
                ///nesse momento temos a certeza,
                ///que os valores Inicial e Final são 
                ///numeros inteiros 
                ///então podemos converter a string para int 
                int iInicial = int.Parse(valorIInicial);
                int iFinal = int.Parse(valorFinal);
                ///verificação  do numero inicial 
                ///envio da messadem de erro 
                ///retorno do bool false 
                if (!IsIntervalovalido(iInicial))
                {
                    MessageBox.Show(
                        "Informe um número " +
                        "Inicial maior que 0(zero) " +
                        "e menor que cem(100)."
                        );
                    return false;
                }
                /// verficação do numero final 
                /// criação de messagem e retorno do bool 
                if (!IsIntervalovalido(iFinal))
                {
                    MessageBox.Show(
                        "Informe um número " +
                        "final maior que 0(zero) " +
                        "e menor que cem(100)."
                        );
                    return false;
                }
                //verificação 
                if (iFinal <= iInicial)
                {
                    MessageBox.Show(

                       "Informe um número Final " +
                       "maior que o número Inicial.");
                    return false;

                }
                return true;

            }
            // metedo para calcular a tabuada 
            void Calculartabuada(int valorInicial, int valorFinal)
            {
                //primeiro limpamos o listBox 
                listResultado.Items.Clear();

                ///Criar um laço de repetiçao 
                ///que iria passar por cada valor 
                ///do intervalo 
                ///Ou seja temos intervalo de 2 ao 4 
                ///entao iremos passar pelo 2 depois 
                ///pelo 3 e depois pelo 4 
                for (int i = valorFinal; i <= valorFinal; i++)
                {
                    // a cada passsada do intervalo 
                    ///iremos calcular a tavuada do valor 
                    ///de 1 a 10 
                    ///ou seja de for o intervalo 3 
                    ///Iremos calcular a tabuada do 3
                    ///do 1 ao 10 
                    for (int j = 1; j <= 10; j++)
                    {
                        //Criar uma variavel para armazenar 
                        //o resultado do calculo atual 
                        string resultado;
                        resultado =
                           i.ToString() + "x" +
                           j.ToString() + "=" +
                           (i * j).ToString();

                        //adicionar o resultado ao listBox
                        listResultado.Items.Add(resultado);
                    }
                    //A CADA inteha rvalo sera adicionado 
                    //uma linha para separação
                    listResultado.Items.Add("-------------");
                }


            }
        
        private void btnCalcular_Click(object sender, EventArgs e)
        {
            ///validar se o valor inserido 
            ///é valido 
            ///usaremos negação pos se tiver 
            ///invalido encerramos a execução
            if (Is)
            {
                int iinicial = int.Parse(textBox1.Text);
                int ifinal = int.Parse(textBox2.Text);
            }
        }
    }
}

