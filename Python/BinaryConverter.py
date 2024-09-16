#binary, octal, hex converter

import re

def toDecimal(converstionCheck, input):
    if int(converstionCheck) == 1:
        if "0b" in input:
            input = input.split("0b")[1]
        output = int(input, 2)
    if int(converstionCheck) == 3:
        if "0o" in input:
            input = input.split("0o")[1]
        output = int(input, 8)
    
    return output

def toBinary(input):
    input = bin(input).split("0b")[1]
    while len(input)%8 != 0:
        input = f"0{input}"
    output = re.sub(r"(\w{8})", r"\1 ", input) 
    return output

def toOctal(input):
    raw = oct(input).split("0o")[1]
    while len(raw)%3 != 0:
        raw = f"0{raw}"
    output = re.sub(r"(\w{3})", r"\1 ", raw) 
    return output


def main():
    converstionCheck = input("\n1) Binary\n2) Decimal\n3) Octal\n\nWhat are you converting from: ")
    userInput = input("Enter the number you would like to convert: ")
    convertionFormat = input("\n1) Binary\n2) Decimal\n3) Octal\nA) A for all\n\nWhat would you like to convert to: ")

    if converstionCheck == "1":
        if convertionFormat == "2" or "A":
            dec = toDecimal(converstionCheck, userInput)
            print(f"decimal: {dec}")

        if convertionFormat == "3" or "A":
            print(f"octal: {toOctal(dec)}")
        
    if converstionCheck == "2":
        if convertionFormat == "1" or "A":
            print(f"binary: {toBinary(int(userInput))}")

        if convertionFormat == "3" or "A":
            print(f"octal: {toOctal(int(userInput))}")

    if converstionCheck == "3":
        if convertionFormat == "2" or "A":
            dec = toDecimal(converstionCheck, userInput)

        if convertionFormat == "1" or "A":
            print(f"binary: {toBinary(dec)}")

        print(f"decimal: {dec}")

if __name__ == '__main__':
    main()
