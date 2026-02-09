using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TestePOO
{
    public partial class Form1: Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // para manipular um classe 
            // é presciso criar um objeto 
            // realizando a instancia da classe 
            // alocando em memoria (RAM)

            // para instanciar é dividida 
            // em 5 partes 
            //tipo de dado 
            ///Variavel referente ao objeto 
            ///(geralmente faz referencia ao nome da classe)
            ///o sinal de igual (=) atrubuir informaçoes 
            ///palavra reservador new 
            ///(responsavel por alocar a classe em memoria)
            ///Construtor da classe a ser instancia 
            ///(repete o mesmo nome do tipo de dados)
            ///o parenteses() faz referencia ao método 
            ///construtor 
            Pessoa pessoa = new Pessoa();

            //Atribuir informações 
            pessoa.Nome = "Lucas";
            pessoa.CPF = "64646";
            //Utilizar o DateTime.Now
            //para recuperar a data atual do computador 
            pessoa.DtNascimento = DateTime.Now;

            //Nesse momento estou substituindo a informações 
            //anterior
            pessoa.Nome = "João";

            Pessoa pessoa2 = new Pessoa();
            //Irei Atribuir os dados da segunda pessoa 

            pessoa2.Nome = "Guilherme";
            pessoa2.CPF = "65464545";
            pessoa2.DtNascimento = DateTime.Now;

            // Exibir os dados do atributo Nome 
            // das classes Pessoa

            MessageBox.Show(
                "Pessoa - Nome: " + pessoa.Nome + Environment.NewLine +
                "Pessoa2 - Nome: " + pessoa2.Nome); 

            //Agora iremos para parte herença 
            //iremos criar a classe aluno que herdara de pessoa
            



                
        }

        private void btnAluno_Click(object sender, EventArgs e)
        {
            Aluno aluno = new Aluno();

            aluno.Nome = "Maria";
            aluno.CPF = "2213248";
            aluno.DtNascimento = DateTime.Now;
            aluno.RA = "20257114145"
 ;           aluno.Matricula = true;

            MessageBox.Show(aluno.CPFNome); 
        }

        private void btnProfessor_Click(object sender, EventArgs e)
        {
             Professor professor = new Professor();

            professor.Nome = "Muriel";
            professor.CPF = "13248034923";
            professor.RE = "54656";
            professor.Salario = 50000;

            MessageBox.Show(professor.CPFNome);

        }

        private void btnCadastrar_Click(object sender, EventArgs e)
        {
            // Para cadastrar um aluno é presciso cadastrar uma displina 
            // Para cadastrar uma displina é necessario cadastrar um professor

            Professor professor = new Professor();
            professor.Nome = "Lucas";
            professor.CPF = "134789";
            professor.DtNascimento = DateTime.Now;
            professor.RE = "12345";
            professor.Salario = 1;

            //Cadatre da Diciplina
            Diciplina diciplina = new Diciplina();
            diciplina.Nome = "Programação Orientada a Objeto";
            diciplina.professor = professor;

            //Cadastro do aluno 
            Aluno aluno = new Aluno();
            aluno.Nome = "Arthur";
            aluno.CPF = "321312412";
            aluno.DtNascimento = DateTime.Now;
            aluno.RA = "13124";
            aluno.Matricula = true;
            aluno.Disciplina = diciplina;

            ExibirDados(aluno);
        }

        //metodo para exibir os dados do cadastro no textbox 
        void ExibirDados(Aluno aluno)
        {
            txtCadastro.Text =
               "Aluno: " + Environment.NewLine +
               "RA:" + aluno.RA + Environment.NewLine +
               "Nome" + aluno.Nome + Environment.NewLine +
               "Diciplina:" + Environment.NewLine +
               "Nome: " + aluno.Disciplina.Nome + Environment.NewLine +
               "Professor" + aluno.Disciplina.professor.Nome + Environment.NewLine; 

        }


    }
}
