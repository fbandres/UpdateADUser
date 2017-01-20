# Set value to businessCategory attribute to all target users inside the CSV file

Import-Module -Name ActiveDirectory

$ADUserList = Import-CSV C:\Users\Francis\Desktop\userlist.csv

$ADUserList | ForEach-Object {Get-ADUser -Filter "SamAccountName -eq `"$($_.SamAccountName)`"" | Set-ADUser -Add @{businessCategory="IT Department"}}


# Query all target users after adding value in businessCategory attribute

$ADUserList | ForEach-Object {Get-ADUser -Filter "SamAccountName -eq `"$($_.SamAccountName)`"" -Properties * | Select-Object Name, SamAccountName, @{N="BusinessCategory";E={$_ | Select-Object -ExpandProperty businessCategory}}}