Winlicense puppet module
========================

The assumption is that the key variable is passed to the module from Hiera using:  
`winlicense::key:KEY_value` or

    class { 'winlicense':  
      key => 'KEY_value'  
    }

Module installs two facts - *graceperiod* and *licensestatus*.

If *licensestatus* is not "Licensed", the key is applied using *SetWindowsKey.ps1* script.