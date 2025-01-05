using System;

namespace CSharp_Array_Project
{
    internal class Program
    {
        static int[] GenerateRandomNumbers(int length, int minValue, int maxValue)
        {
            int[] randomNumbers = new int[length];
            Random random = new();

            for (int i = 0; i < length; i++)
            {
                randomNumbers[i] = random.Next(minValue, maxValue + 1);
            }

            return randomNumbers;
        }

        static int FindMaximum(int[] array)
        {
            int max = array[0];
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] > max)
                    max = array[i];
            }
            return max;
        }

        static int FindMinimum(int[] array)
        {
            int min = array[0];

            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] < min)
                    min = array[i];
            }
            return min;
        }

        static void DisplayNumbers(int[] array)
        {
            foreach (int number in array)
            {
                Console.Write(number + " ");
            }
        }

        static void SortAscending(int[] array)
        {
            Array.Sort(array);
        }

        static void SortDescending(int[] array)
        {
            Array.Sort(array);
            Array.Reverse(array);
        }

        static double CalculateAverage(int[] array)
        {
            if (array.Length == 0)
                return 0;

            double sum = 0;
            foreach (int num in array)
            {
                sum += num;
            }
            return sum / array.Length;
        }

        static void AsciiCat()
        {
            Console.WriteLine(" /\\_/\\");
            Console.WriteLine(" ( o.o )");
            Console.Write(" > ^ <");
        }

        static int GetValidMainMenuChoice()
        {
            int choice;
            while (true)
            {
                string userInput = Console.ReadLine();
                if (int.TryParse(userInput, out choice) && choice >= 1 && choice <= 8)
                {
                    return choice;
                }
                else
                {
                    Console.Write("Enter a number corresponding to one of the options (1-8): ");
                }
            }
        }

        static int GetValidGenerationMenuOption()
        {
            int choice;
            while (true)
            {
                string userInput = Console.ReadLine();
                if (int.TryParse(userInput, out choice) && (choice == 1 || choice == 2))
                {
                    return choice;
                }
                else
                {
                    Console.Write("Enter 1 for Manual input or 2 for Random number generation: ");
                }
            }
        }

        static bool ConfirmExit()
        {
            Console.WriteLine("Are you sure you want to exit? (Yes/No)");
            string userResponse = Console.ReadLine()?.Trim().ToLower();

            if (userResponse == "yes" || userResponse == "y")
            {
                Console.WriteLine("Exiting the program...");
                return true;
            }
            else if (userResponse == "no" || userResponse == "n")
            {
                return false;
            }
            else
            {
                Console.Clear();
                Console.WriteLine("You did not enter a valid response. Please try again.");
                return ConfirmExit();
            }
        }

        static void Main(string[] args)
        {
            int[] numbers = new int[5];
            bool useRandomNumbers = false;

            try
            {
                Console.WriteLine("Choose an option for entering numbers:");
                Console.WriteLine("1. Manual input");
                Console.WriteLine("2. Random number generation");
                Console.Write("Enter your choice: ");

                int generationOption = GetValidGenerationMenuOption();

                switch (generationOption)
                {
                    case 1:
                        Console.Clear();
                        Console.WriteLine("Enter 5 integers:");
                        for (int i = 0; i < numbers.Length; i++)
                        {
                            Console.Write($"Number {i + 1}: ");
                            string userInput = Console.ReadLine();

                            int parsedNumber;
                            if (int.TryParse(userInput, out parsedNumber))
                            {
                                numbers[i] = parsedNumber;
                            }
                            else
                            {
                                Console.WriteLine("The input is not valid. Please enter a valid integer.");
                                i--;
                            }
                        }
                        break;

                    case 2:
                        numbers = GenerateRandomNumbers(5, 1, 1000);
                        useRandomNumbers = true;
                        Console.Clear();
                        break;

                    default:
                        Console.WriteLine("Please enter a valid option.");
                        break;
                }

                if (useRandomNumbers)
                {
                    Console.Clear();
                    Console.WriteLine("Generated numbers:");
                    DisplayNumbers(numbers);
                    Console.WriteLine("");
                }
                else
                {
                    Console.Clear();
                    Console.WriteLine("Entered numbers:");
                    DisplayNumbers(numbers);
                    Console.WriteLine("");
                }

                int menuChoice;
                do
                {
                    Console.WriteLine("\nMenu:");
                    Console.WriteLine("1. Display Numbers");
                    Console.WriteLine("2. Find Maximum");
                    Console.WriteLine("3. Find Minimum");
                    Console.WriteLine("4. Sort Ascending");
                    Console.WriteLine("5. Sort Descending");
                    Console.WriteLine("6. Find Average");
                    Console.WriteLine("7. Cat");
                    Console.WriteLine("8. Exit");
                    Console.Write("Enter your choice: ");

                    string userInput = Console.ReadLine();
                    while (string.IsNullOrEmpty(userInput))
                    {
                        Console.Write("You must enter an option. Please enter again: ");
                        userInput = Console.ReadLine();
                    }

                    menuChoice = int.Parse(userInput);

                    switch (menuChoice)
                    {
                        case 1:
                            Console.Clear();
                            Console.WriteLine("Entered numbers:");
                            DisplayNumbers(numbers);
                            Console.WriteLine("");
                            continue;

                        case 2:
                            Console.Clear();
                            Console.WriteLine($"Maximum: {FindMaximum(numbers)}");
                            continue;

                        case 3:
                            Console.Clear();
                            Console.WriteLine($"Minimum: {FindMinimum(numbers)}");
                            continue;

                        case 4:
                            Console.Clear();
                            SortAscending(numbers);
                            Console.Write("Sorted in ascending order: ");
                            DisplayNumbers(numbers);
                            Console.WriteLine("");
                            continue;

                        case 5:
                            Console.Clear();
                            SortDescending(numbers);
                            Console.Write("Sorted in descending order: ");
                            DisplayNumbers(numbers);
                            Console.WriteLine("");
                            continue;

                        case 6:
                            Console.Clear();
                            Console.WriteLine("Average value in the array is: " + CalculateAverage(numbers));
                            continue;

                        case 7:
                            Console.Clear();
                            AsciiCat();
                            Console.WriteLine("");
                            continue;

                        case 8:
                            Console.Clear();
                            if (ConfirmExit())
                            {
                                return;
                            }
                            else
                            {
                                menuChoice = 0;
                                Console.Clear();
                                continue;
                            }

                        default:
                            Console.Clear();
                            Console.WriteLine("Please enter a number corresponding to one of the options.");
                            break;
                    }
                } while (menuChoice != 8);
            }
            catch (ArgumentNullException)
            {
                Console.WriteLine("Error: Incorrect option entered. Enter a valid option.");
            }
            catch (FormatException)
            {
                Console.WriteLine("Error: Incorrect format. Please enter a valid number.");
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("Error: Index out of range. The entered array index is not valid.");
            }
            catch (OverflowException)
            {
                Console.WriteLine("Error: The entered number is too large or too small for the capabilities of an integer.");
            }
            catch (ArgumentException)
            {
                Console.WriteLine("Error: Unexpected argument passed to the method.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: An unexpected error occurred: {ex.Message}");
            }
        }
    }
}