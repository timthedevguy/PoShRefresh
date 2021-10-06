<#
.SYNOPSIS
    This does something cool

.DESCRIPTION
    DESCRIPTION

.LINK
    LINK

.NOTES
    FileName: Test-Script.ps1
    Author: Author
    Contact: TwitterHandle
    Created: 2021-10-06

    Version - 0.0.1 - 2021-10-06

    License Info:
    MIT License
    Copyright (c) 2021 TRUESEC

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.


.EXAMPLE

#>

[cmdletbinding()]
param(
    [Parameter(ParameterSetName = 'Default', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
    [String]$Message,
    [Int]$Age
)
begin{
    # Runs once on start
    Write-Host "Begin Block Executed"
}
process{
    # Runs for each object
    Write-Host "In Process Block with the Message of $($Message) and Age of $($Age)"
}
end{
    # Runs once on end
    Write-Host "End Block Executed"
}