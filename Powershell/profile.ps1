$env:PYTHONIOENCODING="utf-8"

if ($ENV:USERPROFILE) {
  oh-my-posh init pwsh --config $ENV:USERPROFILE/.thecyberden-babis.omp.json | Invoke-Expression
}
else {
  oh-my-posh init pwsh --config ~/.thecyberden-babis.omp.json | Invoke-Expression
}

Import-Module posh-git
Import-Module -Name Terminal-Icons
Import-Module ZLocation
Import-Module PSUtil
Import-Module PSWriteHTML

# Invoke-Expression (& {
#     $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
#     (zoxide init --hook $hook powershell | Out-String)
# })

if ("C:\Windows\System32" -eq $pwd) {Set-Location ~}


#region functions

function Get-FileHash256 {
  <#
  .SYNOPSIS
    Compute the SHA-256 hash for a given file.
  .DESCRIPTION
    Wrapper function for Get-FileHash which defaulst the Algorithm parameter to
    SHA256 and copies the returned hash to the clipboard.
  .PARAMETER Path
    Fully qualified path to the file for which to obtain the SHA-256 hash.
  .EXAMPLE
    Get-FileHash256 -Path C:\Windows\System32\notepad.exe
  #>
  [CmdletBinding()]
  param (
    [System.IO.FileInfo]$Path
  )

  if (-not (Test-Path $Path)) {
    throw "File $Path not found, could not determine hash."
  }

  $sha_256_hash = (Get-FileHash -Algorithm SHA256 $Path).hash
  Write-Host "SHA-256 hash copied to clipboard for [$Path]: " -NoNewline
  Write-Host $sha_256_hash -ForegroundColor Green
  return $sha_256_hash | Set-Clipboard
}

function Edit-Profile {
  <#
  .SYNOPSIS
    Opens the $profile file an editor.
  .DESCRIPTION
    Opens the $profile.CurrentUserAllHosts file conditionally in one of the
    following programs:
    1. PowerShell ISE, if detected as the current host.
    2. VSCode, if detected as the current host.
    3. Notepad, if the current host is netiher of the above.
  .EXAMPLE
    Edit-Profile
  #>

  $PATH = $profile.CurrentUserAllHosts

  switch ((Get-Host).Name) {
    'Visual Studio Code Host' { Open-EditorFile $PATH }
    'Windows PowerShell ISE Host' { psedit $PATH }
    default { Start-Process "$env:windir\system32\notepad.exe" -ArgumentList @($PATH) }
  }
}

function Open-HistoryFile {
  <#
  .SYNOPSIS
    Opens the PowerShell history file.
  .DESCRIPTION
    Opens the (Get-PSReadLineOption).HistorySavePath file conditionally in one
    of the following programs:
    1. PowerShell ISE, if detected as the current host.
    2. VSCode, if detected as the current host.
    3. Notepad, if the current host is netiher of the above.
  .EXAMPLE
    Open-HistoryFile
  #>

  $HISTORY_PATH = (Get-PSReadLineOption).HistorySavePath

  switch ((Get-Host).Name) {
    'Visual Studio Code Host' { Open-EditorFile $HISTORY_PATH }
    'Windows PowerShell ISE Host' { psedit $HISTORY_PATH }
    default { Start-Process "$env:windir\system32\notepad.exe" -ArgumentList $HISTORY_PATH }
  }
}

function sudo {
  Start-Process @args -Verb RunAs -Wait
}

#endregion

#region execution
################################################################################
# PSReadLine and prompt options                                                #
################################################################################
if (-not (Get-Module PSReadline)) {
  Write-Warning 'Failed to locate PSReadLine module'
} else {
  Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
  Set-PSReadLineOption -ShowToolTips -BellStyle Visual -HistoryNoDuplicates
  Set-PSReadLineOption -PredictionSource History
}

# Chezmoi edit command defaults to vi, which doesn't exist on Windows
$env:EDITOR = 'code-insiders'

################################################################################
# Set common aliases                                                           #
################################################################################

# If (-Not (Test-Path Variable:PSise)) {  # Only run this in the console and not in the ISE
#     Import-Module Get-ChildItemColor

#     Function GCICFW {Get-ChildItemColorFormatWide -HideHeader -TrailingSlashDirectory}
    
#     Set-Alias -Name ls -Value Get-ChildItemColor -Option AllScope
#     Set-Alias -Name l -Value GCICFW -Option AllScope
# }

if ($IsWindows) {Set-Alias -Name np -Value C:\Windows\notepad.exe}

Function UP1 {Set-Location ..}
Set-Alias -Name up -Value UP1

Function VC1 {
    try     {python3 -m venv .venv}
    catch   {python  -m venv .venv}
}
Set-Alias -Name vc -Value VC1

Set-Alias -Name ve -Value .venv/scripts/activate.ps1

Invoke-Expression "$(thefuck --alias)"

#endregion
