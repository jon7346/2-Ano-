using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CadastroPOO
{
    public partial class ale: Form
    {
        public ale()
        {
            InitializeComponent();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        UsuarioExecucao usuarioExecucao = new UsuarioExecucao();
    
         Usuario ExtrairUsuario()
        {
            //Recuperar o registro sekecionado
            //e transformalo no objeto Usuario 
            //usuar o as para converter o item em objeto 
            return listUsuarios.SelectedItem as Usuario;

        }
        void Atualizarlista()
        {
            listUsuarios.DataSource = null;

            listUsuarios.DataSource = usuarioExecucao.ListarTodos();


            // definir qual campo de usuario será
            // exibido na ListaBox 
            //DisplpayMember o dados a ser exibido na list 
            //é preciso colocar o nome correto 
            //do atrivuto desejado 

            listUsuarios.DisplayMember = "NomeEmail";

            //Método para extrair o objeto usuario 
            //selecionada da ListBox 
        }

        private void BtnAdicionar_Click(object sender, EventArgs e)
        {
            //Vamos popular o objeto com os dados informados 

            // neste caso para ser mais objetivo, iremos 
            // pular a parte de validação 
            int numero = 1; 


            Usuario usuario = new Usuario();

            usuario.CPF = txtCPF.Text;
            usuario.Nome = txtNome.Text;
            usuario.DtNascimento = DtNascimento.Value;
            usuario.Email = txtEmail.Text;
            usuario.Senha = txtSenha.Text;

            //Agora podemos adicionar o nosso objeto 
            //a lista de objetos usando o método adicionar 
            //da classe usuarioExecucao

            // Atualizar a listbox 
            usuarioExecucao.Adicionar(usuario);

            txtCPF.Clear(); 
            txtNome.Clear();
            txtEmail.Clear();
            txtSenha.Clear();
            DtNascimento.Value = DateTime.Now;
            
            Atualizarlista();

        }

        private void btnRemover_Click(object sender, EventArgs e)
        {
            //Iremos chamar o método ExtrairUsuario 
            //para recuperar o usuario selecionado 
            //e passar este usuario via paramentro 
            //para o método remover 

            usuarioExecucao.Remover(ExtrairUsuario()); 
        }

        private void listUsuarios_DoubleClick(object sender, EventArgs e)
        {
            Usuario usuarioSelecionado = ExtrairUsuario();

            txtVisCpf.Text = usuarioSelecionado.CPF;
            txtVisEmail.Text = usuarioSelecionado.Email;
            txtVisNome.Text = usuarioSelecionado.Nome;
            txtVisIdade.Text = usuarioSelecionado.Idade.ToString();
            txtVisSenha.Text = usuarioSelecionado.Senha;
            txtVisNascimento.Text = usuarioSelecionado.DtNascimento.ToString(); 

        }
    }
}
