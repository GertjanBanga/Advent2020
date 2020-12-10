cls
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\10"
$Path = ".\input.txt"
$input= Get-Content -Path $Path

$array=@()
$eenverschil=0
$drieverschil=0
$vorigekabel=1

Foreach ($regel in $input)
{
    $array+=[decimal]$regel
}

$output=($array | sort)

Foreach ($kabel in $output)
{
    Write-host $kabel $vorigekabel
    If (($kabel - $vorigekabel) -eq 1) {$eenverschil+=1} else {if (($kabel - $vorigekabel) -eq 3) {$drieverschil+=1}}
    $vorigekabel=$kabel
}

$eenverschil+=1
$drieverschil+=1
$eenverschil*$drieverschil