$env:PYTHONIOENCODING="utf-8"
oh-my-posh init pwsh --config ~\.thecyberden-babis.omp.json | Invoke-Expression
Import-Module posh-git
Set-Alias -Name np -Value C:\Windows\notepad.exe
Function UP1 {Set-Location ..}
Set-Alias -Name up -Value UP1
If (-Not (Test-Path Variable:PSise)) {  # Only run this in the console and not in the ISE
    Import-Module Get-ChildItemColor

    Function GCICFW {Get-ChildItemColorFormatWide -HideHeader -TrailingSlashDirectory}
    
    Set-Alias -Name ls -Value Get-ChildItemColor -Option AllScope
    Set-Alias -Name l -Value GCICFW -Option AllScope
}