Random damage = new Random();
int hero = 10, monster = 10;

do {
    
        int heroDamage = damage.Next(1, 11);
        monster -= heroDamage;
        Console.WriteLine($"Monster was damaged and lost {heroDamage} health and now has {monster} health.");
    
        if (monster <= 0) continue;

        int monsterDamage = damage.Next(1, 11);
        hero -= monsterDamage;
        Console.WriteLine($"Hero was damaged and lost {monsterDamage} health and now has {hero} health.");
    
} while (hero > 0 && monster > 0);

Console.WriteLine(hero > monster ? "Hero wins!" : "Monster wins!");