rm ./Pash.psd1

New-ModuleManifest -Path "./Pash.psd1" `
    -RootModule "Pash.psm1" `
    -ModuleVersion "0.1.2" `
    -Author "moluopro" `
    -Copyright "(c) 2024 [moluopro](https://github.com/moluopro). All rights reserved." `
    -Description "Bash cmdlet in PowerShell" `
    -Tags @("Linux-Style", "Bash") `
    -ProjectUri "https://github.com/moluopro/pash" `
    -LicenseUri "https://www.apache.org/licenses/LICENSE-2.0.html" `
    -FunctionsToExport "*" `
    -AliasesToExport "*" `
    -VariablesToExport "*" `
    -CmdletsToExport "*" `
    -ReleaseNotes "Initial of Pash." `
    -PowerShellVersion "5.1" `
    -CompatiblePSEditions @("Core", "Desktop")

$apiKey = Get-Content -Path "../api.key" -Raw
Publish-Module -Path . -NuGetApiKey $apiKey
