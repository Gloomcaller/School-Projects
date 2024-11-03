using System;
using System.Collections.Generic;
using System.Linq;

namespace SushiProject
{
    class Program
    {
        private static List<Sushi> allSushi = new List<Sushi>
        {
            new Roll("California Roll", "Crab"),
            new Roll("Spicy Tuna Roll", "Tuna"),
            new Nigiri("Salmon Nigiri", "Salmon"),
            new Nigiri("Eel Nigiri", "Eel"),
            new Onigiri("Chicken Onigiri", "Chicken"),
            new Onigiri("Tuna Onigiri", "Tuna"),
            new Sashimi("Tuna Sashimi", "Tuna"),
            new Sashimi("Salmon Sashimi", "Salmon")
        };

        static void Main(string[] args)
        {
            bool exitProgram = false;
            while (!exitProgram)
            {
                Console.WriteLine("\nMain Menu:");
                Console.WriteLine("1. View all sushi types.");
                Console.WriteLine("2. View and explore specific sushi type.");
                Console.WriteLine("0. Exit");

                Console.Write("Enter your choice: ");
                string? userInput = Console.ReadLine();

                switch (userInput)
                {
                    case "1":
                        DisplayAllSushiTypes();
                        break;
                    case "2":
                        DisplaySushiDetailsMenu();
                        break;
                    case "0":
                        exitProgram = true;
                        break;
                    default:
                        Console.WriteLine("Invalid choice. Please enter a valid option.");
                        break;
                }
            }
        }

        private static void DisplayAllSushiTypes()
        {
            Console.WriteLine("\nAll Sushi Types:");
            foreach (var sushiType in allSushi.Select(s => s.GetType().Name).Distinct())
            {
                Console.WriteLine($"- {sushiType}");
            }
        }

        private static void DisplaySushiDetailsMenu()
        {
            Console.WriteLine("\nSelect sushi type to view details:");
            var sushiTypes = allSushi.GroupBy(s => s.GetType().Name).ToList();
            for (int i = 0; i < sushiTypes.Count; i++)
            {
                Console.WriteLine($"{i + 1}. {sushiTypes[i].Key}");
            }
            Console.WriteLine("0. Go back");

            string? choice = Console.ReadLine();
            if (int.TryParse(choice, out int selectedType) && selectedType > 0 && selectedType <= sushiTypes.Count)
            {
                DisplaySushiOfType(sushiTypes[selectedType - 1].Key);
            }
        }

        private static void DisplaySushiOfType(string type)
        {
            var sushiList = allSushi.Where(s => s.GetType().Name == type).ToList();
            Console.WriteLine($"\nAll {type}s:");
            for (int i = 0; i < sushiList.Count; i++)
            {
                Console.WriteLine($"{i + 1}. {sushiList[i].Name}");
            }

            Console.WriteLine("Enter the number to view more details or 0 to go back:");
            if (int.TryParse(Console.ReadLine(), out int index) && index > 0 && index <= sushiList.Count)
            {
                var selectedSushi = sushiList[index - 1];
                Console.WriteLine($"\nDescription of {selectedSushi.Name}:");
                selectedSushi.Prepare();
                selectedSushi.Serve();
                Console.WriteLine(selectedSushi.GetDescription());
            }
        }
    }
}

namespace SushiProject
{
    public abstract class Sushi
    {
        public string Name { get; }
        public string MainIngredient { get; }

        protected Sushi(string name, string mainIngredient)
        {
            Name = name;
            MainIngredient = mainIngredient;
        }

        public abstract void Prepare();
        public abstract void Serve();
        public virtual string GetDescription()
        {
            return $"{Name} is made with {MainIngredient}.";
        }
    }
}

namespace SushiProject
{
    public class Roll : Sushi
    {
        public Roll(string name, string mainIngredient) : base(name, mainIngredient) { }

        public override void Prepare()
        {
            Console.WriteLine($"Preparing the roll {Name}.");
        }

        public override void Serve()
        {
            Console.WriteLine($"Serving {Name} with soy sauce.");
        }
    }

    public class Nigiri : Sushi
    {
        public Nigiri(string name, string mainIngredient) : base(name, mainIngredient) { }

        public override void Prepare()
        {
            Console.WriteLine($"Preparing the nigiri {Name}.");
        }

        public override void Serve()
        {
            Console.WriteLine($"Serving {Name} with a dab of wasabi.");
        }
    }

    public class Onigiri : Sushi
    {
        public Onigiri(string name, string mainIngredient) : base(name, mainIngredient) { }

        public override void Prepare()
        {
            Console.WriteLine($"Preparing the onigiri {Name}.");
        }

        public override void Serve()
        {
            Console.WriteLine($"Serving {Name} as a triangular rice ball.");
        }
    }

    public class Sashimi : Sushi
    {
        public Sashimi(string name, string mainIngredient) : base(name, mainIngredient) { }

        public override void Prepare()
        {
            Console.WriteLine($"Slicing the fish for {Name}.");
        }

        public override void Serve()
        {
            Console.WriteLine($"Serving {Name} on a platter.");
        }
    }
}
