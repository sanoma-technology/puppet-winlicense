# This is a script to be used as a factor from Puppet
# Should return the remaining grace period in days
$Licenses = Get-WmiObject SoftwareLicensingProduct
$GracePeriodDays = 0.0

ForEach ($License in $Licenses) {
	If (($License.Name -Match "Windows*") -and ($License.LicenseStatus -ne 0)) {
		If ($License.GracePeriodRemaining -gt 0) {
			$GracePeriodDays = $License.GracePeriodRemaining / 1440
		}
		break
	}
}

Write-Host ("graceperiod=" + $GracePeriodDays)
