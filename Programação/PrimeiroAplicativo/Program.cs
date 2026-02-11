using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PrimeiroAplicativo
{
    internal static class Program
    {
        /// <summary>
        /// Ponto de entrada principal para o aplicativo.
        /// </summary>
        [STAThread]
        static void Main(string[] parametros)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            if (parametros.Length > 0)
            {
                if (parametros[0] == "2")
                {
                    Application.Run(new Form2());
                }
                else if (parametros[0] == "PRODUTO")
                {
                    Application.Run(new CadProduto());
                }
                else
                {
                    Application.Run(new Form1());
                }
            }
            else
            {
                Application.Run(new Form1());
            }


            
        }
    }
}
