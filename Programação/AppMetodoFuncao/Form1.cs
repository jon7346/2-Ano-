using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppMetodoFuncao
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnIF_Click(object sender, EventArgs e)
        {
            //Ao clicar no botão, iremos apresentar
            //a opção numerica que o usuario
            //selecionou

            string opcao;

            //Fazer a cascata de IF
            //utilizado quando podemos ter condições
            //diferentes

            //O combobox é nada mais doque um Array
            //começando posição 0
            //Ou seja cada item possui um Index = Id da posição

            //Estou pegando o Indice Selecionado do Array
            if (cbbOpcoes.SelectedIndex == 0)
                opcao = "Opção 1 Selecionada.";
            else if (cbbOpcoes.SelectedIndex == 1)
                opcao = "Opção 2 Selecionada.";
            else if (cbbOpcoes.SelectedIndex == 2)
                opcao = "Opção 3 Selecionada.";
            else if (cbbOpcoes.SelectedIndex == 3)
                opcao = "Opção 4 Selecionada.";
            else
                opcao = "Nenhuma opção selecionada";
            //Exibir o texto para o usuario
            MessageBox.Show(opcao);
        }

        private void btnSwitch_Click(object sender, EventArgs e)
        {
            //seguir o principio do botao IF

            //Switch é utilizado qunado possui
            //variação fixa
            //ou seja tenho uma varição de um tipo de dados

            string opcao;

            switch(cbbOpcoes.SelectedIndex)
            {
                case 0: opcao = "Opção 1 Selecionada";
                    break;
                case 1: opcao = "Opção 2 Selecionada";
                    break;
                case 2: opcao = "Opção 3 Selecionada";
                    break;
                case 3: opcao = "Opção 4 Selecionada";
                    break;
                default: opcao = "Nenuma Opção Selecionada";
                    break;
            }

            MessageBox.Show(opcao);
        }

        private void btnMetodo_Click(object sender, EventArgs e)
        {
            //Chamo o método pelo nome
            MetodoSomar();
        }

        //Como criar metodo
        //Definir o tipo de retorno
        //Metódo não possui retorno portanto
        //sera do tipo VOID
        //VOID = sem retorno

        //Void = Tipo
        //MetodoSomear = Nome do metodo
        void MetodoSomar()
        {
            //Um método vai executar um bloco de
            //código

            //Vamos definir as variaveis
            int v1, v2, resultado;

            //Atribuir o valor da campo em 
            //em cada variavel valor

            //Converter o texto em inteiro
            //definir o tipo de dado final
            //e chamar a conversão
            v1 = int.Parse(txtValor1.Text);
            v2 = int.Parse(txtValor2.Text);

            resultado = v1 + v2;

            MessageBox.Show("Resultado: " + 
                            resultado.ToString());
        }

        private void btnFuncao_Click(object sender, EventArgs e)
        {
            //Variaveis q recebera o valor digitado
            //pelo usuario
            int valor1, valor2;

            //Converter o texto digitado
            //em valor inteiro ou seja do tipo int
            valor1 = int.Parse(txtValor1.Text);
            valor2 = int.Parse(txtValor2.Text);

            //Chamar a função para manipular
            //as variaveis
            int resultado;
            resultado = FuncaoSomar(valor1, valor2);
            MessageBox.Show(
                "A soma é: " + resultado.ToString());

            //Alternativa para apresentar o resultado
            MessageBox.Show(
                "A soma é: " + FuncaoSomar(valor1,valor2).ToString());

        }

        //Criar um função que ira receber 
        // 2  valores via parametro
        //ira somar os valores e retornar o resultado
        //da soma

        //Exemplo:
        //Método
        //void MetodoSomar()
        //Função
        //int FuncaoSomar()
        int FuncaoSomar(int v1, int v2)
        {
            //Criar retorno da função
            //Utilizar a palavra reservada
            //return e o valor a ser retornado
            return v1 + v2;
        }

        private void btnLimpar_Click(object sender, EventArgs e)
        {
            //Vamos limpar o conteudo
            //do listBox

            //lstItens é o componente
            //Itens é o array de conteudo
            //Clear() é o metodo limpar
            lstItens.Items.Clear();
        }

        private void btnFOR_Click(object sender, EventArgs e)
        {
            //Criar um laço de repetição
            //para popular o listbox
            for(int i = 0; i <= 10; i++)
            {
                //a cada laço, vou adicionar
                //o i (ou seja o valor de i) 
                //no listbox
                lstItens.Items.Add(i.ToString());
            }
            
        }

        private void btnWHILE_Click(object sender, EventArgs e)
        {
            //Laço de repetição com While
            int i = 0;

            while(i <= 10)
            {
                //Realização a ação de adicionar
                //o valor na listBox
                lstItens.Items.Add(i.ToString());
                //nescessario fazer o incremento
                //na variavel da condição
                i++;
            }
        }

        private void btnDoWHILE_Click(object sender, EventArgs e)
        {
            //Laço de repetição DO WHILE
            //Garante q será executado 
            //pelo menos uma vez

            int i = 0;

            do
            {
                lstItens.Items.Add(i.ToString());
                i++;
            }
            while(i <= 10);
        }

        private void btnSoNumero_Click(object sender, EventArgs e)
        {
            //Pegar o conteudo do campos txtInfo
            //extrair somente o numeros
            //exibir esses numeros na label
            lblResultado.Text = 
                SoNumero(txtInfo.Text).ToString();
        }

        //Função quer retorna somente
        //o numeros de um texto
        int SoNumero(string Texto)
        {
            //Variavel para coletar os numeros
            string resultado = "";

            //Laço de repetição 
            for(int i = 0; i < Texto.Length; i++)
            {
                //Validação se o caracter atual
                //é um numero
                //Ex TEXTO = "A1B2"
                //[0] = A
                //[1] = 1
                //[2] = B
                //[3] = 2
                if (char.IsDigit(Texto[i]))
                    resultado += Texto[i];
            }

            //retorno o resultado
            //valido se a varial resultado
            //esta preenchida
            if (string.IsNullOrEmpty(resultado))
                return 0;
            else
                return int.Parse(resultado);
        }
    }
}
