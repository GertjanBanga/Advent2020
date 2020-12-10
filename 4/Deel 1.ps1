cls
$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\4"
$Path = ".\input.txt"
$lines= Get-Content -Path $Path

$validcount=0
$invalidcount=0
$linetocheck=""

foreach ( $line in $lines )
{
    If ($line -ne "")
    {
        $linetocheck=$linetocheck+" "+$line
    }
    else
    {
        #If ($linetocheck -match $checkforregex)
        If (($linetocheck -match "byr:") -and ($linetocheck -match "iyr:") -and ($linetocheck -match "eyr:") -and ($linetocheck -match "hgt:") -and ($linetocheck -match "hcl:") -and ($linetocheck -match "ecl:") -and ($linetocheck -match "pid:"))
        {
            Write-Host $linetocheck "OK"
            $validcount+=1
        }
        else
        {
            Write-Host $linetocheck "NOK" -ForegroundColor Yellow
            $invalidcount+=1
        }
        $linetocheck=""
    } 
}

Write-Host "Valid  :" $validcount -ForegroundColor Yellow
Write-Host "Invalid:" $invalidcount
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds