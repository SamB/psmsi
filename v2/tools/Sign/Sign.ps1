<#
.Synopsis
	Digitally signs given files.

.Description
	Digitally signs files given file paths using a saved key pair.

.Parameter Path
	A path or paths to files to digitally sign.

.Example
	PS> sign.ps1 "example.ps1"

.Link
	get-pfxcertificate
	set-authenticodesignature

.Notes
	Requires that the file KeyPair.pfx is in the same directory as this script.

#Requires -Version 2.0
#>

param(
	[Parameter(Position=0, Mandatory=$true)]
	[string[]] $Path
)

process
{
	# get the script directory
	$invocation = (get-variable MyInvocation -scope 0).Value
	$pfxpath = join-path (split-path $invocation.MyCommand.Path) KeyPair.pfx

	$cert = get-pfxcertificate $pfxpath
	$server = 'http://timestamp.verisign.com/scripts/timstamp.dll'
	set-authenticodesignature -filepath $Path -certificate $cert -includeChain All -timeStampServer $server
}

# SIG # Begin signature block
# MIIM/AYJKoZIhvcNAQcCoIIM7TCCDOkCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUd1U6m4q1NTokKzMiY15MtFZu
# bjSgggmLMIICQTCCAa6gAwIBAgIQWf/S08nL4blMzQ9wiqCD7TAJBgUrDgMCHQUA
# MCQxIjAgBgNVBAMTGUNvZGVQbGV4IENlcnRpZmljYXRlIFJvb3QwHhcNMDcxMjAz
# MDQ1MjA4WhcNMzkxMjMxMjM1OTU5WjAyMTAwLgYDVQQDEydXaW5kb3dzIEluc3Rh
# bGxlciBQb3dlclNoZWxsIEV4dGVuc2lvbnMwgZ8wDQYJKoZIhvcNAQEBBQADgY0A
# MIGJAoGBALL5DWvPtHwMNl13PCJOlN1DEnsKctJ7nhP08ZkPJ3hHH9kaYqAFtyhF
# ZvvR8fUA/JLgLFNe6RObF+vew7dXEb5+DpzWhmqqHPu26MbioYmFCzNKeV6r3B11
# IKBV9Iybe1rYvqPB1zgrm6KTEOOJsEg9xiU/QGpUbZ5pzoy8MlbXAgMBAAGjbjBs
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMFUGA1UdAQROMEyAEAASIykvbqjhLW7qps1Y
# K36hJjAkMSIwIAYDVQQDExlDb2RlUGxleCBDZXJ0aWZpY2F0ZSBSb290ghBFZR+B
# tGHvu0mWkWTMPD5KMAkGBSsOAwIdBQADgYEAhyRUNoDmdr+rA/bz9UUG6wyTMEEe
# 0IG9s30ijn/dto7Wm3UO6hTdTLbt0gZbUlwIBnFtSwQr0Nor3dhdNe6gQn66dGtz
# Lrx84HpTt7e9Hy0AxmSqwEDXfEY2piwpbvTVcettzjOX2oSHpPjRyrO8Gs9KwJ2x
# S46gL6jcvyFawL4wggN6MIICYqADAgECAhA4Jdf6+GGvnvSQ5ya11lrVMA0GCSqG
# SIb3DQEBBQUAMFMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5j
# LjErMCkGA1UEAxMiVmVyaVNpZ24gVGltZSBTdGFtcGluZyBTZXJ2aWNlcyBDQTAe
# Fw0wNzA2MTUwMDAwMDBaFw0xMjA2MTQyMzU5NTlaMFwxCzAJBgNVBAYTAlVTMRcw
# FQYDVQQKEw5WZXJpU2lnbiwgSW5jLjE0MDIGA1UEAxMrVmVyaVNpZ24gVGltZSBT
# dGFtcGluZyBTZXJ2aWNlcyBTaWduZXIgLSBHMjCBnzANBgkqhkiG9w0BAQEFAAOB
# jQAwgYkCgYEAxLXyUhW8iIZgKRZKWy9LkWuHkfM1VFg16tE2XmJNUlE0ccJ7Zh2J
# yN0qxGoK9jfZmHSR9pKusLV2lvGpSmNFRy5rC5JOSyuM7lhKi9QH5Bos+IKqWNnN
# QvMtwHXejavHjh2abEwIlR7e2+9n4XLCScKeYDzh4r4Wo2N4aRR7rS0CAwEAAaOB
# xDCBwTA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLnZl
# cmlzaWduLmNvbTAMBgNVHRMBAf8EAjAAMDMGA1UdHwQsMCowKKAmoCSGImh0dHA6
# Ly9jcmwudmVyaXNpZ24uY29tL3Rzcy1jYS5jcmwwFgYDVR0lAQH/BAwwCgYIKwYB
# BQUHAwgwDgYDVR0PAQH/BAQDAgbAMB4GA1UdEQQXMBWkEzARMQ8wDQYDVQQDEwZU
# U0ExLTIwDQYJKoZIhvcNAQEFBQADggEBAFDFS8gkgN/kDSTC3hqxoQKhpoItDIMV
# gTcKgg4ssFoXYbXYBf6I2/GRkbNWGkCm65K+ODmwdTZ0OphP5De6mYnKlUIdsLnH
# oI1X4PrVZARCNU4B0TOiF8hNqifH8uGGTAI4TYN4xvxT4OvgBofdpJaeXgyY4qW+
# v4KFw2Dh360o2MelS2Taxxtbvaw5CNU4IqEziy+Kmuu8ByE/REEJB7VlHCS8SNNE
# gOuhz8kCtBTPVMcWo4Bc+Xk+XXJ9iBeeLEOiylPOfT32Kjq4T5QApW0Kg135XlP0
# GLNXD3DD+/WtlaAOF97EFoBgyQ8rboYE8ev0eCfRBcXuNFteuUky8jMwggPEMIID
# LaADAgECAhBHvxmV341SRkP3221IDTGkMA0GCSqGSIb3DQEBBQUAMIGLMQswCQYD
# VQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRQwEgYDVQQHEwtEdXJiYW52
# aWxsZTEPMA0GA1UEChMGVGhhd3RlMR0wGwYDVQQLExRUaGF3dGUgQ2VydGlmaWNh
# dGlvbjEfMB0GA1UEAxMWVGhhd3RlIFRpbWVzdGFtcGluZyBDQTAeFw0wMzEyMDQw
# MDAwMDBaFw0xMzEyMDMyMzU5NTlaMFMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5W
# ZXJpU2lnbiwgSW5jLjErMCkGA1UEAxMiVmVyaVNpZ24gVGltZSBTdGFtcGluZyBT
# ZXJ2aWNlcyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKnKsqTM
# zSCvCn2JrId18LRO8d/BD79nYb2jZBzau/nKM6uEMIlYfozba902ng+/0ex48nem
# fm88v5OvDbpo9GyUyr1SLatIPfW21V1fGwKf+i9rHqT3o5qmGsgC4X9MUuMOYOxA
# HH65Dd4/x7Tfh71femoxLgOZgROoRyDOMXMNVy3NeDQzlRKZErneaC+q5uPCiowq
# w4shh2a9g1hXb3W/PKomh13KEBU8n4TqVMEKbsT+xUrduQcRlyJ82z4n0R547J8x
# yfHmIhnbxLNHQ5oaX6AekORe9e588X2rYgGP9U0L3tAiVqiVza6Idq7uug3z5E3Z
# oPtooK4UO7OHwbsCAwEAAaOB2zCB2DA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUH
# MAGGGGh0dHA6Ly9vY3NwLnZlcmlzaWduLmNvbTASBgNVHRMBAf8ECDAGAQH/AgEA
# MEEGA1UdHwQ6MDgwNqA0oDKGMGh0dHA6Ly9jcmwudmVyaXNpZ24uY29tL1RoYXd0
# ZVRpbWVzdGFtcGluZ0NBLmNybDATBgNVHSUEDDAKBggrBgEFBQcDCDAOBgNVHQ8B
# Af8EBAMCAQYwJAYDVR0RBB0wG6QZMBcxFTATBgNVBAMTDFRTQTIwNDgtMS01MzAN
# BgkqhkiG9w0BAQUFAAOBgQBKa/nqWMJEHDGJeZkrlr+CrAHWHEzNsIpYbt8IKaNe
# yMqTE+cEUg3vRycvADiw5MmTTprUImIV9z83IU9wMYDxiziHs+jolwD+z1WWTiTS
# qSdOeq63YUHzKs7nydle3bsrhT61nbXZ4Vf/vrTFfvXPDJ7wl/4r0ztSGxs4J/c/
# SjGCAtswggLXAgEBMDgwJDEiMCAGA1UEAxMZQ29kZVBsZXggQ2VydGlmaWNhdGUg
# Um9vdAIQWf/S08nL4blMzQ9wiqCD7TAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIB
# DDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEE
# AYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUArxgi6m3ICv/
# 2Lct5ThfSCmrRCMwDQYJKoZIhvcNAQEBBQAEgYBXdLWSZFZ5A1E/8TXvrKQoCAYV
# P1kJy+YmPq5HoSnpzUPDbiYPdciE6PFOU2WnmzGenPkzyUAHxkScMsb8J+WYvF88
# TOFCLmZrmjf5QMpcIdlutxg9S/pLScq613MtHjezIMdMm+X5ISjbQw5idpyW4nWI
# +z/DhWINiyc6+OrR8KGCAX8wggF7BgkqhkiG9w0BCQYxggFsMIIBaAIBATBnMFMx
# CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjErMCkGA1UEAxMi
# VmVyaVNpZ24gVGltZSBTdGFtcGluZyBTZXJ2aWNlcyBDQQIQOCXX+vhhr570kOcm
# tdZa1TAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
# hkiG9w0BCQUxDxcNMDkwMjA1MDcwMzQ1WjAjBgkqhkiG9w0BCQQxFgQU0dUl8P0s
# MUX1R7TMYhqZbupNXoUwDQYJKoZIhvcNAQEBBQAEgYCS16SBsT67ISlWL035igTM
# t+JH3WOfTG5eJ5feu9UhZotkNUgf3Cd85Jk/RtBonMD0KNbCQkBTZnmQb14i4R4F
# r/BD53y+W6aI2zO8GXg4600PwD1/HnjbJU3UdQJTrVNYV1DZjvOFK8dxqY4IZ8FS
# 7RjtCYAGKFrHEStXB0bRXw==
# SIG # End signature block
