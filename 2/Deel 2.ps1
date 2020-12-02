$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\2"
$Path     = ".\input.csv"
$lines  = Import-Csv -Path $Path
$counterok=0
$counternok=0

foreach ( $line in $lines )
{
    $check=0
    $min=$line.min
    $max=$line.max
    $character=$line.character
    $password=$line.password
    If ($password.Substring($min-1,1) -eq $character) {$check+=1}
    If ($password.Substring($max-1,1) -eq $character) {$check+=1}
    If ($check -eq 1) {$counterok+=1} else {$counternok+=1}
}

Write-Host "OK :" $counterok -ForegroundColor Yellow
Write-Host "NOK:" $counternok
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds