new-module -name Installer -scriptblock {
  Function Install-Project() {
    param (
      [Parameter(Mandatory = $true)] $user,
      [Parameter(Mandatory = $true)] $repo,
      [string]$branch = 'master',
      [bool]$remove = $false
    )

    Write-Output $user $repo
  }

  set-alias install -value Install-Project
  export-modulemember -function 'Install-Project' -alias 'install'
  }
  
