import 'dart:io';

String? priority;
String? title;
String? start;
File? file;

void main() 
{
  stdout.write("Please enter your username to continue: ");

  String? username = stdin.readLineSync();

  if (username != null) 
  {
    DateTime now = DateTime.now();
    newPlayerGreetings(username);

    stdout.write('Do you want to start (y/n)? : ');
    start = stdin.readLineSync();

    while (start != 'y' && start != 'n') 
    {
      stdout.write('Invalid input. Do you want to start (y/n)? : ');
      start = stdin.readLineSync();
    }

    if (start == 'y') 
    {
      stdout.write('Now that you entered your username we can proceed by asking you how many tasks for $now : ');
      String? tasksNumber = stdin.readLineSync();

      stdout.write("Please enter a file name: ");
      String? fileName = stdin.readLineSync();
      generator(fileName!);

      if (tasksNumber != null) 
      {
        tasks(tasksNumber, file!);
      } 
      
      else 
      {
        stdout.write('Now that you entered your username we can proceed by asking you how many tasks for $now : ');
        tasksNumber = stdin.readLineSync();
      }
    }

  } 

  else 
  {
    stdout.write("Please enter your username to continue: ");
    username = stdin.readLineSync();
  }

}

void generator(String name) 
{

  file = File('${name}.csv');

  if (file!.existsSync()) 
  {
    print('Already created');
  } 

  else 
  {
    file!.createSync();
  }

  file?.writeAsStringSync('Content,Priority\n');
}

void newPlayerGreetings(String username) 
{
  print("Hello Mr. $username: welcome to Dart Task Tracker!");
}

void tasks(String tasksNumber, File fileName) 
{
  for (int i = 0; i < int.parse(tasksNumber); i++) 
  {
    stdout.write("Title of task number ${i + 1} : ");
    title = stdin.readLineSync();
    stdout.write("Task priority for task number ${i + 1} : ");
    priority = stdin.readLineSync();

    if (title != null && priority != null) 
    {
      fileName.writeAsStringSync('$title,$priority\n', mode: FileMode.append);
    } 
    
    else 
    {
      print("Sorry, you didn't fill in the gaps! ");
    }
  }
}