param (
  [Parameter(Mandatory)][String]$method,
  [Int]$port = 8000,
  <#[ValidateScript({Test-Path $_})]#>[String]$dbPath
)

<#
  .SYNOPSIS
  Used to start an instance of the DynamoDB local server

  .DESCRIPTION
  Takes a series of parameters and uses them to start an instance
  of the local DynamoDB server. Expects the server to be located in
  the same folder as the script.

  .PARAMETER method
  Specifies how to store the database file. Valid options are
  profile, inMemory, and sharedDb

  .PARAMETER port
  Optional. Specifies the port to use for the server.

  .PARAMETER dbPath
  Optional. Specifies where to store the Database file.
  Does not work when using the inMemory method.

  .INPUTS
  None.

  .OUPUTS
  None.

  .EXAMPLE
  .\start_server.ps1 -method inMemory

#>

if ($method -eq 'profile') {

  $method = $null

} elseif ($method -eq 'inMemory' -or $method -eq 'inmemory') {

  $method = "-" + $method
  $dbPath = $null 

} elseif ($method -eq 'sharedDb' -or $method -eq 'sharedb') {

  $method = "-" + $method
  $dbPath = '"-dbPath ' + $dbPath + '"'

  echo $dbPath

} else {

  Write-host "Error occurred while parsing parameters"
  Write-host "Method must be one of 'inMemory', 'sharedDb', or 'profile'."
  exit

}

java -D"java.library.path=./DynamoDBLocal_lib" -jar DynamoDBLocal.jar $method $dbPath -port $port 
