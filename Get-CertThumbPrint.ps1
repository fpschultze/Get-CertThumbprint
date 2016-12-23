function Get-CertThumbprint
{
  <#
  .SYNOPSIS
   Get the hash value for a .cer file.

  .DESCRIPTION
   Returns the hexadecimal string representation of a X.509 certificate hash value.

  .EXAMPLE
   Get-CertThumbprint -CertFile webserver.cer

  .OUTPUTS
   System.String
  #>

  Param
  (
    # The path to the certificate
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string]$CertFile
  )
  $ErrorActionPreference = 'Stop'
  try
  {
    Write-Verbose 'Load the certificate into an X509Certificate object'
    $myCert = New-Object -TypeName System.Security.Cryptography.X509Certificates.X509Certificate -ArgumentList $CertFile
    $myCert.GetCertHashString()
  }
  catch
  {
    $_.Exception.Message | Write-Error
  }
}
