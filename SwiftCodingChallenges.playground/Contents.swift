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
        
        if character == " "{
            
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

/*
 Challenge 7a: Condense Whitespace and Leading/Trailing spaces
 Remove duplicate whitespace while also removing leading and trailing whitespace
 */

func challenge7a(input: String) -> String {
    
    let components = input.components(separatedBy: " ")
    return components.filter { !$0.isEmpty }.joined(separator: " ")
}

challenge7a(input: " hi  there     t e s t  ")
