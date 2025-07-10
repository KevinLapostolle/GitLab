class LogEntry {
    [DateTime] $DateTime
    [String] $Category
    [String] $Message

    LogEntry ([DateTime] $DateTime, [String] $Category, [String] $Message) {
        $this.DateTime = $DateTime
        $this.Category = $Category
        $this.Message = $Message
    }
}

function Write-Log
{
<#
.Synopsis
   Ecrit le log
.DESCRIPTION
   Ecrit le log de 3 façons :
    - En-tête de début de log
    - Information unitaire de log
    - Pied de fin de log
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
    [CmdletBinding(DefaultParameterSetName='Set2', 
                  PositionalBinding=$true,
                  HelpUri = 'http://www.microsoft.com/')]
    [OutputType([String])]
    Param
    (
        [Parameter(Mandatory, ParameterSetName='Set1', ValueFromPipelineByPropertyName=$true)]
        [Switch]$Header,

        [Parameter(Mandatory, ParameterSetName='Set2', Position = 0, ValueFromPipelineByPropertyName=$true)]
        [ValidateSet("Information", "Warning", "Error")]
        [String]$Category,

        [Parameter(Mandatory, ParameterSetName='Set2', Position = 1, ValueFromPipelineByPropertyName=$true)]
        [String]$Message,

        [Switch]$ToScreen,

        [Parameter(Mandatory, ParameterSetName='Set3', ValueFromPipelineByPropertyName=$true)]
        [Switch]$Footer,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName=$true)]
        [String]$FilePath
    )

$HashCategory = @{
                    'Information' = 'Cyan'
                    'Warning'= 'Yellow'
                    'Error' = 'Red'
}

    Switch ($PSCmdlet.ParameterSetName) {
        'Set1' { # Implémentation du Header 

            $head = 
@'
+----------------------------------------------------------------------------------------+
Script fullname          : {0}
When generated           : {1}
Current user             : {2}
Current computer         : {3}
Operating System         : {4}
OS Architecture          : {5}
+----------------------------------------------------------------------------------------+    
'@ -f $PSCommandPath,(get-date).tostring('yyyy-MM-dd hh:mm:ss'),$env:USERNAME,$env:COMPUTERNAME,(Get-ComputerInfo).OsName, (Get-CimInstance Win32_operatingsystem).OSArchitecture

            $head | Out-File -Path $FilePath
            If ($ToScreen) {Write-Host $head}
                
        }
        'Set2' { # Implémentation du log
            $Delimiter =";"
            $Log = "$((Get-Date).ToString("yyyy-MM-dd hh:mm:ss")) $Delimiter $Category $Delimiter $Message"


            $Log| Out-File -Path $FilePath -Append
            If($ToScreen) {
                Switch ($Category){
                    'Information' {Write-Host $Log -ForegroundColor Cyan}
                    'Warning' {Write-Host $Log -ForegroundColor Yellow}
                    'Error' {Write-Host $Log -ForegroundColor Red}
                }
            }

         }
        'Set3' { # Implémentation du footer
            $InitialDateTime = [DateTime]((Get-Content -Path $FilePath -First 3)[2]).Substring($_.IndexOf(':'))
            $
            $foot = 
@'
+----------------------------------------------------------------------------------------+
End time                 : {0}
Total duration (seconds) : {1}
Total duration (minutes) : {2}
+----------------------------------------------------------------------------------------+
'@ -f (get-date).tostring('yyyy-MM-dd hh:mm:ss'),((Get-Date)-$InitialDateTime).Seconds,((Get-Date)-$InitialDateTime).Minutes

            $foot | Out-File -Path $FilePath -Append
            If ($ToScreen) {Write-Host $foot}

        } 
    } # End Switch
}

function ConvertFrom-Log
{
<#
.Synopsis
   Lit un log et convertit le contenu en objet
.DESCRIPTION
   Lit un log et convertit le contenu en objet
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
    Param
    (
        [Parameter(Mandatory)]
        [String] $FilePath
    )

    [String[]] $Content = (Get-Content -Path $FilePath) -Match '^\d'

    ForEach ($Item in $Content) {
        $LogContent = $Item.Split(';')
        [LogEntry]::New(($LogContent[0] -As [DateTime]), $LogContent[1], $LogContent[2])
    }

}