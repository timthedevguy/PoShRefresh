# Using the concepts you've learned in Chapters 1 through 4 write a
# contact card manager.

# Script should prompt user if they want to view contact data or 
# create contact data.

# Data is stored in a CSV 'database' (Tip: This uses the Export-CSV
# and Import-CSV commands, see example below)

# Viewing data should allow user to see all contacts or search for
# a single one

# Creating data should prompt the user for the following data
# repeatedly until user declines to add another, 
# and then store with the other users in the CSV 'database'

# Name, Manager, Office Extension (or phone number), Email

# The system will be an interactive script just for the purposes of
# practice, later we can move the features to individual scripts

# This practice will utilize Creating Variables, Reading from Host Input,
# Working with Collections/Hashtables, Creating Objects from Hashtables,
# Reading and Writing CSV files, Displaying data to the screen, and Looping



# Write data to CSV 'database' Sample
$results = New-Object -TypeName System.Collections.Generic.List[PSObject]

$user1 = @{
    Name = "Tim Davis"
    Age = "41"
}

$user2 = @{
    Name = "Jennifer Davis"
    Age = "42"
}

$obj = New-Object -TypeName PSObject -Property $user1

$results.Add($obj)

$obj = New-Object -TypeName PSObject -Property $user2

$results.Add($obj)

$results | Export-Csv ".\data.csv" -NoTypeInformation



# Read data from CSV 'database' Sample
$users = Import-Csv ".\data.csv"

$users | Format-Table