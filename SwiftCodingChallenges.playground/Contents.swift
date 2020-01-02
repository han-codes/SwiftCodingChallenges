import UIKit

/**
 Challenge 3: Do 2 strikngs contain the same characters?
 Write a function that accepts 2 String params and return true if they contain the same characters in any order taking into account letter case.
 */

// MARK: - Brute Force Solution

func hasSameCharacters(with firstString: String, and secondString: String) -> Bool {
    
    // The initial string we'll be used to compare
    var checkedString = secondString
    secondString.trimmingCharacters(in: .whitespaces)
    
    // Loop through the other string. Remove each character instance found in the comparing string from checkedString
    for letter in firstString {
        
        // index(of:) is O(n) BAD
        guard let index = checkedString.firstIndex(of: letter) else { return false }
        
        // remove(at:) is also O(n) BAD
        checkedString.remove(at: index)
    }
    
    // checkedString should be 0 if strings are the same
    return checkedString.count == 0
}

hasSameCharacters(with: "lets test" , and: "test ltes")

// MARK: Swift Solution

func hasSameCharactersSolution(with firstString: String, and secondString: String) -> Bool {
    
    return firstString.sorted() == secondString.sorted()
}

var success = hasSameCharactersSolution(with: "Lets Test", and: "tesT Ltes")
var fail = hasSameCharactersSolution(with: "Lets Test", and: "Letss Test")
/*(
 Challenge 4: Does one string contain another?
 Write your own version of contains() method on String that ignored letter case.
 */

// Solution

extension String {
    
    func contains(_ input: String) -> Bool {
        
        // range(of:) returns the position of one string inside another
        // if range(of:) is nil, it's because the substring didn't exist
        return self.range(of: input, options: .caseInsensitive) != nil
    }
}

success = "hello world".contains("HellO")
fail = "Hello World".contains("Hello  ")

/*
 Challenge 5: Count the characters
 Write a function that accepts a string and returns how many times a specific character appears, taking case into account.
 Try not using a for-loop
 */

// Attempt #1

func count(for character: Character, in string: String) -> Int {
    
    let filteredString = string.filter{ $0 == character }
    return filteredString.count
}

count(for: "a", in: "alphabet")

// Swift Solution: Using reduce()

/*
 Challenge 7: Condense whitespace
 Write a function that returns a string with any consecutive spaces replaced with a single space
 */

func challenge7RemoveDuplicateWhitespaces(input: String) -> String {
    
    // Loop through input
    // Set a boolean to true when we run into an empty space
    // Set boolean to false when we the character is not a [space] and append the character to a string
    
    var seenSpace = false
    var completedString = ""
    
    for character in input {
        
        if character == " " {
            
            if seenSpace { continue }
            seenSpace = true
        }
        else {
            
            seenSpace = false
        }
        
        completedString.append(character)
    }
    
    return completedString
}

challenge7RemoveDuplicateWhitespaces(input: " hi  there     t e s t  ")

// Solution using regular expressions
// This will be more expensieve but takes a lot to see the difference in speed

func challenge7UsingRegularrExpressions(input: String) -> String {
    
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

challenge7UsingRegularrExpressions(input: " hi  there     t e s t  ")

/*
 Challenge 7a: Condense Whitespace and Leading/Trailing spaces
 Remove duplicate whitespace while also removing leading and trailing whitespace
 */

func challenge7a(input: String) -> String {
    
    let components = input.components(separatedBy: " ")
    return components.filter { !$0.isEmpty }.joined(separator: " ")
}

challenge7a(input: " hi  there     t e s t  ")

/*
 Challenge 8: String is rotated
 Write a function that accepts 2 strings, and returns true if one string is rotation of the other, taking letter case into account.
 Tip: String rotation is when you take a string, remove some letters from its end, then append them to the front. E.g. "swift" rotated by 2 characters would be "ftswi"
 */

// MARK: - Close but WRONG Solution
// would incorrectly return true if string contains letters but isn't an actual rotation e.g. abc and a should be false but returns true
func challenge8StringIsRotated(input: String, rotated: String) -> Bool {
    
    // If you write a string twice, it must have all possible rotations e.g. cat = catcat
        // Then check if this appended string contains the input we're comparing with
    
    let firstInputRotation = input + input
    return firstInputRotation.contains(rotated)
}

challenge8StringIsRotated(input: "abcde", rotated: "e")
challenge8StringIsRotated(input: "abcde", rotated: "cdeab")

// MARK; - Solution that takes account of length of strings so they must be rotations

func challenge8Solution(input: String, rotated: String) -> Bool {
    
    guard input.count == rotated.count else { return false }
    
    let combined = input + input
    return combined.contains(rotated)
}

challenge8Solution(input: "abcde", rotated: "e")
challenge8Solution(input: "abcde", rotated: "cdeab")

/*
 Challenge 9: Find pangrams
 Write a function that returns true if it is given a string that is an English pangram, ignoring letter-case
 Tip: A pangram is a string that contains every letter of the alphabet at least once.
 */

// letters can be used multiple times
// we could just have an array of letters and loop through input string and check that alphabetArray contains it

func challenge9IsAPangram(input: String) -> Bool {
    
}
