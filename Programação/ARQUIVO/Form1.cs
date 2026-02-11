using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ARQUIVO
{
    public partial class Form1 : Form

    {
        bool ValidarDiretorio(string Diretorio, string nomeArquivo)
        {
            if (string.IsNullOrWhiteSpace(Diretorio) || string.IsNullOrWhiteSpace(nomeArquivo))
            {
                MessageBox.Show(
                "informe o diretório e o nome do arquivo" +
                "corretamente ",
                "Atenção",
                MessageBoxButtons.OK,
                MessageBoxIcon.Warning);
                return false;

            }
            if (!Directory.Exists(Diretorio))
            {
                MessageBox.Show("O diretório informa não existe",
                "atenção",
                MessageBoxButtons.OK,
                MessageBoxIcon.Warning);
                return false;



            }
            return true;
        }
        string GetDiretorioCompleto()
        {
            return
                Path.Combine(
                txtCaminho.Text,
                nomeArquivo.Text +
                ".txt"
                );

        }
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSelecionar_Click(object sender, EventArgs e)
        {
            DialogResult result = folderBrowserDialog1.ShowDialog();

            if (result == DialogResult.OK && !string.IsNullOrWhiteSpace(folderBrowserDialog1.SelectedPath))
            {
                txtCaminho.Text = folderBrowserDialog1.SelectedPath;


            }

        }

        private void btnCriar_Click(object sender, EventArgs e)
        {
            if (!ValidarDiretorio(txtCaminho.Text, nomeArquivo.Text))
            {
                return;


            }
            string CaminhoCompleto = GetDiretorioCompleto();
            try
            {
                if (File.Exists(CaminhoCompleto))
                {
                    MessageBox.Show(
                    "O arquivo já existe.",
                    "Atenção",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning);

                    return;
                }
                File.WriteAllText(CaminhoCompleto, "");
                MessageBox.Show("Arquivo criado com Sucesso", "informações",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                //Caso ocorra uma falha notificaremos
                MessageBox.Show(
                    "Ocorreu uma falha ao criar o arquivo." +
                    Environment.NewLine + //quebra de linha
                    "Erro original" + ex.Message,
                    "Erro",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);
            }


        }

        private void btnGravar_Click(object sender, EventArgs e)
        {
            if (!ValidarDiretorio(txtCaminho.Text, nomeArquivo.Text)){
                return;
            }
            try
            {
                File.WriteAllText(
               GetDiretorioCompleto(),
               txtTexto.Text);
            }
            catch(Exception ex) {
                MessageBox.Show(
                "Ocorreu uma falha ao gravar os dados no arquivo " + Environment.NewLine + "Erro original: " + 
                ex.Message,
                "Erro",
                MessageBoxButtons.OK,
                MessageBoxIcon.Error);

            } 
        }

        private void btnAdicionar_Click(object sender, EventArgs e)
        {
            if(!ValidarDiretorio(txtCaminho.Text, nomeArquivo.Text))
            { return;  }
            try
            {
                // iremos adicioanr o conteudo do campo texto ao arquivo 
                //Diferente da rotina de gravação 
                // aquie iremos adicionar o conteudo 
                // ao que ja existe no arquivo
                //Dica: o conteudo é inserido em sequência 
                // Necessário inserir um novo conteudo

                File.AppendAllText(
                    GetDiretorioCompleto(), txtTexto.Text +
                    Environment.NewLine);
                //notificamos o usuário 
                MessageBox.Show(
                    "Dados Adicionados co sucesso", 
                    "informação", 
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);

            }
            catch (Exception ex) 
            {
                MessageBox.Show(
                    "Ocorreu um falha ao adicioanr os ddados no arquivo" +
                    Environment.NewLine +
                    "Erro Original" + ex.Message,
                    "Erro",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error
                    );
            }
        }

        private void btnCarregar_Click(object sender, EventArgs e)
        {
            if (!ValidarDiretorio(txtCaminho.Text, nomeArquivo.Text))
            {
                return;
            }
            try {
                //validar se o aquivo existe 
                if (File.Exists(GetDiretorioCompleto()))
                {
                    //Caso o arquivo existe iemos carregar o conteudo do arquivo e apresentar no campo txArquivo 

                    txtCarregar.Text =
                        File.ReadAllText(
                            GetDiretorioCompleto());

                    MessageBox.Show(
                        "Arquivo carregado com sucesso ",
                        "informação",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Information
                       
                        );
                
                }
                else
                {
                    MessageBox.Show(
                        "O arquivo não existe",
                        "Atenção",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Warning);

                }
                ;
            }
            
            catch (Exception ex) {
                MessageBox.Show(
                    "Ocorreu uma falha ao carregar" +
                    "o arquivo" +
                    Environment.NewLine +
                    "Erro Original: " + ex.Message,
                    "Erro",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error);

                }
        }
    } 
}
