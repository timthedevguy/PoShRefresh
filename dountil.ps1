Function Show-Message() {
    [CmdletBinding()]

    param(
        [String]$Message,
        [Int]$Repeat
    )

    # Create array containing 1 through 10 (10 objects)
    #$indexes = (1..$Repeat)
    $multiple_items = (4..($Repeat + 3))

    # for each item in the array, run Write-Host (Will run 10 times)
    foreach($single_item in $multiple_items) {
        Write-Host "$($Message) : Item Value: $($single_item)"
    }
}

Show-Message -Message "How are you today?" -Repeat 10