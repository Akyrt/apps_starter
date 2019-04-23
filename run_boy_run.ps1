#!\usr\bin\env bash
#!\usr\bin\env node
Write-Host " ******************** Automatyzator uruchamiania oprogramowania v1.5 ! ******************** " -ForegroundColor red
$host.privatedata.ProgressForegroundColor = "Yellow";
$host.privatedata.ProgressBackgroundColor = "DarkGreen";

$stepsToRemove = 0;

# należy dopisać do każdego uruchamianego programu nowy step

# get Phpstorm process
$phpstorm = Get-Process phpstorm64 -ErrorAction SilentlyContinue
if ($phpstorm) {
	$stepsToRemove++
  }

 
# get chrome process
$chrome = Get-Process chrome -ErrorAction SilentlyContinue
if ($chrome) {
	$stepsToRemove++
 }


 # get notepadplusplus process
$notepadplusplus = Get-Process notepad++ -ErrorAction SilentlyContinue
if ($notepadplusplus) {
	$stepsToRemove++
 }


 # get Opera process
$Opera = Get-Process Opera -ErrorAction SilentlyContinue
if ($Opera) {
	$stepsToRemove++
 }


 # get VirtualBox process
$VirtualBox = Get-Process VirtualBox -ErrorAction SilentlyContinue
if ($VirtualBox) {
	$stepsToRemove++
 }


function Write-ProgressHelper
{
    param (
        [int]$StepNumber,

        [string]$Message
    )
	 $percent =  ("{0:N0}" -f (($StepNumber / $steps) * 100))
    Write-Progress -Activity 'Automatyzator uruchamiania oprogramowania v1.0' -Status $percent -PercentComplete (($StepNumber / $steps) * 100) -CurrentOperation $Message
}

$script:steps = (([System.Management.Automation.PsParser]::Tokenize((gc "$PSScriptRoot\$($MyInvocation.MyCommand.Name)"), [ref]$null) | where { $_.Type -eq 'Command' -and $_.Content -eq 'Write-ProgressHelper' }).Count) - $stepsToRemove - 1
Start-Sleep -s 2

# $stepCounter = 0
# Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'Start oprogramowania'
# Start-Sleep -s 2

if (!$phpstorm) {
	echo $steps
  # try gracefully first
  # $firefox.CloseMainWindow()
  # kill after five seconds
  # Sleep 5
  # if (!$firefox.HasExited) {
    # $firefox | Stop-Process -Force
  # }
    Start-Process -FilePath "C:\Program Files\JetBrains\PhpStorm 2018.3.4\bin\phpstorm64.exe"
    Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'PhpStorm uruchomiono !'
   Start-Sleep -s 2

  }
 Remove-Variable phpstorm
 
if (!$chrome) {
  Start-Process -FilePath "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --restore-last-session
  Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'Chrome uruchomiono !'
  Start-Sleep -s 2
 }
 Remove-Variable chrome

if (!$notepadplusplus) {
  Start-Process -FilePath "C:\Program Files (x86)\Notepad++\notepad++.exe"
  Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'Notepad++ uruchomiono !'
  Start-Sleep -s 2
 }
 Remove-Variable notepadplusplus

if (!$Opera) {
  Start-Process -FilePath "C:\Users\Tomek\AppData\Local\Programs\Opera\launcher.exe"
  Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'Opera uruchomiono !'
  Start-Sleep -s 2
 }
 Remove-Variable Opera
  

 if (!$VirtualBox) {
  Start-Process -FilePath "C:\Program Files\Oracle\VirtualBox\VirtualBox.exe"
  Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'VirtualBox uruchomiono !'
  Start-Sleep -s 2
 }
 Remove-Variable VirtualBox
 
   Write-ProgressHelper -StepNumber ($stepCounter) -Message 'Done!'

   Start-Sleep -s 5
   
# start explorer
# Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'Explorer uruchomiono !'
# Start-Sleep -s 2

# start taskmgr
# Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'Task manager uruchomiono !'
# Start-Sleep -s 2

# start powershell
# Write-ProgressHelper -StepNumber ($stepCounter++) -Message 'PowerShell uruchomiono !'

# exit