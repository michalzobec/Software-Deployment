Write-Log "ZOBEC Remover for Google Chrome"
Write-Log " version 20.08.03.203059"

if($Chrome32bitKey = Get-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome" -name "Version" -ErrorAction "SilentlyContinue"){
	Write-Log "Google Chrome 32-bit version was found"
	if($Chrome32bitVersion = $Chrome32bitKey.Version){
		Write-Log "Google Chrome 32-bit detected version: '$Chrome32bitVersion'"
		Write-Log "Google Chrome 32-bit setup full path: '${env:ProgramFiles}\Google\Chrome\Application\$Chrome32bitVersion\Installer\setup.exe'"
		& "${env:ProgramFiles}\Google\Chrome\Application\$Chrome32bitVersion\Installer\setup.exe" --uninstall --multi-install --chrome --system-level --force-uninstall
	} else {
		Write-Log "Google Chrome 32-bit version was not found"
	}
}
if($Chrome64bitKey = Get-ItemProperty -path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Google Chrome" -name "Version" -ErrorAction "SilentlyContinue"){
	Write-Log "Google Chrome 64-bit version was found"
	if ($Chrome64bitVersion = $Chrome64bitKey.Version){
		Write-Log "Google Chrome 64-bit detected version: '$Chrome64bitVersion'"
		Write-Log "Google Chrome 64-bit setup full path: '${env:ProgramFiles(x86)}\Google\Chrome\Application\$Chrome64bitVersion\Installer\setup.exe'"
		& "${env:ProgramFiles(x86)}\Google\Chrome\Application\$Chrome64bitVersion\Installer\setup.exe" --uninstall --multi-install --chrome --system-level --force-uninstall
	} else {
		Write-Log "Google Chrome 64-bit version was found"
	}
}