## cd \
## cd 'C:\Temp\simmulated workload\AdventureWorksLT-Workload'
add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Generate SQL Workload'
$form.Size = New-Object System.Drawing.Size(1050,1150)
$form.StartPosition = 'CenterScreen'

$labelInstance = New-Object System.Windows.Forms.Label
$labelInstance.top = 60
$labelInstance.left = 30
$labelInstance.width = 300
$labelInstance.height = 60
$labelInstance.Text = '       Server:'
$labelInstance.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelInstance) 

$textBoxInstance = New-Object System.Windows.Forms.TextBox
$textBoxInstance.top=60
$textBoxInstance.left= 350
$textBoxInstance.width = 600
$textBoxInstance.height = 60
$textBoxInstance.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBoxInstance)


$labelDatabase = New-Object System.Windows.Forms.Label
$labelDatabase.top = 120
$labelDatabase.left = 30
$labelDatabase.width = 300
$labelDatabase.height = 60
$labelDatabase.Text = 'Database Name:'
$labelDatabase.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelDatabase)

$textBoxDatabase = New-Object System.Windows.Forms.TextBox
$textBoxDatabase.top= 120
$textBoxDatabase.left= 350
$textBoxDatabase.width = 600
$textBoxDatabase.height = 60
$textBoxDatabase.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBoxDatabase)

## add radio button to gather security: SQL Authentication | Windows Integrated Security
# Create a group that will contain your radio buttons
$SecurityGroupBox = New-Object System.Windows.Forms.GroupBox
$SecurityGroupBox.top = 165 
$SecurityGroupBox.left = 350
$SecurityGroupBox.width = 580
$SecurityGroupBox.height = 90
$SecurityGroupBox.text = "Login"
$SecurityGroupBox.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)

# Create the collection of radio buttons
$SQLAuthRadioButton = New-Object System.Windows.Forms.RadioButton
$SQLAuthRadioButton.Top = 25
$SQLAuthRadioButton.Left = 20
$SQLAuthRadioButton.Width = 240
$SQLAuthRadioButton.height = 60
$SQLAuthRadioButton.Checked = $true 
$SQLAuthRadioButton.Text = "SQL Authentication"
$SQLAuthRadioButton.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)

$WindowsRadioButton = New-Object System.Windows.Forms.RadioButton
$WindowsRadioButton.top = 25
$WindowsRadioButton.left = 300
$WindowsRadioButton.width = 240
$WindowsRadioButton.height = 60
$WindowsRadioButton.Checked = $false
$WindowsRadioButton.Text = "Windows Integrated"
$WindowsRadioButton.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)

# Add all the GroupBox controls on one line
$SecurityGroupBox.Controls.AddRange(@($SQLAuthRadioButton,$WindowsRadioButton))
$form.Controls.Add($SecurityGroupBox)

$labelUsername = New-Object System.Windows.Forms.Label
$labelUsername.top = 270 
$labelUsername.left = 30
$labelUsername.width = 300
$labelUsername.height = 60
$labelUsername.Text = '     Username:'
$labelUsername.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelUsername)

$textBoxUsername = New-Object System.Windows.Forms.TextBox
$textBoxUsername.top= 270 
$textBoxUsername.left= 350
$textBoxUsername.width = 600
$textBoxUsername.height = 60
$textBoxUsername.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBoxUsername)


$labelPassword = New-Object System.Windows.Forms.Label
$labelPassword.top = 330 
$labelPassword.left = 30
$labelPassword.width = 300
$labelPassword.height = 60
$labelPassword.Text = '     Password:'
$labelPassword.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelPassword)

$textboxpassword = New-Object Windows.Forms.MaskedTextBox
$textboxpassword.PasswordChar = '*'
$textboxpassword.Top  = 330 
$textboxpassword.Left = 350
$textboxpassword.Width  = 600
$textboxpassword.Height = 900
$textboxpassword.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxpassword)


$labelWorkload = New-Object System.Windows.Forms.Label
$labelWorkload.top = 390 
$labelWorkload.left = 30
$labelWorkload.width = 300
$labelWorkload.height = 60
$labelWorkload.Text = '     Workload:'
$labelWorkload.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelWorkload)


