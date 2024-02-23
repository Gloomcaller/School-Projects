using System;

namespace UnusedProjectCode
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] array1 = {
                                { 1, 2, 3 },
                                { 4, 5, 6 },
                                { 7, 8, 9 }
                            };

            Console.WriteLine("{");
            for (int i = 0; i < array1.GetLength(0); i++)
            {
                Console.WriteLine("\t{");
                for (int j = 0; j < array1.GetLength(1); j++)
                {
                    Console.WriteLine("\t\tValue: " + array1[i, j]
                                        + "; Index: [" + i + "," + j + "]");
                }
                Console.WriteLine("\t}");
            }
            Console.WriteLine("}");

            int[][] array2 = {
                                new int[]{ 1, 2, 3 },
                                new int[]{ 4, 5, 6, 7 , 8, 9},
                                new int[]{ 10, 11}
                            };

            Console.WriteLine("{");
            for (int i = 0; i < array2.Length; i++)
            {
                Console.WriteLine("\t{");
                for (int j = 0; j < array2[i].Length; j++)
                {
                    Console.WriteLine("\t\tValue: " + array2[i][j]
                                        + "; Index: [" + i + "," + j + "]");
                }
                Console.WriteLine("\t}");
            }
            Console.WriteLine("}");

            CalculateFibonacci();
            PerformArrayOperations();
            RotateArray();
        }

        static void CalculateFibonacci()
        {
            int[] array = new int[10];
            array[0] = 0;
            array[1] = 1;

            for (int i = 2; i < array.Length; i++)
            {
                array[i] = array[i - 1] + array[i - 2];
            }

            for (int i = 0; i < array.Length; i++)
            {
                Console.WriteLine(array[i]);
            }
        }

        static void PerformArrayOperations()
        {
            int[] a = { 1, 2, 3, 4, 5 };
            int[] b = new int[5];

            Console.WriteLine(a[2] + "\n");
            for (int i = 0; i < a.Length; i++)
            {
                Console.WriteLine(a[i]);
            }
            Console.WriteLine("");

            for (int i = 0; i < b.Length; i++)
            {
                b[i] = a[4 - i];
            }
            for (int i = 0; i < b.Length; i++)
            {
                Console.WriteLine(b[i]);
            }
        }

        static void RotateArray()
        {
            int[] array = { 1, 2, 3, 4, 5 };
            int temp = array[0];
            for (int i = 0; i < array.Length - 1; i++)
            {
                array[i] = array[i + 1];
            }
            array[array.Length - 1] = temp;

            for (int i = 0; i < array.Length; i++)
            {
                Console.WriteLine(array[i]);
            }
        }
    }
}
