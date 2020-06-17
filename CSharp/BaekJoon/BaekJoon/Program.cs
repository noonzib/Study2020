using System;

namespace BaekJoon
{
    class Program
    {

        static void Main(string[] args)
        {
            String first = Console.ReadLine();
            String second = Console.ReadLine();

            int x = int.Parse(first);

            int a = int.Parse(second.Substring(0, 1));
            int b = int.Parse(second.Substring(1, 1));
            int c = int.Parse(second.Substring(2, 1));


            Console.WriteLine(a);
            Console.WriteLine(b);
            Console.WriteLine(c);
        }

    }
}
