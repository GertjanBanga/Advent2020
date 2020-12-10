cls
$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\7"
$Path = ".\input.txt"
$lines= Get-Content -Path $Path

$linesorg=$lines

$accCount=0
$checkline=0
$currentLine=0
$value=0
$allreadycheck= @()
$lastline=$lines.count

While ($currentLine -ne $lastline)
{
    $plusmin=$lines[$currentLine].substring(4,1) # + of -
    $value=$lines[$currentLine].substring(5,$lines[$currentLine].Length-5) # waarde + of -
    $checkline=$lines[$currentLine].substring(0,3) # acc / jmp / nop
    $allreadycheck+=$currentLine
    
    Write-host "Orginele regel:" $lines[$currentline]
    If ($checkline -eq "nop")
    {
        $lines[$currentline]=$lines[$currentLine] -replace "nop","jmp"
    }    else    {
        If ($checkline -eq "jmp")
        {
            $lines[$currentline]=$lines[$currentLine] -replace "jmp","nop"
        }
    }
    Write-host "Nieuwe regel:" $lines[$currentLine]

    While ($allreadycheck.Contains($currentLine) -ne $True)
    {
      
    if ($checkline -eq "acc")
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
}
}

If ($lastline -eq $currentline) {Write-host "Laatste regel" -ForegroundColor Green} else {write-host "Niet laatste regel" -ForegroundColor Red}
Write-Host "Count  :" $accCount -ForegroundColor Yellow
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds