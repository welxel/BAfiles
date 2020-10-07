using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Palindrom
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("İngilizce karakterler içeren bir kelime giriniz (Çıkış için ç'ye basınız): ");
            string input = Console.ReadLine();
            while (input != "ç")
            {
                if (input.Length > 1)
                {
                    if (KarakterKontrol(input) == true)
                    {
                        // ankara - arakna
                        string reversed = TersineCevir(input);
                        PalindromKontrol(input, reversed);
                    }
                    else
                    {
                        Console.WriteLine("Hatalı karakter girdiniz!");
                    }
                }
                else
                {
                    Console.WriteLine("Lütfen en az 2 karakter giriniz!");
                }
                Console.Write("İngilizce karakterler içeren bir kelime giriniz (Çıkış için ç'ye basınız): ");
                input = Console.ReadLine();
            }

            Console.ReadLine();
        }

        private static bool KarakterKontrol(string input)
        {
            bool sonuc = true;
            int asciiValue;
            int i = 0;
            while (i < input.Length && sonuc == true)
            {
                //asciiValue = Convert.ToInt32(input[i]);
                asciiValue = (int)input[i];
                //if (!((asciiValue >= 65 && asciiValue <= 90) || (asciiValue >= 97 && asciiValue <= 122))) // yanlış karakter
                if ((asciiValue < 65 || asciiValue > 90) && (asciiValue < 97 || asciiValue > 122))
                {
                    sonuc = false;
                }
                i++;
            }
            return sonuc;
        }

        private static void PalindromKontrol(string input, string reversed)
        {
            if (input == reversed)
            {
                Console.WriteLine(input + " " + reversed + " palindromdur.");
            }
            else
            {
                Console.WriteLine(input + " " + reversed + " palindrom değildir.");
            }
        }

        private static string TersineCevir(string input)
        {
            string reversed = "";
            for (int i = input.Length - 1; i >= 0; i--) // input.Length - 1 = son index
            {
                //reversed = reversed + input[i];
                reversed += input[i];
            }
            return reversed;
        }
    }
}
