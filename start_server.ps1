param (
  [Parameter(Mandatory)][String]$method,
  [Int]$port = 8000,
  <#[ValidateScript({Test-Path $_})]#>[String]$dbPath
)

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
