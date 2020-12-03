$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\3"
$Path     = ".\input.csv"
$lines  = Import-csv -Path $Path
$tree=0
$notree=0
$position=1
$width=[int](($lines.count * 32)+1)


foreach ( $line in $lines )
{
    $check=$line.Piste * $width
    $treenotree=$check.substring($position-1,1)
    If ($treenotree -eq ".") {$notree+=1} else {$tree+=1}
    $position+=3
}

Write-Host "Tree   :" $tree -ForegroundColor Yellow
Write-Host "No tree:" $notree
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds