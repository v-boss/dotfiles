#!/usr/bin/python

# Imports
import random
import sys

# Variables
argnum = 1
arglen = len(sys.argv)
TotalList = []

# These Two variables start at these numbers, It works
PlusTotal = 2
DieCount = 1

def my_min(sequence):
    low = sequence[0] # need to start with some value
    for i in sequence:
        if i < low:
            low = i
    return low

# Function that generates the dice numbers
def DiceRoll(argu):
    
    DiceRolls = []
    global argnum
    global DieCount

    # Dice Number Extraction
    dieS = argu.split("d")      # Split the input left and right
    dice = int(filter(str.isdigit, dieS[1])) # Grab the right number, the dice
    adice = int (filter(str.isdigit, dieS[0])) # Grab the left number, Amount of Rolls

    # Dice Number Roll
    i = 1                       # While loop Counter
    while i <= adice:
        number = random.randint(1,dice) # Generate random number in accordance with dice type
        DiceRolls.insert(i , number)
        i = i + 1

    total = sum(DiceRolls)      # Grabs Dice rolls and add them together
    
    # Prints Outputs
    if "ability" in argument:
        min = my_min(DiceRolls)
        DiceRolls.remove(min)
        print ("\nDice " + str(DieCount) + " Total Count = " + str(sum(DiceRolls)))
        print ("Dice " + str(DieCount) + " Rolls = " + str(DiceRolls))
    else:
        print ("\nDice " + str(DieCount) + " Roll = " + str(total))
        print ("Dice " + str(DieCount) + " Running Total = " + str(DiceRolls))
    
    # Add to List
    global TotalList
    TotalList.insert(argnum,total)

    # Increament Number
    argnum = argnum + 1
    DieCount = DieCount + 1

    
argument = str(sys.argv[argnum:argnum + 1 ])

if "ability" in argument:
    ab = "4d6"
    i = 0
    print "\nGenerated Ability Scores - 4d6 Drop Lowest"
    for i in range(0,6,1):
        DiceRoll(ab)
    
else:
    while argnum < arglen:
        argument = str(sys.argv[argnum:argnum + 1 ])
        if "+" in argument:
            AddNum = int(filter(str.isdigit, argument))
            ListEnt = TotalList[argnum - PlusTotal] + AddNum
            print ("Dice " + str(DieCount - 1) + " Plus " + str(AddNum) + " = "  + str(ListEnt))
            del TotalList[argnum - PlusTotal]
            TotalList.insert(argnum - PlusTotal, ListEnt)
            argnum = argnum + 1
            PlusTotal = PlusTotal + 1
        else:
            DiceRoll(argument)
        
    
# print TotalList
print "\nTotal of Dice is " + str(sum(TotalList))