$listBox = New-Object System.Windows.Forms.ListBox
$listBox.top= 390 
$listBox.left= 350
$listBox.width = 600
$listBox.Height = 360
[void] $listBox.Items.Add('0 Connection Test')
[void] $listBox.Items.Add('1 Compile Workload')
[void] $listBox.Items.Add('2 CPU')
[void] $listBox.Items.Add('3 SQL CPU')
[void] $listBox.Items.Add('4 Blockers')
[void] $listBox.Items.Add('5 Sargability queries')
[void] $listBox.Items.Add('6 Execution Plan')
[void] $listBox.Items.Add('7 Cursors')
[void] $listBox.Items.Add('8 Errors')
[void] $listBox.Items.Add('9 TempDB')
[void] $listBox.Items.Add('A CPU Runner')
[void] $listBox.Items.Add('B Heavy Queries')
[void] $listBox.Items.Add('C Dynamic Workload')
[void] $listBox.Items.Add('D Memory Grant')
[void] $listBox.Items.Add('E Keyset cursors')
[void] $listBox.Items.Add('F Update cursors')
[void] $listBox.Items.Add('G read only cursors')
[void] $listBox.Items.Add('H for Insert rows')
[void] $listBox.Items.Add('I light workload')
[void] $listBox.Items.Add('J TempDB small/med/large #tables')
[void] $listBox.Items.Add('K WriteLog med/large tables')
[void] $listBox.Items.Add('L Deadlocks')
[void] $listBox.Items.Add('M Attentions')
$ListBox.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($listBox)

$labelSessions = New-Object System.Windows.Forms.Label
$labelSessions.top = 750 
$labelSessions.left = 30
$labelSessions.width = 300
$labelSessions.height = 60
$labelSessions.Text = '# of Sessions:'
$labelSessions.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelSessions)

$textboxSessions = New-Object Windows.Forms.MaskedTextBox
$textboxSessions.Top  = 750 
$textboxSessions.Left = 350
$textboxSessions.Width  = 60
$textboxSessions.Height = 900
$textboxSessions.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxSessions)

$labelrepetitions = New-Object System.Windows.Forms.Label
$labelrepetitions.top = 810 
$labelrepetitions.left = 30
$labelrepetitions.width = 300
$labelrepetitions.height = 60
$labelrepetitions.Text = '# repetitions:'
$labelrepetitions.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelrepetitions)

$textboxRepetitions = New-Object Windows.Forms.MaskedTextBox
$textboxRepetitions.Top  = 810 
$textboxRepetitions.Left = 350
$textboxRepetitions.Width  = 60
$textboxRepetitions.Height = 900
$textboxRepetitions.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxRepetitions)

$labelTimeout = New-Object System.Windows.Forms.Label
$labelTimeout.top = 870 
$labelTimeout.left = 30
$labelTimeout.width = 300
$labelTimeout.height = 60
$labelTimeout.Text = '  Timeout (s):'
$labelTimeout.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelTimeout)


$textboxTimeout = New-Object Windows.Forms.MaskedTextBox
$textboxTimeout.Top  = 870 
$textboxTimeout.Left = 350
$textboxTimeout.Width  = 60
$textboxTimeout.Height = 900
$textboxTimeout.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxTimeout)

$chkbox_showStartProcess = New-Object System.Windows.Forms.CheckBox
$chkbox_showStartProcess.text = "Show start-process"
$chkbox_showStartProcess.Top  = 740 
$chkbox_showStartProcess.Left = 480 
$chkbox_showStartProcess.Width  = 600
$chkbox_showStartProcess.Height = 60
$chkbox_showStartProcess.Font = New-Object System.Drawing.Font("Lucida Console",20,[System.Drawing.FontStyle]::Regular)
$chkbox_showStartProcess.checked = -1
$chkbox_showStartProcess.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($chkbox_showStartProcess)

$chkbox_showOstress = New-Object System.Windows.Forms.CheckBox
$chkbox_showOstress.text = "Show OSTRESS window"
$chkbox_showOstress.Top  = 780 
$chkbox_showOstress.Left = 480 
$chkbox_showOstress.Width  = 600
$chkbox_showOstress.Height = 60
$chkbox_showOstress.Font = New-Object System.Drawing.Font("Lucida Console",20,[System.Drawing.FontStyle]::Regular)
$chkbox_showOstress.checked = -1
$chkbox_showOstress.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($chkbox_showOstress)

