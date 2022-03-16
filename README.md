# aws\_local\_ddb\_start\_script

Simple script for starting and running a local install of DynamoDB.
Intended to save on a bit of typing and make operating the server a bit easier.

## Running the Script

The syntax for the script is as follows

```PowerShell
start_server.ps1 [-method] <profile|inMemory|sharedDb> [[-port] <port number>] [[-dbPath] <path to save DB file at>]
```

Currently the dbPath parameter doesn't work, I haven't put in the effort to determine why as of yet.
I think it potentially might be something to do with how PowerShell encodes strings, but I am unsure.

Future plans are to add the ability to run the server as a background process so you don't have to keep the window open after starting the server.
