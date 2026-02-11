using System;
using System.IO;
using System.Windows.Forms;

namespace AppCadastro
{
    public partial class frmListaCliente: Form
    {
        public frmListaCliente()
        {
            InitializeComponent();
        }

        //Função que retorna o caminho da pasta do cadastros
        string GetDirCadastro(string nomePasta)
        {
            //Extrair o diretorio raiz
            string dirRaiz =
                AppDomain.CurrentDomain.BaseDirectory;

            return
                Path.Combine(dirRaiz, nomePasta);
        }

        //Método para listar os arquivos
        void ListarArquivos(string caminho)
        {
            //Iremos recuperar todos os arquivos .txt do caminho
            //Cada arquivo tera o seu diretorio
            //onde cada diretorio sera uma string
            //portanto teremos um conjunto de strings
            //ou seja, teremos um array de string
            try
            {
                //Iremos recuperar todos os arquivo do diretorio
                string[] arquivos =
                    Directory.GetFiles(caminho, "*.txt");

                //Validar se existe algum cadastro
                if(arquivos.Length == 0)
                {
                    MessageBox.Show(
                        "Nenhum cadastro encontrado.",
                        "Informação",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Information);
                    return; //aborto a rotina
                }

                //Popular a listBox com o array
                lsbCadastros.Items.AddRange(arquivos);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    "Falha ao carregar os cadastros." +
                    Environment.NewLine +
                    "Erro original: " + ex.Message,
                    "Erro",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }
        }

        private void btnPesquisar_Click(object sender, EventArgs e)
        {
            //Lembrando que o tipo do cadastro deve
            //possuir o mesmo nome de pasta usado
            //na tela de cadastros
            //Ou seja em cadastro de cliente foi usado
            //a pasta Clientes, portanto na pesquisa
            //preciso acessar a pasta Clientes
            ListarArquivos(GetDirCadastro("Clientes"));
        }

        //Função que retorna o conteudo do arquivo
        string CarregarArquivo(string arquivo)
        {
            //Variavel do conteudo, iniciada vazia
            string conteudo = "";

            //Tentar carregar o arquivo
            try
            {
                //Carregar o arqvo
                conteudo = File.ReadAllText(arquivo);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    "Falhar ao carregar o cadastro." +
                    Environment.NewLine +
                    "Erro original: " + ex.Message,
                    "Erro",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }

            //Se teve algum problema a variavel nao foi populada
            //retornamos vazio
            //Se deu tudo certo a variavel é retornada
            //como conteudo do arquivo
            return conteudo;
        }

        private void lsbCadastros_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Primeiro precisamos validar se realmente
            //temos um registro selecionado
            if(lsbCadastros.SelectedItem != null)
            {
                string caminho = 
                    lsbCadastros.SelectedItem.ToString();

                txtConteudo.Text =
                    CarregarArquivo(caminho);
            }
        }
    }
}
