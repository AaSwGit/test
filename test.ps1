new-module -name foobar -scriptblock {
  Function Install-Project() {
    param (
      [string]$project = 'chef',
      [string]$channel = 'stable'
    )
    echo $project $channgel
  }

  set-alias install -value Install-Project

  export-modulemember -alias 'install'
}
