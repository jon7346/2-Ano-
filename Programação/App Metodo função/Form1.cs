using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace App_Metodo_função
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            switch (cbbmodelo.SelectedIndex)
            {
                case 0:
                    MessageBox.Show("Marca NISSAN");
                    break;
                case 1:
                    MessageBox.Show("Marca FIAT");
                    break;
                case 2:
                    MessageBox.Show("Marca TOYOTA");
                    break;
                case 3:
                    MessageBox.Show("Marca CHEVROLET");
                    break;
                default:
                    MessageBox.Show("Opção não encontrada");
                    break;
            }
        }

        private void IF_Click(object sender, EventArgs e)
        {

            if (textmodelo1.Text == "f80")
            {
                MessageBox.Show("Você escolheu uma ferrari");
            }
            else if (textmodelo1.Text == "Fusca")
            {
                MessageBox.Show("você escolheu um chevrolet");

            }
            else if (textmodelo1.Text == "Renegade")
            {
                MessageBox.Show("Você escolheu um Jepp ");
            }
            else
                MessageBox.Show("opção não encontrada");
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnmetodo_Click(object sender, EventArgs e)

        {
            MessageBox.Show(txtnome.Text);
            MessageBox.Show(txtnome.Text, "informação");
            MessageBox.Show(txtnome.Text, "informação",
                MessageBoxButtons.OK,
                MessageBoxIcon.Information);
            Msginformacao(txtnome.Text);


        }
        //vamos criar um metodo para 
        //Exibir um messageBox de aviso 
        //pré configuração 
        //Para criar o metodo 
        //presiciso informar o tipo e o nome 
        //void = sem retorno 

        void Msginformacao(String Texto)
        {
            MessageBox.Show(Texto,
                "informação", //titulo 
                MessageBoxButtons.OK, //button
                MessageBoxIcon.Information // icone 
            );

        }

        private void btnfuncao_Click(object sender, EventArgs e)
        {
            Msginformacao("O nome informado é: " + txtnome.Text);
        }
        string MsgNome(string nome)
        {
            return "o nome informado é:" + nome;

        }
    }
}
