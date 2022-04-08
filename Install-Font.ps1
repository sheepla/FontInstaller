[CmdletBinding()]
param
(
    [Parameter(Mandatory=$true, ValueFromPipeline=$false,  ValueFromPipelineByPropertyName=$false, Position=1)] 
    [string] ${Path}
)

[int] ${namespaceIndex} = 0x14

function Invoke-FontInstallation
{
    param (
        [string[]] ${Path}
    )
    try
    {
        ${shell} = New-Object -ComObject "Shell.Application"
        ${fontDir} = ${shell}.Namespace(${namespaceIndex})

        foreach (${p} in ${Path})
        {
            Write-Verbose "Installing ${p}..."
            ${fontDir}.CopyHere("${p}", ${namespaceIndex}) | Out-Null
        }
    } catch
    {
        throw
    } finally
    {
        [System.Runtime.InteropServices.Marshal]::ReleaseComObject(${shell}) | Out-Null
    }
} 

function Get-FontFile
{
    param (
        [string] ${Path}
    )

    foreach (${p} in ${Path})
    {
        Get-ChildItem -Path:${p} -Recurse -Include "*.zip" | ForEach-Object -Process:{
            Expand-FontArchive -Path:${p}
        }
        Get-ChildItem -Path:${p} -Recurse -File -Include:@("*.ttf", "*.otf") | Select-Object -ExpandProperty:FullName
    }
}

function  Expand-FontArchive
{
    param (
        [string] ${Path}
    )
    ${tempDirName} = "{0}_{1}" -f ([datetime]::Now.ToString("yyyymmdd_HHMMss")), ([System.IO.Path]::GetFileNameWithoutExtension(${Path}))
    ${destinationPath} = Join-Path -Path:"${env:TEMP}" -ChildPath:${tempDirName}
    Write-Verbose "Extracting ${Path} -> ${destinationPath}..."

    # Extract  zip
    Expand-Archive -Path:${Path} -DestinationPath:${destinationPath} | Out-Null

    # Output font file path
    Get-ChildItem -Path:${destinationPath} -Recurse -File -Include:@("*.ttf", "*.otf") | Select-Object -ExpandProperty:FullName
}

Get-FontFile ${Path} | ForEach-Object -Process:{
    Invoke-FontInstallation -Path:${_}
}
