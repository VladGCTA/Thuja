This is a very simple Lazarus application that I created to study LCL (Lazarus Component Library)
# Features:
Counts lines of source code excluding comment lines and empty lines
Allows you to choose from predefined programming languages or add your own
## Adding new languages:
You could choose one of languages or add your own in `unitsinglecomments.pas`. Just add line: 
``` pascal
addElement(commentMap, 'Your Language', 'Comment String');
```
Then compile application with Lazarus
### Future plans:
In future, I want add some more functionality like ignoring multiple strings commentary, single operators like begin/end or curly brackets '{}'