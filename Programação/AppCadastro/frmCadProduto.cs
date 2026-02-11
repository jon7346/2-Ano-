using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppCadastro
{
    public partial class frmCadProduto : Form
    {
        public frmCadProduto()
        {
            InitializeComponent();
            //Desabilitar o errorProvider
            AutoValidate = AutoValidate.Disable;
        }

        private void txtDescricao_Validating(object sender, CancelEventArgs e)
        {
            //IsNullOrWhiteSpace 
            //usado para validar quando é 
            //adicionado apenas caracteres em branco
            //pressionando a barra de espaçao
            if (string.
                IsNullOrWhiteSpace(
                txtDescricao.Text))
            {
                e.Cancel = true;
                errErro.SetError(
                    txtDescricao,
                    "Informe a descrição do produto.");
            }
            else
            {
                e.Cancel = false;
                errErro.SetError(txtDescricao, "");
            }
        }

        private void mskCodBarras_Validating(object sender, CancelEventArgs e)
        {
            if(string.
                IsNullOrWhiteSpace(
                mskCodBarras.Text))
            {
                e.Cancel = true;
                errErro.SetError(
                    mskCodBarras,
                    "Informe o Código de Barras.");
            }
            else if (mskCodBarras.Text.Length != 13)
            {
                e.Cancel = true;
                errErro.SetError(
                    mskCodBarras,
                    "Informe o Código de Barras "+
                    "com 13 dígitos.");
            }
            else
            {
                e.Cancel = false;
                errErro.SetError(mskCodBarras, "");
            }
        }

        private void cbxUnidade_Validating(object sender, CancelEventArgs e)
        {
            //IsNullOrEmpty
            //posso utilizar, pois as opção, são fixas
            if (string.IsNullOrEmpty(cbxUnidade.Text))
            {
                e.Cancel = true;
                errErro.SetError(
                    cbxUnidade, 
                    "Selecione uma Unidade.");
            }
            else
            {
                e.Cancel= false;
                errErro.SetError(cbxUnidade, "");
            }
        }

        private void cbxGrupo_Validating(object sender, CancelEventArgs e)
        {
            if (string.IsNullOrEmpty(cbxGrupo.Text))
            {
                e.Cancel = true;
                errErro.SetError(
                    cbxGrupo,
                    "Selecione um Grupo.");
            }
            else
            {
                e.Cancel = false;
                errErro.SetError(cbxGrupo, "");
            }
        }

        private void txtPrecoVenda_Validating(object sender, CancelEventArgs e)
        {
            if(string.IsNullOrWhiteSpace(
                txtPrecoVenda.Text))
            {
                e.Cancel = true;
                errErro.SetError(
                    txtPrecoVenda,
                    "Informe o Preço de Venda.");
            }
            else
            {
                //Se cheou até aqui, é q o valor
                //foi preenchido
                //podemos valida-lo
                decimal precoVenda =
                    decimal.Parse(txtPrecoVenda.Text);

                if(precoVenda <= 0)
                {
                    e.Cancel = true;
                    errErro.SetError(
                        txtPrecoVenda,
                        "O Preço de Venda deve ser " + 
                        "maior que zero.");
                }
                else
                {
                    e.Cancel= false;
                    errErro.SetError(txtPrecoVenda, "");
                }
            }
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            if(ValidateChildren(
                ValidationConstraints.Enabled))
            {
                MessageBox.Show(
                    "Registro salvo com sucesso.",
                    "Informação", 
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
                Close();
            }
            else
            {
                MessageBox.Show(
                    "Preencha corretamente os campos.",
                    "Atenção",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning);
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show(
                "Deseja realmente descartas "+
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
    }
}
