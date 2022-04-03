[CmdletBinding()]
param
(
    [Parameter(Mandatory=$true, ValueFromPipeline=$false,  ValueFromPipelineByPropertyName=$false, Position=1)] 
    [string] ${Path}
)

[int] ${namespace} = 0x14

Resolve-Path -Path:${Path} | ForEach-Object -Process {
    if (-not (Test-Path -Path:${_} -PathType:Leaf)) {
        Write-Error "${_}: font file not found."
        return
    }
}


try
{
    ${shell} = New-Object -ComObject "Shell.Application"
    ${fontDir} = ${shell}.Namespace(${namespace})

    Resolve-Path -Path:${Path} | ForEach-Object -Process {
        Write-Verbose "Installing ${_}..."
        ${fontDir}.CopyHere("${_}", ${namespace}) | Out-Null
    }
} 
catch 
{
    throw
}
finally
{
    [System.Runtime.InteropServices.Marshal]::ReleaseComObject(${shell}) | Out-Null
}
