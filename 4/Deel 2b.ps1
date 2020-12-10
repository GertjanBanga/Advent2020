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
        # byr
        $splitline=$linetocheck -split " "
        Foreach ($item in $splitline)
        {
            $itemcheck=$item.contains("byr:")
            If ($itemcheck -eq $True)
            {
                $check=$item.substring(4,$item.length-4)
                if (($check -ge 1920) -and ($check -le 2002)) {$byrok="OK"}
            }
        }

        # iyr
        $splitline=$linetocheck -split " "
        Foreach ($item in $splitline)
        {
            $itemcheck=$item.contains("iyr:")
            If ($itemcheck -eq $True)
            {
                $check=$item.substring(4,$item.length-4)
                if (($check -ge 2010) -and ($check -le 2020)) {$iyrok="OK"}
            }
        }

        # eyr
        $splitline=$linetocheck -split " "
        Foreach ($item in $splitline)
        {
            $itemcheck=$item.contains("iyr:")
            If ($itemcheck -eq $True)
            {
                $check=$item.substring(4,$item.length-4)
                if (($check -ge 2020) -and ($check -le 2030)) {$eyrok="OK"}
            }
        }

        # hgt
        $splitline=$linetocheck -split " "
        Foreach ($item in $splitline)
        {
            $itemcheck=$item.contains("hgt:")
            If ($itemcheck -eq $True)
            {
                $checklength=$item.Substring(4,$item.length-4)
                if ($checklength -contains "cm")
                {
                    if (($checklength -ge 150) -and ($checklength -le 193)) {$hgtok="OK"}
                }
                if ($checklength -contains "in")
                {
                    if (($checklength -ge 59) -and ($checklength -le 76)) {$hgtok="OK"}
                }
            }
        }

        # hcl
        $splitline=$linetocheck -split " "
        Foreach ($item in $splitline)
        {
            $itemcheck=$item.contains("hcl:")
            If ($itemcheck -eq $True)
            {
                $check=$item.substring(4,$item.length-4)
                $hclcheck=$hclvalue | Select-String -Pattern "#[0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f][0-9,a-f]"
                if ($hclcheck -ne "" ) {$hclok="OK"}
            }
        }
        
        # ecl
        $splitline=$linetocheck -split " "
        Foreach ($item in $splitline)
        {
            $itemcheck=$item.contains("ecl:")
            If ($itemcheck -eq $True)
            {
                $check=$item.substring(4,$item.length-4)
                if (($eclvalue -eq "amb") -or ($eclvalue -eq "blu") -or ($eclvalue -eq "brn") -or ($eclvalue -eq "gry") -or ($eclvalue -eq "grn") -or ($eclvalue -eq "hzl") -or ($eclvalue -eq "oth")) {$eclok="OK"}
            }
        }     
        
        # pid
        $splitline=$linetocheck -split " "
        Foreach ($item in $splitline)
        {
            $itemcheck=$item.contains("pid:")
            If ($itemcheck -eq $True)
            {
                $check=$item.substring(4,$item.length-4)
                $pidcheck=$check | Select-String -Pattern "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
                if ($pidcheck -ne "") {$pidok="OK"}
            }
        }     
                       
        # Check all
        $splitline=$linetocheck -split " "
        If (($byrok -eq "OK") -and ($iyrok -eq "OK") -and ($eyrok -eq "OK") -and ($hgtok -eq "OK") -and ($hclok -eq "OK") -and ($eclok -eq "OK") -and ($pidok -eq "OK")) 
        {
            $validcount+=1
            write-host $byrok $iyrok $eyrok $hgtok $hgtok $hclok $eclok $pidok -ForegroundColor Yellow
            $byrok=""
            $iyrok=""
            $eyrok=""
            $hgtok=""
            $hclok=""
            $eclok=""
            $pidok=""
        }
        else
        {
            write-host $byrok $iyrok $eyrok $hgtok $hgtok $hclok $eclok $pidok -ForegroundColor Red
        }
        $linetocheck=""
    } 
}

Write-Host "Valid  :" $validcount -ForegroundColor Yellow
Write-Host "Runtime in ms:" $stopwatch.ElapsedMilliseconds