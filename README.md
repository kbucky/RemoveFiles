# RemoveFiles
A Powershell script that I created for a unit in my course. This script deletes files from a specified path and a selected amount of days. As a extra measure, the script confirms whether or not the chosen path is valid before deleting the files. (if it has been deleted since being selected)

### Requirements
- Windows PC
- Windows PowerShell
- Files you wish to delete

### Usage
```
1. After installing the script, open it in PowerShell.
2. A dialog box will appear. Please select the folder you wish to delete files from.
3. Confirm if you want to delete files. If yes is selected the script will move to the next step. 
If no is selected no files will be deleted and the script will stop running.
4. Input a number to specify how many days old the files will be.
5. Next the validity of the path will be checked, if the path is valid file deletion will complete.
```

## Demonstration
[![Demonstration](https://img.youtube.com/vi/TO-tLyT49AI/hqdefault.jpg)](https://www.youtube.com/watch?v=TO-tLyT49AI)

### Known issues ran into during development
- I used -IsValid thinking it checked if a path is a real path. Instead it checks for syntax errors only.
![example!](https://user-images.githubusercontent.com/87800373/128487491-4dcc7c2e-d31a-4360-b887-c7c986959e3f.png)
![Screenshot 2021-08-06 192545](https://user-images.githubusercontent.com/87800373/128489205-3303ca76-1653-4db6-bbac-0c80b67f547c.png)
- Originally I had the comfirmation prompt and file deletion section not in the same function. I decided to combind them into one function because I couldn't work out how to make the y/n prompt actually do anything.
- At first the specific path was a path name written in the script. This was changed to a folder dialog as this seems more user friendly.
