#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.1 Q1 - Get Second Tuesday of this Month
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Function Get-SecondTuesday {

    # Grab first day of this month, starting point
    $target = Get-Date -Month (Get-Date).Month -Day 1

    # Loop until we find the first Tuesday
    while ($target.DayOfWeek -ne "Tuesday") {
        # Not Tuesday, so add 1 day
        $target = $target.AddDays(1)
    }

    # We are on first Tuesday, add 7 days to get to 
    # second Tuesday
    $target.AddDays(7)
}

Get-SecondTuesday

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.1 Q2 - Get Second Wednesday of this Month
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Function Get-SecondWednesday {

    # Grab first day of this month, starting point
    $target = Get-Date -Month (Get-Date).Month -Day 1

    # Loop until we find the first Wednesday
    while ($target.DayOfWeek -ne "Wednesday") {
        # Not Wednesday, so add 1 day
        $target = $target.AddDays(1)
    }

    # We are on first Wednesday, add 7 days to get to 
    # second Wednesday
    $target.AddDays(7)
}

Get-SecondWednesday

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.1 Q3 - Get File sizes
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

1KB
1MB
1GB
1TB

#> Option 1 - Using a file path
Function Get-FileSize($path) {
    #                 -----
    #                   ╰→ The naming choice can help users determine what
    #                       datatype you are expecting

    # We only have file path, get the actual file so we
    # can access the 'Length' property
    $file = Get-Item -Path $path

    Write-Host "File size:"
    Write-Host "   $($file.Length / 1KB) KB"
    Write-Host "   $($file.Length / 1MB) MB"
    Write-Host "   $($file.Length / 1GB) GB"
}

Get-FileSize (Get-ChildItem -Path "C:\Users\TimDavis\Downloads" -File | Sort-Object Length -Desc)[0].FullName

#> Option 2
Function Get-FileSize($file) {

    Write-Host "File size:"
    # Write-Host "   $([Math]::Round($file.Length / 1KB, 2)) KB"
    # Write-Host "   $([Math]::Round($file.Length / 1MB, 2)) MB"
    # Write-Host "   $([Math]::Round($file.Length / 1GB, 2)) GB"
    Write-Host "   $($file.Length / 1KB) KB"
    Write-Host "   $($file.Length / 1MB) MB"
    Write-Host "   $($file.Length / 1GB) GB"
}

Get-FileSize (Get-ChildItem -Path "C:\Users\TimDavis\Downloads" -File | Sort-Object Length -Desc)[0]

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.2 Q1 - Advanced Function with -Verbose
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Function Get-FileSize() {
    [CmdletBinding()]

    param(
        [String]$path
    )

    $file = Get-Item -Path $path

    # Let user know what file we are working with
    Write-Verbose -Message "Working with file: $($file.Name)"

    Write-Host "File size:"
    Write-Host "   $($file.Length / 1KB) KB"
    Write-Host "   $($file.Length / 1MB) MB"
    Write-Host "   $($file.Length / 1GB) GB"
}

Get-FileSize -Path (Get-ChildItem -Path "C:\Users\TimDavis\Downloads" -File | Sort-Object Length -Desc)[0].FullName -Verbose

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.2 Q2 - Advanced Function with -Debug
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Function Get-FileSize() {
    [CmdletBinding()]

    param(
        [String]$path
    )

    $file = Get-Item -Path $path

    # Show user what file we are working with, -Debug will ask the
    # user if they want to continue or not
    Write-Debug -Message "Working with file: $($file.Name)"

    Write-Host "File size:"
    Write-Host "   $($file.Length / 1KB) KB"
    Write-Host "   $($file.Length / 1MB) MB"
    Write-Host "   $($file.Length / 1GB) GB"
}