$chkbox_showOstressQuietMode = New-Object System.Windows.Forms.CheckBox
$chkbox_showOstressQuietMode.text = "Show OSTRESS window - quiet mode"
$chkbox_showOstressQuietMode.Top  = 820 
$chkbox_showOstressQuietMode.Left = 480 
$chkbox_showOstressQuietMode.Width  = 600
$chkbox_showOstressQuietMode.Height = 60
$chkbox_showOstressQuietMode.Font = New-Object System.Drawing.Font("Lucida Console",20,[System.Drawing.FontStyle]::Regular)
$chkbox_showOstressQuietMode.checked = 0
$chkbox_showOstressQuietMode.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($chkbox_showOstressQuietMode)

$chkbox_saveOstressOutput = New-Object System.Windows.Forms.CheckBox
$chkbox_saveOstressOutput.text = "Save OSTRESS output"
$chkbox_saveOstressOutput.Top  = 860 
$chkbox_saveOstressOutput.Left = 480 
$chkbox_saveOstressOutput.Width  = 600
$chkbox_saveOstressOutput.Height = 60
$chkbox_saveOstressOutput.Font = New-Object System.Drawing.Font("Lucida Console",20,[System.Drawing.FontStyle]::Regular)
$chkbox_saveOstressOutput.checked = -1
$chkbox_saveOstressOutput.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($chkbox_saveOstressOutput)

$form.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)


$okButton = New-Object System.Windows.Forms.Button
$okButton.Top= 990
$okButton.Left= 150
$okButton.Width= 210
$okButton.Height= 60
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$okButton.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Top= 990
$cancelButton.Left= 450
$cancelButton.Width= 210
$cancelButton.Height= 60
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$cancelButton.Font = New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)


# read entries from last-execution if file exists


$lastexecpath = 'exec_Ostress.txt'
if (Test-Path -LiteralPath $lastexecpath) {
    $content = Get-Content -Path $lastexecpath
    $textBoxInstance.text = $content[0]
    $textBoxDatabase.text = $content[1]
    $textBoxUsername.text = $content[2]
    #
    # password is not saved in file
    #$textBoxPassword.text = $content[3]
    #
    $textboxSessions.text = $content[3]
    $textboxRepetitions.text = $content[4]
    $textboxTimeout.text = $content[5]
#} else {
#    "Path doesn't exist: $path"
}

function Get-Argument
    {
        $param_list = $args[0]
            $p_server = $param_list[0]
            $p_user = $param_list[1]
            $p_senha = $param_list[2]
            $p_security = $param_list[3]
            $p_database = $param_list[4]
            $p_script = $param_list[5]
            $p_sessions = $param_list[6]
            $p_repetitions = $param_list[7]
            $p_timeout = $param_list[8]
            $p_outputtofolder = $param_list[9]
            $p_foldername = $param_list[10]
            $p_quietmode = $param_list[11]
    

        $value=''
    if ($p_security) {
        $value = '-S"' + $p_server + '" -E ' 
    } else {
        $value = '-S"' + $p_server + '" -U"' + $p_user + '" -P"' + $p_senha  + '"' 
    }
    $value += ' -d"' + $p_database + '" -i"' + $p_script + '" -n' + $p_sessions + ' -r' + $p_repetitions + ' -t' + $p_timeout + ' -T146' 
    if ($p_quietmode){
        $value +=  ' -q'
    }
    if ($p_outputtofolder) {
        $value +=  ' -o"' + $p_foldername + '"' 
    }
    return $value
}


$form.Topmost = $true

