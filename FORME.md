## PowerShell发布踩坑

发布命令：`Publish-Module -Path . -NuGetApiKey 你的apiKey`  

> https://github.com/PowerShell/PowerShell/releases/tag/v7.4.6  
> D:/Download/Browser/PowerShell/pwsh  

### SSL/TLS

如果您在发布一个PowerShell包的时候，遇到如下错误：  
```pwsh
Publish-PSArtifactUtility : 无法发布模块“xxx”:“请求被中止: 未能创建 SSL/TLS 安全通道。”。
所在位置 C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PSModule.psm1:1227 字符: 17
+                 Publish-PSArtifactUtility -PSModuleInfo $moduleInfo 
+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Write-Error]，WriteErrorException
    + FullyQualifiedErrorId : FailedToPublishTheModule,Publish-PSArtifactUtility
```
请在官方仓库下载新版Powershell，并在终端里输入`<Powershell-Install-Path>/pwsh`，使用新版进行上传。  

如果您在发布一个PowerShell包的时候，遇到如下错误：
```pwsh
Write-Error: Failed to generate the compressed file for module 'Cannot index into a null array.'  
```

这是一个微软的[祖传bug](https://github.com/PowerShell/PowerShellGetv2/issues/606)，在数年前就被人反馈过。产生bug的原因是语言环境
1. 下载
2. $env:DOTNET_CLI_UI_LANGUAGE="en_US"
3. $env:NUGET_CLI_LANGUAGE="en_US"