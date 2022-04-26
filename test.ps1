new-module -name Installer -scriptblock {
  [Console]::OutputEncoding = New-Object -typename System.Text.ASCIIEncoding
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
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
      Invoke-WebRequest $archiveUrl -OutFile $repo.zip
    }
    else {
      Write-Error "$user/$repo repository not found"
    }
  }

  export-modulemember -function "install"
}
  
