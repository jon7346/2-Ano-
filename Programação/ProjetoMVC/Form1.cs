using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjetoMVC
{   //primeito passo para prograação em camadas 
    // é criar as pastas das camadas 
    // models: armazenar as classes de objetos 
    //views: armazenar as telas do sistema 
    //Controllers: armazenar as classes de regras de negócio 
    //teremos uma camada adicional para armazenar 
    // a conecxão com o banco de dados 
    // services : armazenar a conexão com o banco de dados 
    // Segundo passo é criar as classes na models 
    // geralmente espelhando as tabelas do banco de dados
    //ordem de criação Models > banco de dados > controller > Views

    public partial class Form1: Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
