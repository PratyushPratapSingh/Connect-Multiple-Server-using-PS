# ==========================
cmdkey /list | ForEach-Object{if($_ -like "*target=TERMSRV/*"){cmdkey /del:($_ -replace " ","" -replace "Target:","")}}
clear

$user = "sitech\administrator"
$serverPassword = Read-Host -AsSecureString "Enter Server Password"
$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($serverPassword)
$value = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)


do {
    $server = Read-Host "Enter Remote Server Name"
    
    if ($server) {
    cmdkey /generic:TERMSRV/$server /user:$user /pass:$value
    mstsc /v:$server /w:800 /h:600
} else {
    cmdkey /list | ForEach-Object{if($_ -like "*target=TERMSRV/*"){cmdkey /del:($_ -replace " ","" -replace "Target:","")}}
}

} until ($server -eq '')
# ==========================
Credssp encryption oracle remediation
# ==========================
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters\ /v AllowEncryptionOracle /t REG_DWORD /d 2
# ==========================
