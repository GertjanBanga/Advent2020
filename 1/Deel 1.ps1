$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\1"
$Path     = ".\input.csv"
$numbers  = Import-Csv -Path $Path
$numbers2 = $numbers

foreach ( $number in $numbers.numbers )
{
    foreach ( $number2 in $numbers2.numbers )
    {
        $total = [int]$number + [int]$number2
        If ( $total -eq 2020 )
        {
            Write-Host $number "+" $number2 "   =" $total
            Write-Host $number "*" $number2 "   = " -NoNewline
            Write-Host ( [int]$number*[int]$number2 ) -ForegroundColor Yellow
            Write-Host "Runtime in ms=" $stopwatch.ElapsedMilliseconds
            Exit
        }
    }    
}
