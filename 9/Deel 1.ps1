cls
$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\9"
$Path = ".\input.txt"
$array= Get-Content -Path $Path

$counter=0
$counterhoofd=0
$countercheck=25
$arrayA=@()
$arrayB=@()


While ($counter -le $array.count) # Hoofd loop van begin tot eind
{
    $checkarray=@($array[$counter])
    $checknumbr=$array[$countercheck]
    While ($counter -le $countereind)
    {
        $arrayA=$arrayA + $array[$counter]
        $counter+=1
    }
    $arrayB=$arrayA
    Write-host "Array A" -ForegroundColor Yellow
    $arrayA
    Write-host "Array B" -ForegroundColor Yellow
    $arrayB
    #Foreach ($A in $arrayA)
    #{
        #Write-Host "Foreach A"
    #    Foreach ($B in $arrayB)
     #   {
      #      #Write-Host "Foreach B"
       #     $som=$A+$B
        #    If ($som -eq $array[$countercheck]) {Write-host "Gevonden"}
        #}
    
    #$arrayA=@()
    #$arrayB=@()
    #$counter+=1
    #}
    $counterhoofd+=1
    pause
}

Pause

    While ($array[$counterA] -ne $array[$countercheck])
    {
        $som=[decimal]$array[$counterA]+[decimal]$array[$counterB]
        if ($counterA -ne $counterB)
        {       
            if ($som -eq $array[$countercheck]) {Write-Host "Gevonden 1 -- Getal" $counterA "=" $array[$counterA] "Getal" $counterB "=" $array[$counterB] "Getal A + Getal B =" $som "Getal moet zijn:" $array[$countercheck] -forgroundcolor -Yellow}
        }
        Write-Host "Niet gevonden -- Getal" $counterA "=" $array[$counterA] "Getal" $counterB "=" $array[$counterB] "Getal A + Getal B =" $som "Getal moet zijn:" $array[$countercheck]
        $counterA+=1
        While ($array[$counterA] -ne $array[$countercheck2])
        {
            if ($som -eq $array[$countercheck2]) {Write-Host "Gevonden 2 -- Getal" $counterA "=" $array[$counterA] "Getal" $counterB "=" $array[$counterB] "Getal A + Getal B =" $som "Getal moet zijn:" $array[$countercheck] -forgroundcolor -Yellow}
            Write-Host "Gevonden 2 -- Getal" $counterA "=" $array[$counterA] "Getal" $counterB "=" $array[$counterB] "Getal A + Getal B =" $som "Getal moet zijn:" $array[$countercheck] -ForegroundColor Yellow
            $counterB+=1
        }
    }
    $countercheck+=1
    pause
}

