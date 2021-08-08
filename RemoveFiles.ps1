Write-Host "Please select the folder you want to delete files from"
Write-Host -ForegroundColor Red  "`n`n`t* * * `t`tW A R N I N G :   Dialog box may be hidden behind another [or this] window!`t`t* * *"
#Prompt to choose what folder files be deleted from
Add-Type -AssemblyName System.Windows.Forms
$browser = New-Object System.Windows.Forms.FolderBrowserDialog
$null = $browser.ShowDialog()
$path = $browser.SelectedPath
#lets the user confirm
Write-Host "Specified path is $path"


Function removefiles{
#prompt for to comfirming file deletion
  $title = "Confirmation"
  $message = "Do you want to delete files in the specified path?"
  $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Select this option if you want to remove files"
  $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Select this option if you don't want to remove files"
  $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
  $result = $host.ui.PromptForChoice($title, $message, $options, 0)

  switch ($result)
      {
          0 {"You wish for files to be deleted."}
          1 {"Files will not be deleted" ; return}
      }
#varible that specifies how old the deleted files are
  $countdown = Read-Host "How many days old do you want the files to be before being deleted?"
#subtracts the varible above from the current date
  $days = (Get-Date).AddDays(-$countdown)
  $validpath = Test-Path -path $path
#if the specified path is a real path the if statement will complete
  if ($validpath -eq $true) {
    Write-Host "$path is a valid path"
    Get-ChildItem -Path $path -Recurse | Where-Object { $_.CreationTime -lt $days } | Remove-Item -Recurse
    Write-Host "Files older than $days have now been deleted"
}
#if path is not a real path this else statement will complete
  else {Write-Host "$path is not a valid path. Ensure correct path is specified"}
}
removefiles
