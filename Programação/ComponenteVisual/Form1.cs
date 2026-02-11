using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ComponenteVisual
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            //Criar variavel
            //Definir o tipo da variavel
            //definir o nome da varial
            string nome;
            nome = txtNome.Text;

            //Exibir o conteudo
            //usando uma Caixa de Mensagem

            //Informar o conteudo da mensagem
            //E o titulo da Mensagem
            MessageBox.Show(
                "Nome: " + nome,
                "Informação!");
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}
