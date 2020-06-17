using System;

namespace BackJoonSolved
{
    class Program
    {
        public static void PrintCat()
        {
            Console.WriteLine(@"\    /\");
            Console.WriteLine(" )  ( ')");
            Console.WriteLine("(  /  )");
            Console.WriteLine(@" \(__)|");

            int test = 123;
            Console.WriteLine($" {test}(__)|");
        }

        public static void PrintDog()
        {
            Console.WriteLine("|\\_/|");
            Console.WriteLine("|q p|   /}");
            Console.WriteLine("( 0 )\"\"\"\\");
            Console.WriteLine("|\"^\"`    |");
            Console.WriteLine("||_/=\\\\__|");
        }

        public static void PrintPlusTwoInt()
        {
            string x = "1hh0";
            int y = int.Parse(x);
            int result;
            if (int.TryParse(x, out result))
            {

            }
            else
            {
                ///잘못 입력했다 메시지.
            }

            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine(a + b);
        }

        public static void PrintMinusTwoInt()
        {
            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine(a - b);
        }

        public static void PrintMultiplyTwoInt()
        {
            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine(a * b);
        }

        public static void PrintDivisionTwoDouble()
        {
            double a = Convert.ToInt32(Console.ReadLine());
            double b = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine(a / b);
        }

        public static void PrintFourArithmeticOperations()
        {
            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine(a + b);
            Console.WriteLine(a - b);
            Console.WriteLine(a * b);
            Console.WriteLine(a / b);
            Console.WriteLine(a % b);
        }

        public static void PrintRemainderThreeInt()
        {
            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());
            int c = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine((a + b) % c);
            Console.WriteLine(((a % c) + (b % c)) % c);
            Console.WriteLine((a * b) % c);
            Console.WriteLine(((a % c) * (b % c)) % c);
        }

        public static void Prob2588()
        {
            int first = Convert.ToInt32(Console.ReadLine());
            String last = Console.ReadLine();
            int lastNum = Convert.ToInt32(last);

            int a = Convert.ToInt32(last.Substring(0, 1));
            int b = Convert.ToInt32(last.Substring(1, 1));
            int c = Convert.ToInt32(last.Substring(2));

            Console.WriteLine(first * a);
            Console.WriteLine(first * b);
            Console.WriteLine(first * c);
            Console.WriteLine(first * lastNum);

        }

        public static void Prob1330()
        {
            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());

            if (a > b)
            {
                Console.WriteLine(">");
            }
            else if (a < b)
            {
                Console.WriteLine("<");
            }
            else
            {
                Console.WriteLine("==");
            }
        }

        public static void Prob9498()
        {
            int a = Convert.ToInt32(Console.ReadLine());

            if (a >= 90 && a <= 100)
            {
                Console.WriteLine("A");
            }
            else if (a >= 80 && a < 90)
            {
                Console.WriteLine("B");
            }
            else if (a >= 70 && a < 80)
            {
                Console.WriteLine("C");
            }
            else if (a >= 60 && a < 70)
            {
                Console.WriteLine("D");
            }
            else
            {
                Console.WriteLine("F");
            }
        }

        public static void Prob2753()
        {
            int year = Convert.ToInt32(Console.ReadLine());
            if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
            {
                Console.WriteLine("1");
            }
            else
            {
                Console.WriteLine("0");
            }
        }

        public static void Prob14681()
        {
            int x = Convert.ToInt32(Console.ReadLine());
            int y = Convert.ToInt32(Console.ReadLine());

            if (x > 0 && y > 0)
            {
                Console.WriteLine(1);
            }
            else if (x < 0 && y > 0)
            {
                Console.WriteLine(2);
            }
            else if (x < 0 && y < 0)
            {
                Console.WriteLine(3);
            }
            else if (x > 0 && y < 0)
            {
                Console.WriteLine(4);
            }
        }

        public static void Prob2884()
        {
            int hour = Convert.ToInt32(Console.ReadLine());
            int minute = Convert.ToInt32(Console.ReadLine());

            minute -= 45;
            if (minute < 0)
            {
                minute += 60;
                hour -= 1;
                if (hour < 0)
                {
                    hour += 24;
                }
            }

            Console.WriteLine(hour + " " + minute);
        }

        public static void Prob2739()
        {
            int num = Convert.ToInt32(Console.ReadLine());
            for (int i = 1; i <= 9; i++)
            {
                Console.WriteLine(num + " * " + i + " = " + (num * i));
            }
        }

        public static void Prob10950()
        {
            int num = Convert.ToInt32(Console.ReadLine());
            int[] values = new int[num];
            for (int i = 0; i < num; i++)
            {
                int a = Convert.ToInt32(Console.ReadLine());
                int b = Convert.ToInt32(Console.ReadLine());
                values[i] = a + b;
            }
            foreach (int i in values)
            {
                Console.WriteLine(i);
            }
        }

        public static void Prob8393()
        {
            int n = Convert.ToInt32(Console.ReadLine());
            int total = 0;


            for (int i = 1; i <= n; i++)
            {
                total += i;
            }
            Console.WriteLine(total);
        }

        public static void Prob2741()
        {
            int n = Convert.ToInt32(Console.ReadLine());
            for (int i = 1; i <= n; i++)
            {
                Console.WriteLine(i);
            }
        }

        public static void Prob2742()
        {
            int n = Convert.ToInt32(Console.ReadLine());

            for (int i = n; i >= 1; i--)
            {
                Console.WriteLine(i);
            }
        }

        public static void Prob11021()
        {
            int n = Convert.ToInt32(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                int a = Convert.ToInt32(Console.ReadLine());
            }
        }
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
