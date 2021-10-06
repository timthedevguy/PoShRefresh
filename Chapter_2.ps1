break
# -----------------------------------------------------------------------------
# Getting Help!!???
# -----------------------------------------------------------------------------
# There are many ways to get help in PowerShell.  Get-Help and
# Get-Command are built in and can be very useful.
#
# Don't discount doing a google search for a Cmdlet, the online Microsoft
# docs are very detailed.  Be aware the default will be PowerShell 7.x
# and your servers/workstations are probably only PowerShell 5.1

# Lookup a Cmdlets details
Get-Help -Name Start-Transcript

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.1
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Using Get-Help, look up Start-Transcript and determine what Params are required.

#> [TIP]: Default display will not show detailed information, Get-Help has a
#>        few Params that change the display such as: -Examples, -Parameter, -Full and
#>        -Detailed.


# Find Cmdlets to use
Get-Command -Name "*EventLog"  # <-- Shows all Cmdlets that end in "EventLog"

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.2
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Using Get-Command, look up all Transcript related commands

#> [TIP]: You know one of them already on line #12


# Microsofts Online documentation provides even more details, this can be found
# via a Google Search or by using the Get-Help -Online param

Get-Help -Name Get-ChildItem -Online

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.3
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Using Get-Help -Online or Internet Search find out what Start-Transcript, and
#> Stop-Transcript do.  Try using them by adding them to the code block below
#> and see what happens

Write-Host "I'm starting the code now"
(0..10) | ForEach-Object {
    Write-Host "Working on item #$($_)"
}
Write-Host "Ok, I'm all done!"




# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_variables?view=powershell-5.1

# Variables are little peices of memory that hold information.  The information
# in the variable can be anything from a String to an Array.

# You create variables by starting a word with '$'  At the time of creation
# the variable contains nothing.  The variable is an empty bucket awaiting an
# item or items to be put in it.

# Powershell is not a strong typed language, this means a variable called $name 
# doesn't have to be a String, it could be a number, or an array of names.

# PowerShell reserves some variable names for it's own use, these can be found online at
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-5.1

# Variables are NOT case sensitive

$name = "Tim Davis"
$name
$NAME
$NaMe
$Name

# [IMPORTANT]: EVERYTHING in PowerShell is an Object.  Objects are a collection
#              of Properties and Methods that define what the thing is and can
#              do.  Objects are generally self contained.

#              For Example:  A pencil could be represented as an Object in PowerShell
#              A pencil has a lead color, width, height, wood color, etc.  These
#              things that describe the pencil are called 'Properties'.  Properties
#              can be accessed to retreive details about the pencil.  A pencil also
#              can Write, Erase and Roll off the table.  These are things the pencil
#              can either do or have done to it.  These would be 'Methods'.  Methods
#              are called when you want the pencil to perform that action.

#              Properties and Methods are accessed via '.'.

$name.ToUpper()  # <-- ToUpper() is a Method of System.String 

# [HINT]: Google System.String, the resulting link is for C# but since PowerShell
#         was written with C# the Data Type is identical.  You can use the doc
#         as a reference for Properties and Methods




# -----------------------------------------------------------------------------
# What is it???!?!?
# -----------------------------------------------------------------------------
# Often times when we work with a variable we don't know exactly what that
# variable holds.  If we get a result from a Cmdlet for example.  You can use
# the help pages to determine what Data Type a Cmdlet returns or you can use the
# GetType() property.

$name = "Tim Davis"
$name.GetType()  # <-- Shows that this is a 'String' (Look at Name)

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.4
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

