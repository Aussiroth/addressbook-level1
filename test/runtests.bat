@ECHO OFF

REM create bin directory if it doesn't exist
if not exist ..\bin mkdir ..\bin

REM compile the code into the bin folder
javac  ..\src\seedu\addressbook\Addressbook.java -d ..\bin

REM (invalid) no parent directory, invalid filename with no extension
REM java -classpath ..\bin seedu.addressbook.AddressBook " " < NUL > actual.txt
REM (invalid) invalid parent directory that does not exist, valid filename
REM java -classpath ..\bin seedu.addressbook.AddressBook "directoryThatDoesNotExist/valid.filename" < NUL > actual.txt
REM (invalid) no parent directory, invalid filename with dot on first character
REM java -classpath ..\bin seedu.addressbook.AddressBook ".noFilename" < NUL > actual.txt
REM (invalid) valid parent directory, non regular file
REM if not exist data\notRegularFile.txt mkdir data\notRegularFile.txt
REM java -classpath ..\bin seedu.addressbook.AddressBook "data/notRegularFile.txt" < NUL > actual.txt
REM (valid) valid parent directory, valid filename with extension.
REM copy /y NUL data\valid.filename
REM java -classpath ..\bin seedu.addressbook.AddressBook "data/valid.filename" < exitinput.txt > actual.txt
REM run the program, feed commands from input.txt file and redirect the output to the actual.txt
java -classpath ..\bin seedu.addressbook.AddressBook < input.txt > expectaddress.txt

REM compare the output to the expected output
FC actual.txt expectaddress.txt
REM more actual.txt