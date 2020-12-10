cls
$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\7"
$Path = ".\input.txt"
$lines= Get-Content -Path $Path

$accCount=0
$checkline=0
$currentLine=0
$loop=0
$value=0
$allreadycheck= @()

While ( $allreadycheck.Contains($currentLine) -ne $True )
{
    $plusmin=$lines[$currentLine].substring(4,1) # + of -
    $value=$lines[$currentLine].substring(5,$lines[$currentLine].Length-5) # waarde + of -
    $checkline=$lines[$currentLine].substring(0,3) # acc / jmp / nop
    $allreadycheck+=$currentLine
    
    write-host $plusmin $value $checkline
    
    If ($checkline -eq "acc")
    {
        If ($plusmin -eq "+")
        {
            [decimal]$accCount+=$value
            [decimal]$currentLine+=1
        }
        else
        {
            $accCount-=$value
            [decimal]$currentLine+=1
        }
    }

    if ($checkline -eq "jmp")
    {
        If ($plusmin -eq "+")
        {
            [decimal]$currentLine+=$value
        }
        else
        {
            [decimal]$currentLine-=$value
        }
    }

    if ($checkline -eq "nop")
    {
        [decimal]$currentLine+=1
    }
    
    $currentLine=$currentLine.ToString()
    Write-host "Current line:" $currentLine
    #Write-host $allreadycheck
}


Write-Host "Count  :" $accCount -ForegroundColor Yellow
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds