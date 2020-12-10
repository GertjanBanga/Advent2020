# 252 to low, 282 to high)
cls
$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
cd "C:\Users\gertjanb\OneDrive - Delta-N\Documents\Advent\4"
$Path = ".\input.txt"
$lines= Get-Content -Path $Path

$validcount=0
$linetocheck=""

foreach ( $line in $lines )
{
    If ($line -ne "")
    {
        $linetocheck=$linetocheck+" "+$line
    }
    else
    {
        $byrstart=($linetocheck | Select-String "byr:").Matches.Index
        $byrend=($linetocheck.substring($byrstart,$linetocheck.length-$byrstart) | Select-String " ").Matches.Index
        $byrvalue=$linetocheck.substring($byrstart+4,4)
        if (($byrvalue -ge 1920) -and ($byrvalue -le 2002))
        {
            $byrok="OK"
            #write-host "byr:" $byrok $byrvalue
        }
        
        $iyrstart=($linetocheck | Select-String "iyr:").Matches.Index
        $iyrend=($linetocheck.substring($iyrstart,$linetocheck.length-$iyrstart) | Select-String " ").Matches.Index
        $iyrvalue=$linetocheck.substring($iyrstart+4,4)
        if (($iyrvalue -ge 2010) -and ($iyrvalue -le 2020))
        {
            $iyrok="OK"
            #write-host "iyr:" $iyrok $iyrvalue
        }
                
        $eyrstart=($linetocheck | Select-String "eyr:").Matches.Index
        $eyrend=($linetocheck.substring($eyrstart,$linetocheck.length-$eyrstart) | Select-String " ").Matches.Index
        $eyrvalue=$linetocheck.substring($eyrstart+4,4)
        if (($eyrvalue -ge 2020) -and ($eyrvalue -le 2030))
        {
            $eyrok="OK"
            #write-host "eyr:" $eyrok $eyrvalue
        }
        
        $hgtstart=($linetocheck | Select-String "hgt:").Matches.Index
        $hgtend=($linetocheck.substring($hgtstart,$linetocheck.length-$hgtstart) | Select-String " ").Matches.Index
        $hgtvalue=$linetocheck.substring($hgtstart+4,$hgtend-6)
        $hgtcmin=$linetocheck.substring($hgtstart+4+($hgtvalue.length),2)
        if ($hgtcmin -eq "cm")
        {
            If (($hgtvalue -ge 150) -and ($hgtvalue -le 193))
            {
                $hgtok="OK"
                #Write-Host "hgt:" $hgtok $hgtvalue $hgtcmin
            }            
        }
        else
        {
            If (($hgtvalue -ge 59) -and ($hgtvalue -le 76))
            {
                $hgtok="OK"
            }
        }
        
        $hclstart=($linetocheck | Select-String "hcl:").Matches.Index
        $hclend=($linetocheck.substring($hclstart,$linetocheck.length-$hclstart) | Select-String " ").Matches.Index
        $hclvalue=$linetocheck.substring($hclstart+4,7)
        $hclcheck=$hclvalue | Select-String -Pattern "#[0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f]"
        if ($hclcheck -ne "")
        {
            $hclok="OK"
            #write-host "hcl:" $hclok $hclvalue
        }
        
        $eclstart=($linetocheck | Select-String "ecl:").Matches.Index
        $eclend=($linetocheck.substring($eclstart,$linetocheck.length-$eclstart) | Select-String " ").Matches.Index
        $eclvalue=$linetocheck.substring($eclstart+4,$eclend-4)
        if (($eclvalue -eq "amb") -or ($eclvalue -eq "blu") -or ($eclvalue -eq "brn") -or ($eclvalue -eq "gry") -or ($eclvalue -eq "grn") -or ($eclvalue -eq "hzl") -or ($eclvalue -eq "oth"))
        {
            $eclok="OK"
            #write-host "ecl:" $eclok $eclvalue
        }
        
        $pidstart=($linetocheck | Select-String "pid:").Matches.Index
        $pidend=($linetocheck.substring($pidstart,$linetocheck.length-$pidstart) | Select-String " ").Matches.Index
        $pidvalue=$linetocheck.substring($pidstart+4,9)
        $pidcheck=$hclvalue | Select-String -Pattern "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
        if ($pidcheck -ne "")
        {
            $pidok="OK"
            #write-host "pid:" $pidok $pidvalue
        }

        If (($byrok -eq "OK") -and ($iyrok -eq "OK") -and ($eyrok -eq "OK") -and ($hgtok -eq "OK") -and ($hclok -eq "OK") -and ($eclok -eq "OK") -and ($pidok -eq "OK")) 
        {
            $validcount+=1
            write-host $byrvalue $iyrvalue $eyrvalue $hgtvalue $hgtcmin $hclvalue $eclvalue $pidvalue
        }
        pause
        $linetocheck=""
    } 
}

Write-Host "Valid  :" $validcount -ForegroundColor Yellow
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds