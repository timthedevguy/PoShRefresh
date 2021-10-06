break
# -----------------------------------------------------------------------------
# Running code in the editor
# -----------------------------------------------------------------------------

# To run a single line:     Place cursor on a line and press F8
# To run multiple lines:    Highlight lines completely and press F8
# To view variable value:   Highlight variable (including $) and press F8
# To run entire script:     Press F5





# -----------------------------------------------------------------------------
# Auto-Completion
# -----------------------------------------------------------------------------
# Tab Auto Completion works in both Visual Studio Code and the PowerShell
# terminal window.

# Start typing a Cmdlet name, press [TAB] to see possible completions
# Press [CTRL]+[SPACE] for an interactive list of possible completions

# Start typing a '-' when adding Parameters, press [TAB] to get possible Params
# Press [CTRL]+[SPACE] for an interactive list of possible parameters





# -----------------------------------------------------------------------------
# PowerShell Session
# -----------------------------------------------------------------------------

# Created variables, functions and loaded Modules will persist for the life of
# the PowerShell window (or session).  Closing the window destroys the session
# and all variables/functions created.

# This means if you define a variable $test and come back to the same window
# 4 hours later, $test is still a valid variable.

# If you define a function you can use that function for the duration of that
# session. Test by highlighting the function on lines 97-99 and hitting F8, 
# after doing so you can freely type Get-Name in terminal to execute the function.
# If you change the function code you will need to highlight the function and F8
# again to pick up new code.





# -----------------------------------------------------------------------------
# (), {}, [] Oh MY!
# -----------------------------------------------------------------------------
# This is a quick and dirty guide on when to use what (), {}, or [].

# () - Tells PowerShell to evaluate the contents NOW!  Do not wait, do not pass
#      go, evaluate and return NOW!

(Get-Date).Month # <-- Powershell first evals Get-Date to an object, then accesses
                 #     the Month property of that object.

Write-Host "The current month is $((Get-Date).Month)"  # <-- Powershell first evals Get-Date,
                                                       #     then accesses the Month property and
                                                       #     then injects Month to the string.

Get-Date.Month  # <-- Fails because Get-Date is a commandlet, Get-Date.Month is not.  Since there
                #     are no () PowerShell doesn't know to evaluate Get-Date first then .Month

# {} - Contains code blocks, these code blocks get evaluated on their normal turn 
#      within the script

if($true) {
    Write-Host "True Script Block has ran"
} else {
    Write-Host "False Script Block has ran"
}

# [] - Used to retrieve elements from arrays or hashtables, used for Type Casting and
#      designation of optional params/attributes

$colors = "Red", "Green", "Blue"  # <-- List of three items
$colors[0]  # <-- 0 index, counting starts at 0, so 0 == First Item in array





# -----------------------------------------------------------------------------
# Powershell Functions, Cmdlets, Modules
# -----------------------------------------------------------------------------
# All are similar but serve different purposes

# Functions - Repeatable block of code that serves a singular purpose that can 
#             be re-used over and over again

function Get-Name {
    Read-Host -Prompt "What is your name?"
}

$name = Get-Name
Write-Host "The provided name was: $($name)"

# Cmdlets - Full fledged commands that can be individual scripts or compiled code
#           from Microsoft.  These offer advanced behavior, but this behavior can
#           be added to Functions to make a Function work just like a Cmdlet.

# Modules - Are a collection of Functions/Cmdlets generally geared towards a specific
#           purpose or resource such as Active Directory.

#           As of PowerShell 3.0 unloaded module cmdlets will show up in auto-completion
#           and will auto 'Import-Module' when first used.  For example, using Get-ADUser
#           on a DC will auto import the 'ActiveDirectory' PowerShell module to interact
#           with AD.




# -----------------------------------------------------------------------------
# Powershell Pipeline
# -----------------------------------------------------------------------------
# Think of the PowerShell pipeline as an assembly line.  Each step on the line
# does something to the product on the line.  At the end of the line the product
# is in it's final form.

Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object Name -ExpandProperty Name | Sort-Object -Descending
#----------   --------------------------------------   ---------------------------------------   -----------------------
#    1                          2                                          3                                4

# How this works
# 1 -> Gets a list of all services on the computer, includes properties such as
#      Name, Status, DisplayName, etc etc.
# 2 -> Where-Object tells PowerShell to only pick items in the list that have
#      a Status property with the value of Stopped
# 3 -> Select-Object tells PowerShell we only want to return the Name property
#      of each item (We don't want all the extra Properties)
# 4 -> Final step is we use Sort-Object to sort the names Descending (Z -> A)

# To test this your self and see the progression
# Highlight 'Get-Service' and press F8
# Highlight 'Get-Service | Where-Object {$_.Status -eq "Stopped"}' and press F8
# Highlight 'Get-Service | Where-Object {$_.Status -eq "Stopped"} | Select-Object Name -ExpandProperty Name' and press F8

# You will see the data change with each move down the Pipeline

# You will see this called piping, pipeline, etc. And coincidently it uses the '|' pipe character.