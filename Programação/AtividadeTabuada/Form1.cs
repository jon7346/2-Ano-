using System.Linq;
using System.Windows.Forms;

namespace AtividadeTabuada
{
    public partial class Form1 : Form
    {
        //Aceitar somente numeros inteiros
        //Validar se são maiores q 0 e menor q 100
        //Se não for, exibir uma amensagem
        //para o usuário.
        //Validar o segundo numero é maior que
        //o primeiro
        //Se não for, mensagem para o usuario

        public Form1()
        {
            InitializeComponent();
        }

        //Função que retorna se uma string
        //é somente numero inteiro
        bool IsNumeroInteiro(string pValor)
        {
            //Primeiro validar se o valor
            //nao esta vazio
            if (pValor == "")
                return false;

            //Laço de repetição
            //que passar caracter por carcter
            //verificar se é um numero
            for(int i = 0; i < pValor.Length; i++)
            {
                //Verificar se o caracter atual
                //é um digito
                //Se não for retornamos falso
                if (!char.IsDigit(pValor[i]))
                    return false;

            }

            //Se chegou até aqui
            //significa que o valor informado
            //é somente um numero inteirp
            //podemos retornar true
            return true;
        }

        //Função para validar o intervalo do valor
        bool IsIntervaloValido(int pValor)
        {
            //Validar se o intervalo é valido
            //sendo mario q zero e menor q cem
            //retorno a condição direto
            return (pValor > 0 && pValor < 100);
        }

        //Funação que centraliza as validações de valores
        bool IsCamposValidos(string pInicial, string pFinal)
        {
            //Iremos centralizar todas as validações
            //nesta função

            //Validar se o Inicial é um numero inteiro
            //Só iremos apresentar a mensagem ao usuario
            //se o retorno for false
            //entao usamos a ! para negar 
            if(!IsNumeroInteiro(pInicial))
            {
                MessageBox.Show("Número Inicial inválido.");
                return false;
            }

            if (!IsNumeroInteiro(pFinal))
            {
                MessageBox.Show("Número Final inválido.");
                return false;
            }

            //Após as validaçoes podemos converter
            //a string para inteiro
            int iInicial = int.Parse(txtNumInicial.Text);
            int iFinal = int.Parse(txtNumFinal.Text);

            //Validar o intervalo valido
            if(!IsIntervaloValido(iInicial))
            {
                MessageBox.Show(
                    "Informe um número Inicial "+
                    "maior que 0 e menor que 100");
                return false;
            }

            if (!IsIntervaloValido(iFinal))
            {
                MessageBox.Show(
                    "Informe um número Final " +
                    "maior que 0 e menor que 100");
                return false;
            }

            //Validar se o valor Final é maior
            //que o valor Inicial
            if(iFinal <= iInicial)
            {
                MessageBox.Show(
                    "O número Final deve ser maior " +
                    "que o número Inicial");
                return false;
            }

            //Se chegou até aqui, é por que os valores
            //passaram com sucesso nas validações
            //podemos retornar true;
            return true;
        }

        //Método para calular a tabuada
        void CalcularTabuada(int pInicial, int pFinal)
        {
            //Iniciamos limpando o ListBox
            lstResultado.Items.Clear();

            //Criar laço de repetição que ira passar
            //por cado valor do intervalo
            //Ou seja temos o intervalo de 2 ao 4
            //Então iremos passar pelo
            //2 depois pelo 3 e depois pelo 4
            for(int i = pInicial; i <= pFinal; i++)
            {
                //A cada passada do intervalo iremos
                //calcular a tabuada do intervalo de 1 a 10
                //ou sej se for intervalo 3
                //iremos calcular a tabuada do 3 de 1 a 10
                for(int j = 1;  j <= 10; j++)
                {
                    //Criar um varial resultado
                    //parar armazenar a concatenção 
                    //do calculo
                    //apenas para organizar melhor o codigo
                    string resultado;

                    //Iremos apresentar de forma didatica
                    //o calculo
                    //Ex: 2 x 2 = 4
                    resultado =
                        i.ToString() + " x " +
                        j.ToString() + " = " +
                        (i * j).ToString();

                    //Adicionar a concatenação do calculo
                    //no listBox
                    lstResultado.Items.Add(resultado);
                }

                //Adicionar um linha para separar os intervalos
                lstResultado.Items.Add("-----------");
            }
        }

        private void btnCalcular_Click(object sender, System.EventArgs e)
        {
            //Chamar as validações
            if(!IsCamposValidos(
                txtNumInicial.Text, txtNumFinal.Text))
            {
                //Se tiver alguma invalido
                //paro a execução
                return; //paro a execução
            }

            //Com os validados
            //podemos converter para inteiro
            int iInicial = int.Parse(txtNumInicial.Text);
            int iFinal = int.Parse(txtNumFinal.Text);

            //Agora podemos chamar o método do calcular
            CalcularTabuada(iInicial, iFinal);
        }
    }
}
