#!/bin/bash

# Copyright (C) 2024-2025 moluopro. All rights reserved.
# Github: https://github.com/moluopro
# License: https://www.apache.org/licenses/LICENSE-2.0.html

Set-Alias print Write-Host
Set-Alias prt Write-Host
Set-Alias echo Write-Output
Set-Alias warn Write-Warning
Set-Alias error Write-Error
Set-Alias err Write-Error


# Get-Command
# Get-Command -CommandType Cmdlet
# Get-Command -CommandType Function
# Get-Command -CommandType Application
# Get-Help Get-Command
# Get-Alias
# Get-Alias ls



# function just-example  {
#     [CmdletBinding()]
#     param (
#         [Parameter(ValueFromRemainingArguments=$true)]
#         [string[]]$args
#     )
    
#     process {
#         $length = $args.Length

#         for ($i = 0; $i -lt $length; $i++) {
#             Write-Output "Argument $i   $($args[$i])"
#         }
#     }
# }


function touch {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$args
    )

    process {
        $length = $args.Length

        if ($length -eq 1) {
            # 只有一个参数时，新建该文件
            $file = $args[0]
            if (Test-Path $file) {
                print "File '$file' already exists."
            } else {
                New-Item -Path $file -ItemType File | Out-Null
                print "File '$file' created."
            }
        }
        elseif ($length -eq 2) {
            # 有两个参数时，检查是否包含 --force
            $arg1 = $args[0]
            $arg2 = $args[1]

            if ($arg1 -eq "--force") {
                $file = $arg2
                if (Test-Path $file) {
                    # 文件已存在，刷新访问与修改时间
                    Set-ItemProperty -Path $file -Name LastWriteTime -Value (Get-Date)
                    Set-ItemProperty -Path $file -Name LastAccessTime -Value (Get-Date)
                    print "File '$file' exists. Timestamps refreshed."
                } else {
                    # 文件不存在，创建新文件
                    New-Item -Path $file -ItemType File | Out-Null
                    print "File '$file' created."
                }
            }
            elseif ($arg2 -eq "--force") {
                $file = $arg1
                if (Test-Path $file) {
                    # 文件已存在，刷新访问与修改时间
                    Set-ItemProperty -Path $file -Name LastWriteTime -Value (Get-Date)
                    Set-ItemProperty -Path $file -Name LastAccessTime -Value (Get-Date)
                    print "File '$file' exists. Timestamps refreshed."
                } else {
                    # 文件不存在，创建新文件
                    New-Item -Path $file -ItemType File | Out-Null
                    print "File '$file' created."
                }
            }
            else {
                # 如果没有 --force 参数，打印警告并退出
                warn "You must specify --force to create or refresh the file."
                return
            }
        }
        else {
            warn "Invalid number of arguments. Please provide one or two arguments."
        }
    }
}


function which {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$args
    )
    
    process {
        $length = $args.Length

        for ($i = 0; $i -lt $length; $i++) {
            Write-Output "Argument $i   $($args[$i])"
        }
    }
}
