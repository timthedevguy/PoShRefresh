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
    while($counter -le $Repeat) {
        # Write message
        Write-Host "$($counter) : $($Message)"
        # Increment our counter
        $counter++
    }
}

Show-Message -Message "How are you today?" -Repeat 10