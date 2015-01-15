# This is a script to be used as a factor from Puppet
# Should return the Windows activation status
$Licenses = Get-WmiObject SoftwareLicensingProduct
$ReturnLicenseStatus = "undefined"

$LicenseStateOptions = @{
	"0" = "Unlicensed"
	"1" = "Licensed"
	"2" = "Out-Of-Box Grace Period"
	"3" = "Out-Of-Tolerance Grace Period"
	"4" = "Non-Genuine Grace Period"
	"5" = "Notification"
	"6" = "Extended Grace"
}	

ForEach ($License in $Licenses) {
	If (($License.Name -Match "Windows*") -and ($License.LicenseStatus -ne 0)) {
		If ($LicenseStateOptions.ContainsKey("$($License.LicenseStatus)")) { 
			$ReturnLicenseStatus = $LicenseStateOptions["$($License.LicenseStatus)"]
		}
		Else {Write-Error "Unexpected License State"}
		break
	}
	Else { $ReturnLicenseStatus = $LicenseStateOptions["0"] }
}

Write-Host ("licensestatus=" + $ReturnLicenseStatus)
