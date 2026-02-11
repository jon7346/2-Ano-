using System.Linq.Expressions;
using System.Reflection.Metadata.Ecma335;

Console.Write("Insira o primeiro numero  por favor: ");
string a = Console.ReadLine();

Console.Write("Insira o segundo numero por favir: ");
string b = Console.ReadLine(); 
void Dividir(string a, string b ) {
 int int_a = int.Parse(a);
 int int_b = int.Parse(b);


    try
    {
        int resultado = int_a / int_b;
        Console.WriteLine("O resultado da divisão é " + resultado);


    }
    catch (DivideByZeroException)
    {
        Console.WriteLine("Erro por favor confira os numeros inseridos");

    }
    finally
    {
     
    }
};
Dividir(a, b); 
  