$event = Get-EventLog -LogName Application -Newest 1
$service = (Get-Service)[0]
$folder = (Get-ChildItem -Path "C:\")[0]
$file = (Get-ChildItem -Path "$($env:USERPROFILE)\Downloads" -File)[0]

#> Run lines 124-127.  Using the GetType method determine what DataType each
#> item is.





# -----------------------------------------------------------------------------
# Strings
# -----------------------------------------------------------------------------
# Strings are representation of Text, there are two types of strings

# Expandable Strings = These strings can contain PowerShell code with the use
#                      of $().  Any PowerShell code found gets evaluated.
#                      Expandable strings are wrapped in ""

# Literal Strings = These strings are what you see is what you get.  These are
#                   interpreted by PowerShell exactly as typed.  No code is
#                   evaluated.  Literal strings are wrapped in ''

# Expandable strings are the most common way of creating a string in PowerShell
# Run the following code for an example.

$name = "Tim Davis"

Write-Host "A) Hello, my name is $($name)"
Write-Host 'B) Hello, my name is $($name)'
Write-Host "C) Hello, my name is $name"

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.5
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Run the code on lines 152-156, determine if line A, B and C are Expandable or
#> Literal.  How do you know?  What did you witness?




# The ability to concentate strings is very important in PowerShell, you will do this
# many many times over your career.

# Adding two strings together
$string1 = "My name "
$string2 = "is Tim"
$string3 = $string1 + $string2
$string3

# Combining two strings using expandable string
$string3 = "$($string1)$($string2)"
$string3

# Create string by inserting another string
$string3 = "My name $($string2)"
$string3

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.6
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

$string1 = "over the"
$string2 = "The quick brown"
$string3 = "lazy dog"
$string4 = "fox jumps"

#> Run lines 189-192.  Create a new string called string5, this string should be a combination of 
#> string1 through 4 to create the sentance "The quick brown fox jumps over lazy dog"

#> [DID YOU KNOW?]: "The quick brown fox jumps over lazy dog" is an english-language pangram, 
#>                  a sentence that contains all of the letters in the english alphabet.


# Remember, variables can hold the result of Cmdlets

$result = Get-EventLog -LogName Application -Newest 1

# Result now contains the newest event from the Application Log

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.7
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Prompt a user for their First name, then prompt them for their Last name and
#> finally write a string to the console that says "Hello FirstName LastName"

#> [TIP]: Use Read-Host and Write-Host, look up these commands if unsure




# -----------------------------------------------------------------------------
# Arrays
# -----------------------------------------------------------------------------
# Arrays are simply a variable that holds a collection of objects.  The variable or 'bucket'
# now contains more than 1 object.  This means you now have to pick which object
# you wish to work with.

$colors = "Red", "Green", "Blue"  # <-- $colors now contains 3 Strings

# Determine number of items in the Array

$colors.Count

# Working with one item requires you to use [] to designate the index of the item
# in the collection.  [NOTE]: In PowerShell arrays counting starts at 0.  So if you
# have three items in the array and you want to access item #3 then you start counting
# at 0.  Example: 1st Item = 0, 2nd Item = 1 and 3rd Item = 2.  

$colors[0]  # <-- Access first item
$colors[2]  # <-- Access last item
$colors[$colors.Count -1]  # <-- Access last item dynamicly

# Adding items to arrays is done via '+='

$colors += "Yellow"
$colors

# Removing items from arrays is a bit more complicated and has to be done by recreating 
# the array

$colors = $colors | Where-Object {$_ -ne "Yellow"}   # <-- Creates a new array with all 
                                                     #     except for Yellow.
$colors


#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.8
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Prompt the user 4 times for the name of their favorite drink, food, flavor,
#> cereal, car, etc.  You pick.  The code should store the responses in an array.
#> Once done prompting 4 times, show the array to the user and ask them for a name
#> to remove.  Remove this item and show the final array to the user.

#> [TIP]: Use Read-Host and Write-Host as well as the Array operations learned
#>        above.




# -----------------------------------------------------------------------------
# Hash Tables
# -----------------------------------------------------------------------------
# Where arrays are a random collection of objects accessed via a position index,
# HashTalbes are more organized and can be accessed via a specific key.  This
# allows you to access an item over and over again via a known 'key' or identifier

# Creating a hashtable
$person = @{
    FirstName = "Tim"
    LastName = "Davis"
    Age = 41
    Location = "USA"
    Employer = "Truesec, Inc"
}

# The resulting items in the hashtable can be accessed via their key using . notation
# [] notation.

$person.FirstName       # <-- . Notation, much like accessing a Property
$person["FirstName"]    # <-- [] Notation, much like accessing an array but using a key
                        #     instead of a numerical index.

# Adding item to hashtable

$person.MiddleName = "Israel"
$person["MiddleName"] = "Israel"

# You can now access the new data just like the old

$person.MiddleName
$person["MiddleName"]

# Remove item in hashtable

$person.Remove("MiddleName")


#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.9
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Create a hashtable representing your address card at your company.  This should
#> contain information such as Name, Phone, Email and Manager.

#> [BONUS]: Don't hard code this information, instead use Read-Host and prompt the
#>          user for each piece of information to create the Hashtable and display 
#>          the hashtable when completed.


# Turning Hashtables in to PSCustomObjects
#------------------------------------------------------------------------------
# Hashtables will most likely be the most used data structure you use, it's quick
# it's easy to create and manipulate but it has one drawback that we haven't talked
# about.  A hashtable is not easily exported to a portable data type.

# When I say exportable I'm talking about the ability to export the data and then
# hand it to someone else on your team to do something with.  Hashtables are terrible
# for this.

# The most common export format is CSV and this is done via the Export-CSV and Import-CSV
# cmdlets.

$person | Export-Csv -Path .\person.csv  -NoTypeInformation # <-- Export to person.csv

# Run line 332 and then open person.csv.  Do you see any of my details in this file?
# No, you don't, so we didn't really export any usable data.

# To facilitate this operation we can convert the hashtable to a PSCustomObject which lets
# us use it in more advanced ways as well as making it much easier to export.

$personObj = New-Object -TypeName PSObject -Property $person
$personObj

# Run lines 340 to 341.  Notice the format on screen changes as well.

$person.GetType()
$personObj.GetType()

# Notice the type information changed.

# Now that we have a PSObject we can easily export the new object

$personObj | Export-Csv -Path .\personObj.csv -NoTypeInformation

# The resulting csv is an accurate respresentation of the data we wanted to store

$loadedPerson = Import-Csv -Path .\personObj.csv
$personObj
$loadedPerson

# Run lines 356 to 358 and look for differences....none right?  You successfully
# exported an object and then imported it for use again and again.

$personObj.GetType()
$loadedPerson.GetType()

# Run the above two lines, notice the type names are the same, you are dealing
# with the same type of object but one was loaded from a file that you could've
# received from someone else on your team.


#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.10
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Pick a couple coworkers on your team and create hashtable info cards for them
#> just like you did for yourself in Exercise 2.9.  Convert each hashtable to a
#> PSObject and store them in an Array.  Finally, export them to a CSV file.

#> [HINT]: Use Export-CSV to save the array to a csv file just like on line #349




# -----------------------------------------------------------------------------
# DateTime Objects
# -----------------------------------------------------------------------------
# Dates and Time are another one of the objects you will most likely work with
# on a daily basis.  THis could be checking how long ago a machine was patched
# to how many times it has rebooted in the last 7 days.

Get-Date  # <-- Always returns the date and time for right NOW

# The default view of Get-Date is a nicely formatted string, use '| Format-List'
# for a more detailed view

Get-Date | Format-List

# In this view you can see multiple properties that make up the date, for example
# Day, DayOfWeek, DayOfYear, etc.  You can acccess these properties to get details
# of the date.

(Get-Date).Month  # <-- Remember, PowerShell evaluates Get-Date first, then allows
                  #     us to access the Month property

# Is the same as

$now = Get-Date
$now.Month

# Adding or Subtracting Days/Minutes/Hours

$now.AddDays(5)     # <-- Adds 5 days to the date stored in $now
$now.AddDays(-5)    # <-- Subtracts 5 days from the date stored in $now
$now.AddMonths(1)   # <-- Adds 1 month to the date stored in $now
$now.AddMonths(-1)  # <-- Subtracts 1 month from the date stored in $now

# [TIP]: Adding or Removing days will also change months if you add/remove
#        enough days.

# The code on line 412 to 415 does not change the date, it just returns a
# new date that has been modified.  To persist these changes you can assign
# it to a new or same variable

$then = $now.AddDays(5)
$now = $now.AddDays(5)

# Comparing Dates is done just like comparing strings and integers

if((Get-Date) -gt $now) {
    Write-Host "The current date time is greater than $($now)"
} else {
    Write-Host "The current date time is less than $($now)"
}


#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 2.11
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#> Create a variable for $today and store a DateTime within it.  Using AddDays
#> and AddMonths make a new Date that is 12/25 (Christmas) or a Holiday of your
#> choosing.





# -----------------------------------------------------------------------------
# What is in an Object?
# -----------------------------------------------------------------------------
# As I've shown examples I've been accessing Properties and Methods using '.'
# but I haven't yet explained HOW I know to do that, or HOW I know what is in
# the objects we are working with.

# The command to remember here is 'Get-Member'.  Using the PowerShell pipeline
# we can pipe any object to it and it will display all Properties and Methods
# to us.

$now | Get-Member

# Review the list, notice that it even shows us 'Method' for methods and 
# 'NoteProperty' and 'Property' for Properties.  The line shows us some
# important information.  For example:

# Month                Property       int Month {get;}
#                      --------       ---       ------
# This shows us that Month is a property of $now.  So now we know that 
# $now.Month is a thing.  We can also see that accessing .Month will return
# and 'int' and that the property is ReadOnly ('{get;}').  If the property
# was read and write it would say '{get; set;}'

# This can be done to any object, even those not a variable

"Tim Davis" | Get-Member




# -----------------------------------------------------------------------------
# Type Casting
# -----------------------------------------------------------------------------
# Since Powershell is a non-typed language you can store and int and a string in
# the same variable and PowerShell will let you

$test = "Tim"
$test
$test = 19
$test

# Sometimes you may want to force PowerShell to adhere to a specific type, you can
# do this with a hard cast (This is very rare)

[String]$test = "Tim"
$test = 19
$test = Get-Date

# Did the above three lines of code work?  They did!  But 19 and Get-Date aren't strings?!?!
# This is because both 19 and Get-Date have a special method called .ToString() that helps
# PowerShell convert the object to a string representation.

$now = Get-Date
[String]$test = Get-Date

$now.GetType()
$test.GetType()

# Notice that $test is still a String even though you assigned a Date to it
# Hard Casting is more noticable with Integers

[Int]$test = 19
$test = "19"
$test = "Test"
$test = Get-Date

# Notice that "19" works and "Test" and Get-Date do not.  Int has a Parse() method which
# PowerShell uses to convert a string number to a real number.  "Test" and Get-Date fail
# since they have no way of converting to just a number.

[System.Diagnostics.EventLogEntry]$entry = Get-EventLog -LogName Application -Newest 1
$entry.EventID

$entry = "Test" # <-- This errors out

# It's not recommended to Hard Cast unless you absolutely need to, many Cmdlets can
# return either 1 object or 1000 objects.  If you have it Casted then you are expecting
# EventLogEntry (in example above) but the code may return a Collection

[System.Diagnostics.EventLogEntry]$entry = Get-EventLog -LogName Application -Newest 5

# This code fails because you are trying to return 5 entries, and the Hard Cast says 
# you are expecting only one.

[System.Collections.Generic.List[System.Diagnostics.EventLogEntry]]$entries = Get-EventLog -LogName Application -Newest 5

# The line above works but PowerShell was designed so you wouldn't have to do this.