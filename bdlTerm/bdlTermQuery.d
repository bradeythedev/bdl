// Copyright (c) 2022 bradeythedev (https://github.com/bradeythedev)

module bdlTerm.bdlTermQuery;
import std.stdio;



// bdlTermQuery 1.0
// This library includes the ability to get user input as a boolean in a familiar manner - "Question? [y/N]"
// When using the 'query' bool, you can choose the question, and the default selection - "[y/N]" (default) or "[Y/n]"
// If the user inputs only enter, the default selection (the capital letter) will be returned
// All accepted inputs are 'Y', 'y', 'N', 'n', and '\n' (enter)
// If anything other than this is inputted, it will be interpreted as false regardless of default selection

// Examples
//
// EXAMPLE 1
//   
//   CODE:
//   bool myBool = bdlTerm.bdlTermQuery.query("Is bdl cool?", true);
//          /\                      /\          /\             /\
//   [the bool to be returned]    [call]    [question]    [value if input is null]
//   
//   TERMINAL:
//   Is bdl cool? [Y/n]
//   [if simply enter is inputted, it will result in myBool being set to true]
//
// EXAMPLE 2
//
//   CODE:
//   myBool = bdlTerm.bdlTermQuery.query("Do you want to wipe your disk?");
//      /\                          /\          /\
//   [the bool to be returned]    [call]    [question]
//
//   TERMINAL:
//   Do you want to wipe your disk? [y/N]
//   [if simply enter is inputted, it will result in myBool being set to false]



// This is the query function, the main function of this library
// The function returns a boolean, and requires question (as a string), and optionally a boolean to choose the default selection
bool query(string question, bool defaultSelection = false)
{
    // This string will be used to store the input from the user
    string userSelection;

    // Most of the function is in a try/catch loop for safety, which prints the error and returns false if it fails
    try {
        // Print the question to the terminal
        write(question);

        // Determine which selector to use
        if (defaultSelection) {
            // If the default selection has been set as true (yes), print the Y in capitals
            writeln("[Y/n]");
        } else {
            // Else print the N in capitals (this is used by default)
            writeln("[y/N]");
        }

        // Read the user's input and store it in the "userSelection" string
        userSelection = readln();
        
        // Determine the user's selection from the "userSelection" string
        if (userSelection == "y\n" || userSelection == "Y\n") {
            // If the string contains a 'y' or 'Y' then return true
            return true;
        } else if (userSelection == "\n" && defaultSelection) {
            // If the user inputted only enter, and the default selection is true (yes), return true
            return true;
        } else {
            // In all other scenarios, return false
            return false;
        }
    }
    catch (Exception error) {
        // If an error occurred, print the error then return false
        writeln("ERROR: ", error);
        return false;
    }
}