#
# display form on a loop
#
while ($true) {

    $form.Add_Shown({$textBoxInstance.Select()})

    $result = $form.ShowDialog()

    [string]$srv=''
    [string]$database=''
    [string]$user=''
    [string]$Pass=''
    [string]$sessions=''
    [string]$repeats=''
    [string]$timeout=''
    [string]$arguments=''
    [string]$arguments2=''

    if ($result -ne [System.Windows.Forms.DialogResult]::OK){
        BREAK
    }

    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $srv = $textBoxInstance.Text
        $database = $textBoxDatabase.Text
        if ($database -eq "")
            {
                $database = "master"
            }
        $user = $textBoxUsername.text
        $pass = $textboxpassword.text 
        $sessions = $textboxSessions.text
        
        if ($sessions -eq "")
            {
                $sessions = "1"
            }
        $repeats = $textboxRepetitions.text
        if ($repeats -eq "")
            {
                $repeats = "1"
            }
        $timeout = $textboxTimeout.Text
        if ($timeout -eq "")
            {
                $timeout = "10"
            }

        $OSTRESSWindowStyle = "Minimized" ## "Hidden"
        if ($chkbox_showOstress.checked) {
            $OSTRESSWindowStyle = "Normal"
        }

    }


    ## lisbox selection
    if ($result -eq [System.Windows.Forms.DialogResult]::OK)
    {

        # check: save/overwrite exec_ostress.txt file?
        ##
        ## UPDATE INFO ON EXEC_OSTRESS.TXT
        ##
        $lastexecpath = 'exec_Ostress.txt'
        #if 1 -eq 1 {
            #if (Test-Path -LiteralPath $lastexecpath) {
            #    Remove-Item -LiteralPath $path -Verbose 
            #}
            $textBoxInstance.text | Out-File $lastexecpath
            $textBoxDatabase.text | Out-File -FilePath $lastexecpath -Append
            $textBoxUsername.text | Out-File -FilePath $lastexecpath -Append
            #
            # do not save password:
            #$textBoxPassword.text | Out-File -FilePath $lastexecpath -Append
            #
            $textboxSessions.text | Out-File -FilePath $lastexecpath -Append
            $textboxRepetitions.text | Out-File -FilePath $lastexecpath -Append
            $textboxTimeout.text | Out-File -FilePath $lastexecpath -Append
        #}


        if ($listBox.SelectedIndex -eq -1) {
            $listBox.SelectedIndex = 0
        }
        $Ostress = $listBox.SelectedItem
        $selection = $ostress.Substring(0,1) 

        switch ($selection)
        {
        '0' {    
                # remove previous execution:
                $paths = 'OstressOutput_TestConnection'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path -Recurse # -Verbose
                    }
                }
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\Connection_test.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_TestConnection" , $chkbox_showOstressQuietMode.checked )
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments 
            }

        '1' {    
                # remove previous execution:
                $paths = 'OstressOutput_CompileWorkload'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Compile_Workload.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_CompileWorkload" , $chkbox_showOstressQuietMode.checked )
                Start-Process -FilePath "OSTRESS.EXE" -ArgumentList $arguments 

            }         

        '2' {
                # remove previous execution:
                $paths = 'OstressOutput_CPU_Stress' , 'OstressOutput_CPU_Stress_setup'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # script for setup
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_CPU - setup.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_CPU_Stress_setup", $chkbox_showOstressQuietMode.checked )
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_CPU.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_CPU_Stress", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            }         

        '3' 
            {    
                # remove previous execution:
                $paths = 'OstressOutput_SQLCPUPower' , 'OstressOutput_SQLCPUCosine' , 'OstressOutput_SQLCPUNumbers' , 'OstressOutput_SQLCPUNumbers_AUX'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\CPU Busy - Power.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_SQLCPUPower" , $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\CPU Busy - COSine.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_SQLCPUCosine" , $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\CPU Busy - Numbers Table.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_SQLCPUNumbers", $chkbox_showOstressQuietMode.checked  )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

            }
        '4' 
            {    
                # remove previous execution:
                $paths = 'OstressOutput_blockers_only'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_blockers.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_blockers_only", $chkbox_showOstressQuietMode.checked  )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

            } 
        '5' 
            {    
                
                # remove previous execution:
                $paths = 'OstressOutput_Sargability'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Sargability.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_Sargability" , $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        '6' {    
                # remove previous execution:
                $paths = 'OstressOutput_ExecutionPlan'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_ExecutionPlan.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_ExecutionPlan" , $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            }

        '7' {    
                # remove previous execution:
                $paths = 'OstressOutput_Cursors'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Cursors.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_Cursors" , $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        '8' {    
                # remove previous execution:
                $paths = 'OstressOutput_Errors'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Errors.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_Errors", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        '9' {    
                # remove previous execution:
                $paths = 'OstressOutput_TempDBResults'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\Stress_TempDB.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_TempDBResults", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            }

        'A' {    
                # remove previous execution:
                $paths = 'OstressOutput_CPURunner'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_CPURunner.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_CPURunner", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        'B' {    
                # remove previous execution:
                $paths = 'OstressOutput_HeavyQuery'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_HeavyQuery.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_HeavyQuery" , $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        'C' {

                $paths = 'OstressOutput_Dynamic_Workload'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Dynamic_Workload.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_Dynamic_Workload", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            }

        'D' {    
                # remove previous execution:
                $paths = 'OstressOutput_MemoryGrant'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_MemoryGrant.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_MemoryGrant", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        'E' {
                # remove previous execution:
                $paths = 'OstressOutput_KeysetCursor'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\STRESS 103 - KEYSET CURSOR for UPDATE Person.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_KeysetCursor", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        'F' {
                # remove previous execution:
                $paths = 'OstressOutput_UPDATECursor'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\STRESS 101 - UPDATE Person Cursor.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_UPDATECursor", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            }

        'G' {
                # remove previous execution:
                $paths = 'OstressOutput_READONLYCursor'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\STRESS 102 - READONLY Cursor Person.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_READONLYCursor", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        'H' {
                # remove previous execution:
                $paths = 'OstressOutput_InsertEnlargedSales' , 'OstressOutput_InsertEnlargedSales_SETUP'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # setup
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_EnlargeSalesTables_Setup.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_InsertEnlargedSales_SETUP", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_EnlargeSalesTables.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_InsertEnlargedSales", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            } 

        'I' {
                # remove previous execution:
                $paths = 'OstressOutput_CPU_SETUP' , 'OstressOutput_ParamSniffing' , 'OstressOutput_CPU', 'OstressOutput_Hash', 'OstressOutput_PARAMETERIZATION', 'OstressOutput_Recompile', 'OstressOutput_High_CPU'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_CPU - setup.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_CPU_SETUP" , $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_ParamSniffing - setup.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_ParamSniffing_SETUP", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_ParamSniffing.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_ParamSniffing", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_CPU.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_CPU", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Hash.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_Hash", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_PARAMETERIZATION.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_PARAMETERIZATION", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Recompile.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_Recompile", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_HighCPU.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_HighCPU", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

            }


        'J' { # J for TempDB small/med/large #tables

                # remove previous execution:
                $paths = 'OstressOutput_TempDB_Objects' , 'OstressOutput_TempDB_Objects_small' , 'OstressOutput_TempDB_medsize', 'OstressOutput_TempDB_Objects_large'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # setup 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\tempstress_ddl.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_TempDB_Objects", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\gen_tempstress_small.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_TempDB_Objects_small", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\gen_tempstress_medsize.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_TempDB_Objects_medsize", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\gen_tempstress_large.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_TempDB_Objects_large", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            }


        'K' { # K for WriteLog med/large tables

                # remove previous execution:
                $paths = 'OstressOutput_WriteLog_Objects' , 'OstressOutput_WriteLog_Objects_small' , 'OstressOutput_WriteLog_Objects_medsize', 'OstressOutput_WriteLog_Objects_large'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # setup 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\WriteLog_ddl.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_WriteLog_Objects", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\gen_WriteLog_small.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_WriteLog_Objects_small", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\gen_WriteLog_medsize.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_WriteLog_Objects_medsize", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\gen_WriteLog_large.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_WriteLog_Objects_large", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

            }



        'L' { # 'L for Deadlocks'

                # remove previous execution:
                $paths = 'OstressOutput_deadlock_setup' , 'OstressOutput_deadlock_session_1' , 'OstressOutput_deadlock_session_2'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # setup 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Deadlock_Setup.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_deadlock_setup", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Deadlock_Session_1.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_deadlock_session_1", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
                # workload 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_Deadlock_Session_2.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_deadlock_session_2", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments
            }

        'M' { # 'M for Attentions'

                # remove previous execution:
                $paths = 'OstressOutput_attentions_JoinPredicate' , 'OstressOutput_attentions_LockEscalation_setup' , 'OstressOutput_attentions_LockEscalation' , 'OstressOutput_attentions_AutoStats' , 'OstressOutput_attentions_HashWarnings', 'OstressOutput_attentions_SortWarnings'
                foreach ($path in $paths) {
                    if (Test-Path -LiteralPath $path) {
                        Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                    }
                }
                # lock-escalation-setup:
                # setup 
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_LockEscalation_Setup.sql" , 1 , 1 , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_attentions_LockEscalation_setup", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

                # lock-escalation-workload
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_LockEscalation_Workload.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_attentions_LockEscalation", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

                # jopin-predicate-workload
                $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_attentions_JoinPredicate.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_attentions_JoinPredicate", $chkbox_showOstressQuietMode.checked )
                if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

                 # jopin-predicate-workload
                 $arguments = Get-Argument($srv, $user, $pass , $WindowsRadioButton.Checked , $database , "TSQL\AdventureWorks_attentions_SortWarning.sql" , $sessions , $repeats , $timeout , $chkbox_saveOstressOutput.checked, "OstressOutput_attentions_SortWarnings", $chkbox_showOstressQuietMode.checked )
                 if ($chkbox_showStartProcess.checked) {
                    write-host $arguments.replace($pass,'<password>')
                }
                Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $arguments

            }
        }
    }
}