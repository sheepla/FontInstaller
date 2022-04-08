param
(
    [Parameter(Mandatory=$false, ValueFromPipeline=$false, ValueFromPipelineByPropertyName=$false)]
    [string] $Name,

    [Parameter(Mandatory=$false, ValueFromPipeline=$false, ValueFromPipelineByPropertyName=$false)]
    [string] $Path
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
        }
    } | Where-Object -FilterScript {
        $_.Name -ilike "*${Name}*" -and $_.Path -ilike "*${Path}*"
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
