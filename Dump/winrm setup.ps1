"<powershell>\n",
"$admin = [adsi]('WinNT://./administrator, user')\n",
"$admin.PSBase.Invoke('SetPassword', '{{ windows_password | default(generated_windows_password) }}')\n",
"$scriptPath=((New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))\n",
"Invoke-Command -ScriptBlock ([scriptblock]::Create($scriptPath)) -ArgumentList '-skipNetworkProfileCheck'\n",
"</powershell>"