$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\3"
$Path     = ".\input.csv"
$lines  = Import-csv -Path $Path
$tree=0
$tree3=0
$tree5=0
$tree7=0
$tree21=0
$notree=0
$notree3=0
$notree5=0
$notree7=0
$notree21=0
$position=1
$position3=1
$position5=1
$position7=1
$position21=1
$width=[int](($lines.count * 32)+1)


foreach ( $line in $lines )
{
    $check=$line.Piste * $width

    $treenotree=$check.substring($position-1,1)
    If ($treenotree -eq ".") {$notree+=1} else {$tree+=1}
    $position+=1

    $treenotree3=$check.substring($position3-1,1)
    If ($treenotree3 -eq ".") {$notree3+=1} else {$tree3+=1}
    $position3+=3

    $treenotree5=$check.substring($position5-1,1)
    If ($treenotree5 -eq ".") {$notree5+=1} else {$tree5+=1}
    $position5+=5

    $treenotree7=$check.substring($position7-1,1)
    If ($treenotree7 -eq ".") {$notree7+=1} else {$tree7+=1}
    $position7+=7
}

Write-Host "Tree 1-1   :" $tree -ForegroundColor Yellow
Write-Host "No tree 1-1:" $notree
Write-Host "Tree 3-1   :" $tree3 -ForegroundColor Yellow
Write-Host "No tree 3-1:" $notree3
Write-Host "Tree 5-1   :" $tree5 -ForegroundColor Yellow
Write-Host "No tree 5-1:" $notree5
Write-Host "Tree 7-1   :" $tree7 -ForegroundColor Yellow
Write-Host "No tree 7-1:" $notree7


$counter=1
foreach ( $line in $lines )
{
    If ($counter %2 -eq 1)
    {
        $check=$line.Piste * $width
        $treenotree21=$check.substring($position21-1,1)
        If ($treenotree21 -eq ".") {$notree21+=1} else {$tree21+=1}
        $position21+=1
    }
    $counter+=1
}

Write-Host "Tree 2-1   :" $tree21 -ForegroundColor Yellow
Write-Host "No tree 2-1:" $notree21

$som=$tree*$tree3*$tree5*$tree7*$tree21

Write-Host "Answer:" $som -ForegroundColor Yellow
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds