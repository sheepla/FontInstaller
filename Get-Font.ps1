param
(
    [Parameter(Mandatory=$false, ValueFromPipeline=$false, ValueFromPipelineByPropertyName=$false)]
    [string] $Name,

    [Parameter(Mandatory=$false, ValueFromPipeline=$false, ValueFromPipelineByPropertyName=$false)]
    [string] $Path,

    [Parameter(Mandatory=$false, ValueFromPipeline=$false, ValueFromPipelineByPropertyName=$false)]
    [string] $ModifyDate
)

[int] ${namespace} = 0x14

try
{
    ${shell} = New-Object -ComObject "Shell.Application"
    ${fontNamespace} = ${shell}.Namespace(${namespace})
    ${fontNamespace}.Items() | ForEach-Object -Process {
        [pscustomobject] @{
            Name = $_.Name
            Path = $_.Path
            ModifyDate = $_.ModifyDate
        }
    } | Where-Object -FilterScript {
        $_.Name -ilike "*${Name}*" -and
        $_.Path -ilike "*${Path}*" -and
        $_.ModifyDate -ilike "*${ModifyDate}*"
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
