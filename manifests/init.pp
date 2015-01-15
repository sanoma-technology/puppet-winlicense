class winlicense ($key) {
	file { 'c:/Scripts':
		ensure => directory,
	}
	file { 'c:/Scripts/SetWindowsKey.ps1':
		ensure => present,
		require => File['c:/Scripts'],
		source => 'puppet:///modules/winlicense/SetWindowsKey.ps1',
	}
	if ( $key and $licensestatus and $licensestatus != 'Licensed' ) {
		exec { 'set_license':
			command => "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy RemoteSigned -NoProfile -NonInteractive -NoLogo -File c:/Scripts/SetWindowsKey.ps1 ${key}",
		}	
	}
}
