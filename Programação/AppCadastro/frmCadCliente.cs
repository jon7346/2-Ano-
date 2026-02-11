using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppCadastro
{
    public partial class frmCadCliente : Form
    {
        public frmCadCliente()
        {
            InitializeComponent();
            //Desativar a validação automatica
            AutoValidate = AutoValidate.Disable;
        }

        private void txtNome_Validating(object sender, CancelEventArgs e)
        {
            //Aqui que vamos definir a validação
            //do campo
            //Validar se o campos esta preenchido
            if (string.IsNullOrEmpty(txtNome.Text))
            {
                //Aqui vamos cancelar a ação da tela
                //Marca q a ação sera cancelada
                //e é a nossa ação
                e.Cancel = true;
                //Defino uma mensagem para o usuario
                errErro.SetError(
                    txtNome,
                    "Preencha o nome.");
            }
            else
            {
                //Se estiver tudo ok
                //precisamos cancelar o cancelamento
                //e remover a mensagem
                e.Cancel = false;
                errErro.SetError(
                    txtNome, "");
            }
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            //Vamos dispara a validação dos campos
            //ValidateChildren scaneia
            //os campos da tela
            //ValidationConstraints identifica os problema
            //Enabled retorna true, qunado estiver tudo ok
            if (ValidateChildren(
                ValidationConstraints.Enabled))
            {
                Salvar();
            }
            else
            {
                //Caso ocorreu algum problema
                //Iremos notificar o usuário
                //e disparar o icones de erro
                MessageBox.Show(
                    "É necessário preencher todos " +
                    "campos corretamente.",
                    "Atenção",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning);
            }
        }

        //Criar a função para retornar
        //somente numeros de uma string
        string SoNumero(string pTexto)
        {
            string retorno = "";

            for (int i = 0; i < pTexto.Length; i++)
                if (char.IsNumber(pTexto[i]))
                    retorno += pTexto[i];
            return retorno;
        }

        private void mskCPF_Validating(object sender, CancelEventArgs e)
        {
            //Removo a mascara do CPF
            string CPF = SoNumero(mskCPF.Text);

            //Agora podemos realizar as 
            //validações
            if (string.IsNullOrEmpty(CPF))
            {
                e.Cancel = true;
                errErro.SetError(
                    mskCPF,
                    "Preencha o CPF.");
            }
            else if (CPF.Length != 11)
            {
                e.Cancel = true;
                errErro.SetError(
                    mskCPF,
                    "Preencha o CPF corretamente.");
            }
            else
            {
                e.Cancel = false;
                errErro.SetError(
                    mskCPF,
                    "");
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            //Apresentar uma mensagem 
            //de SIM ou Não, para o usuario
            //Confirmar o cancelamento
            //Precisamos configurar o MessageBox
            //MessageBoxButtons.YesNo defino q sera
            //uma mensagem de sim ou não
            //Definir o botão padrão q recebera o 
            //foco
            //MessageBoxDefaultButton.Button2
            //defino o botão NÃO como padrão
            //Para coleta o retorno da tela
            //Utilizo o DialogResult
            //Se o usuario clicar em SIM
            //fecho a tela
            if (MessageBox.Show(
                "Deseja realmente descartar " +
                "as alterações?",
                "Confirmação",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question,
                MessageBoxDefaultButton.Button2)
                == DialogResult.Yes)
            {
                Close();
            }
        }

        //Função que valida a existencia do arquivo
        bool ArquivoExiste(string caminho)
        {
            //Iremos validar a exitencia do arquivo
            //lembrando que o nome do arquivo sera o CPF
            //portanto se um arquvio ja existir
            //significa que ja possui um cadastro
            //de cliente com aquele CPF
            //retornamos a existencia do arquivo
            return File.Exists(caminho);
        }

        //Método para gravar o arquivo
        void GravarArquivo(string caminho, string conteudo)
        {
            //Iremos para a rotina de gravação do arquivo
            //Caso for o primeiro cadastro a pasta do cadastro
            //nao deve existir, para isso, precisamos
            //validar se o caminho existe
            //se não existir o criamos

            //OBS: Não usaremos o Try aqui
            //pois a validação ocorrera em outra rotina

            //Criação da pasta se não existir
            string pasta = Path.GetDirectoryName(caminho);
            if (!Directory.Exists(pasta))
            {
                //Criamos a pasta
                Directory.CreateDirectory(pasta);
            }

            //Gravar o conteudo do arquivo
            File.WriteAllText(caminho, conteudo);
        }

        //Função que retorna o caminho do arquivo
        string GetDirArquivo(
            string nomePasta, string nomeArquivo)
        {
            //O caminho será montado:
            //Diretorio Raiz do executavel
            //Nome pasta: o tipo do cadastro Ex: Cliente
            //Nome do Arquivo: CPF do Cliente
            //Ex: C:/Programas/AppCadastros/Clientes/00000000000.txt

            //Recuperar o diretorio RAIZ do executavel
            string dirRaiz =
                AppDomain.CurrentDomain.BaseDirectory;

            //Iremos montar o diretorio final do arquivo
            return
                Path.Combine(
                    dirRaiz, nomePasta, nomeArquivo + ".txt");
        }

        //Função que retornao cadastro em forma de conteudo
        string GetCadastro()
        {
            //Iremos concatenas o conteudo do cadastro
            //em tela, para deixar em formato de
            //conteudo de arquivo
            string cadastro =
                "CPF: " + mskCPF.Text +
                Environment.NewLine +
                "NOME: " + txtNome.Text +
                Environment.NewLine +
                "DATA_NASCIMENTO: " + dtpDataNascimento.Text +
                Environment.NewLine +
                "RG: " + txtRG.Text;

            return cadastro;
        }

        //Método para Salar o Cadastro
        void Salvar()
        {
            //De fato iremos salvar o cadastro dentro
            //do arquivo

            //Recuperar o caminho completo do arquivo
            //Onde iremos definir o tipo do cadastro: Clientes
            //e o nome do arquivo que sera o CPF
            //OBS: o nome do arquivo não pode ter pontuação
            //Precisamos do SoNumero para remover a mascara
            //do CPF
            string caminhoCompleto =
                GetDirArquivo("Clientes", SoNumero(mskCPF.Text));

            //Validar a existencia do arquivo
            if (ArquivoExiste(caminhoCompleto))
            {
                MessageBox.Show(
                    "Já existe um cadatros com este CPF.",
                    "Atenção",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning);
                return; //Aborta a rotina
            }

            //Agora iremos tentar gravar o cadastro no arquivo
            try
            {
                GravarArquivo(caminhoCompleto, GetCadastro());

                //Iremos apresentar o diretorio apenas paara teste interno
                //No prgrama final o usuario não deve sar onde
                //o arquivo foi salvo
                MessageBox.Show(
                    "Registro salvo com sucesso!" +
                    Environment.NewLine +
                    Environment.NewLine +
                    "Salvo em: " + caminhoCompleto,
                    "Informação",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    "Falha ao salvar o cadastro." + Environment.NewLine +
                    "Erro original: " + ex.Message,
                    "Erro",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }
        }
    }
}
