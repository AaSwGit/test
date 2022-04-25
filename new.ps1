new-module -name Installer -scriptblock {
  Function install() {
    param (
      [Parameter(Mandatory = $true)] $user,
      [Parameter(Mandatory = $true)] $repo,
      [string]$branch = 'master',
      [bool]$remove = $false
    )

    Write-Output $user $repo
  }

  export-modulemember -function 'install'
}
