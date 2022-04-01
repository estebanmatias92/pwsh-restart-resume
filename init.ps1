# The script will execute step A through C, only when done with step A, it will reboot, and then continue at step B. Below are two screenshots showing what to expect:

param($Step="A")
# -------------------------------------
# Imports
# -------------------------------------
$Script = $MyInvocation.MyCommand.Definition
. $PSScriptRoot\helpers\functions.ps1

Clear-Any-Restart

if (Start-Step "A") 
{
    Write-Host "A"
    Restart-And-Resume -Script $script -Step "B"
}

if (Start-Step "B") 
{
    Write-Host "B"
}

if (Start-Step "C") 
{
    Write-Host "C"
}

Read-Host -Prompt "Test script Complete, press any key to exit script..."