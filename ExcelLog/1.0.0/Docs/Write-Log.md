---
external help file: ExcelLog-help.xml
Module Name: ExcelLog
online version: http://www.microsoft.com/
schema: 2.0.0
---

# Write-Log

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### Set2 (Default)
```
Write-Log [-Category] <String> [-Message] <String> [-ToScreen] -FilePath <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Set1
```
Write-Log [-Header] [-ToScreen] -FilePath <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Set3
```
Write-Log [-ToScreen] [-Footer] -FilePath <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Category
{{ Fill Category Description }}

```yaml
Type: String
Parameter Sets: Set2
Aliases:
Accepted values: Information, Warning, Error

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -FilePath
{{ Fill FilePath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Footer
{{ Fill Footer Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Set3
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Header
{{ Fill Header Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Set1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Message
{{ Fill Message Description }}

```yaml
Type: String
Parameter Sets: Set2
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ToScreen
{{ Fill ToScreen Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.SwitchParameter

### System.String

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS

[http://www.microsoft.com/](http://www.microsoft.com/)

