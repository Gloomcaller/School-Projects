for (int i = 1; i < 101; i++){
    if (i%3 == 0 && i%5 == 0) Console.Write(i + " FizzBuzz");
    else if (i%5 == 0) Console.Write(i + " Buzz");
    else if (i%3 == 0) Console.Write(i + " Fizz");
    else Console.Write(i);
    Console.WriteLine("");
}