Get-FileSize -Path (Get-ChildItem -Path "C:\Users\TimDavis\Downloads" -File | Sort-Object Length -Desc)[0].FullName -Debug

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.3 Q1 - Advanced Function with 2 params
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Function Get-FileInfo() {
    [CmdletBinding()]

    param(
        [String]$Path,
        [String]$FileName
    )

    # Combine the Path and Filename to get the actual File
    $file = Get-Item -Path "$($Path)\$($FileName)"

    # Write out information to screen
    Write-Host "`n`n"  # <- `n inserts a New Line for readability
    Write-Host "File Name: $($FileName)"
    Write-Host "File Path: $($Path)"
    Write-Host "Full Path: $($file.FullName)"
    Write-Host "File was last modified on: $($file.LastWriteTime)"
    Write-Host "`n`n"
}

$testFile = (Get-ChildItem -Path "C:\Users\TimDavis\Downloads" -File | Sort-Object Length -Desc)[0]

Get-FileInfo -Path $testFile.Directory.FullName -FileName $testFile.Name

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.3 Q2 - Advanced Function with Repeating Message
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

# For Loop example
Function Show-Message() {
    [CmdletBinding()]

    param(
        [String]$Message,
        [Int]$Repeat
    )

    for($counter=1;$counter -le $Repeat;$counter++) {
        Write-Host $Message
    }
}

Show-Message -Message "How are you today?" -Repeat 10

# Do/While example
Function Show-Message() {
    [CmdletBinding()]

    param(
        [String]$Message,
        [Int]$Repeat
    )

    # Setup our counter
    $counter = 0

    # Enter the DO loop
    do {
        # Write message
        Write-Host $Message
        # Increment our counter
        $counter++
    # Keep looping while $counter is less than the Repeat param
    }while($counter -lt $Repeat)
}

Show-Message -Message "How are you today?" -Repeat 10

# Do/Until example
Function Show-Message() {
    [CmdletBinding()]

    param(
        [String]$Message,
        [Int]$Repeat
    )

    # Setup our counter
    $counter = 0

    # Enter the DO loop
    do {
        # Write message
        Write-Host $Message
        # Increment our counter
        $counter++
    # Keep looping while $counter is less than the Repeat param
    }until($counter -eq $Repeat)
}

Show-Message -Message "How are you today?" -Repeat 10

# While Loop
Function Show-Message() {
    [CmdletBinding()]

    param(
        [String]$Message,
        [Int]$Repeat
    )

    # Setup our counter
    $counter = 0

    # Enter the while loop and keep looping while
    # counter is less than Repeat param
    while($counter -lt $Repeat) {
        # Write message
        Write-Host $Message
        # Increment our counter
        $counter++
    }
}

Show-Message -Message "How are you today?" -Repeat 10

# foreach Loop
Function Show-Message() {
    [CmdletBinding()]

    param(
        [String]$Message,
        [Int]$Repeat
    )

    # Create array containing 1 through 10 (10 objects)
    $indexes = (1..$Repeat)

    # for each item in the array, run Write-Host (Will run 10 times)
    foreach($index in $indexes) {
        Write-Host $Message
    }
}

Show-Message -Message "How are you today?" -Repeat 10

# ForEach-Object Loop
Function Show-Message() {
    [CmdletBinding()]

    param(
        [String]$Message,
        [Int]$Repeat
    )

    # Create array of 1 through 10, pipe to ForEach-Object
    # Write-Host on each iteration
    (1..$Repeat) | ForEach-Object {
        Write-Host $Message
    }
}

Show-Message -Message "How are you today?" -Repeat 10

#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#> Exercise 6.5.3 Bonus - Param Sets
#> >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Function Get-Something {
    [CmdletBinding(DefaultParameterSetName = "Default")]

    param(
        [Parameter(Mandatory = $true)]
        [String]$Message,
        [Parameter(ParameterSetName = "Enforced")]
        [Switch]$Enforce,
        [Parameter(ParameterSetName = "Enforced", Mandatory = $true)]
        [String]$Level
    )

    if ($Enforce) {
        Write-Host "[$($Level)] - $($Message)"
    }
    else {
        Write-Host "[INFO] - $($Message)"
    }
}
