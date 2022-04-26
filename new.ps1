new-module -name Installer -scriptblock {
  function install() {
    param (
      [Parameter(Mandatory = $true)] $user,
      [Parameter(Mandatory = $true)] $repo,
      [string]$branch = "master",
      [bool]$remove = $false
    )

    $reposUrl = "https://api.github.com/repos/$user/$repo"
    $archiveUrl = "https://github.com/$user/$repo/archive/$branch.zip"

    $statusCode = Invoke-WebRequest $reposUrl | Select-Object -Expand StatusCode

    if($statusCode -eq 200){
      echo 'deneme'
    }
    else {
      Write-Error "$user/$repo repository not found"
    }
  }

  export-modulemember -function "install"
}
  
