$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
#cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\1"
$Path     = ".\input.csv"
$numbers  = Import-Csv -Path $Path
$numbers2 = $numbers
$numbers3 = $numbers

foreach ( $number in $numbers.numbers )
{
    foreach ( $number2 in $numbers2.numbers )
    {
        $som=[int]$number + [int]$number2
        If ( $som -le 2020 )
        {
            foreach ( $number3 in $numbers3.numbers )
            {
                $total = [int]$number + [int]$number2 + [int]$number3
                If ( $total -eq 2020 )
                {
                    Write-Host $number "+" $number2 "+" $number3 "=" $total
                    Write-Host $number "*" $number2 "*" $number3 "= " -NoNewline
                    Write-Host ( [int]$number*[int]$number2*[int]$number3 ) -ForegroundColor Yellow
                    Write-Host "Runtime in ms    =" $stopwatch.ElapsedMilliseconds
                    Exit
                }
            }
         }
    }    
}

