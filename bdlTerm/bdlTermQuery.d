module bdlTermQuery;
import std.stdio;

bool query(string question, bool defaultSelection = false)
{
    string userSelection;

    try {
        write(question);
        if (defaultSelection) {
            writeln("[Y/n]");
        } else {
            writeln("[y/N]");
        }
        userSelection = readln();
        
        if (userSelection == "y\n" || userSelection == "Y\n") {
            return true;
        } else if (userSelection == "\n" && defaultSelection) {
            return true;
        } else {
            return false;
        }
    }
    catch (Exception error) {
        writeln("ERROR: ", error);
        return false;
    }
}