$initialDelaySeconds = 5
$randomDelayMinSeconds = 60
$randomDelayMaxSeconds = 600
$factQueue = 2
$URL =  "http://catfacts-api.appspot.com/api/facts?number=$factQueue"
$callResult = Invoke-RestMethod -Uri $URL -Method Get

Sleep($initialDelaySeconds)
For($x = 0; $x -lt $callResult.facts.length; $x++)
{
    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.Speak($callResult.facts[$x])
    Sleep(Get-Random -Minimum $randomDelayMinSeconds -Maximum $randomDelayMaxSeconds)
}