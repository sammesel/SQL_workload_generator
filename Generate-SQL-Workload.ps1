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
$labelInstance.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelInstance) 

$textBoxInstance = New-Object System.Windows.Forms.TextBox
$textBoxInstance.top=60
$textBoxInstance.left= 350
$textBoxInstance.width = 600
$textBoxInstance.height = 60
$textBoxInstance.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBoxInstance)


$labelDatabase = New-Object System.Windows.Forms.Label
$labelDatabase.top = 120
$labelDatabase.left = 30
$labelDatabase.width = 300
$labelDatabase.height = 60
$labelDatabase.Text = 'Database Name:'
$labelDatabase.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelDatabase)

$textBoxDatabase = New-Object System.Windows.Forms.TextBox
$textBoxDatabase.top=120
$textBoxDatabase.left= 350
$textBoxDatabase.width = 600
$textBoxDatabase.height = 60
$textBoxDatabase.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBoxDatabase)

$labelUsername = New-Object System.Windows.Forms.Label
$labelUsername.top = 180
$labelUsername.left = 30
$labelUsername.width = 300
$labelUsername.height = 60
$labelUsername.Text = '     Username:'
$labelUsername.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelUsername)

$textBoxUsername = New-Object System.Windows.Forms.TextBox
$textBoxUsername.top= 180
$textBoxUsername.left= 350
$textBoxUsername.width = 600
$textBoxUsername.height = 60
$textBoxUsername.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textBoxUsername)


$labelPassword = New-Object System.Windows.Forms.Label
$labelPassword.top = 240
$labelPassword.left = 30
$labelPassword.width = 300
$labelPassword.height = 60
$labelPassword.Text = '     Password:'
$labelPassword.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelPassword)

$textboxpassword = New-Object Windows.Forms.MaskedTextBox
$textboxpassword.PasswordChar = '*'
$textboxpassword.Top  = 240
$textboxpassword.Left = 350
$textboxpassword.Width  = 600
$textboxpassword.Height = 900
$textboxpassword.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxpassword)


$labelWorkload = New-Object System.Windows.Forms.Label
$labelWorkload.top = 300
$labelWorkload.left = 30
$labelWorkload.width = 300
$labelWorkload.height = 60
$labelWorkload.Text = '     Workload:'
$labelWorkload.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelWorkload)


$listBox = New-Object System.Windows.Forms.ListBox
$listBox.top= 300
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
$ListBox.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($listBox)

$labelSessions = New-Object System.Windows.Forms.Label
$labelSessions.top = 660
$labelSessions.left = 30
$labelSessions.width = 300
$labelSessions.height = 60
$labelSessions.Text = '# of Sessions:'
$labelSessions.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelSessions)

$textboxSessions = New-Object Windows.Forms.MaskedTextBox
$textboxSessions.Top  = 660
$textboxSessions.Left = 350
$textboxSessions.Width  = 60
$textboxSessions.Height = 900
$textboxSessions.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxSessions)

$labelrepetitions = New-Object System.Windows.Forms.Label
$labelrepetitions.top = 720
$labelrepetitions.left = 30
$labelrepetitions.width = 300
$labelrepetitions.height = 60
$labelrepetitions.Text = '# repetitions:'
$labelrepetitions.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelrepetitions)

$textboxRepetitions = New-Object Windows.Forms.MaskedTextBox
$textboxRepetitions.Top  = 720
$textboxRepetitions.Left = 350
$textboxRepetitions.Width  = 60
$textboxRepetitions.Height = 900
$textboxRepetitions.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxRepetitions)

$labelTimeout = New-Object System.Windows.Forms.Label
$labelTimeout.top = 780
$labelTimeout.left = 30
$labelTimeout.width = 300
$labelTimeout.height = 60
$labelTimeout.Text = '  Timeout (s):'
$labelTimeout.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($labelTimeout)


$textboxTimeout = New-Object Windows.Forms.MaskedTextBox
$textboxTimeout.Top  = 780
$textboxTimeout.Left = 350
$textboxTimeout.Width  = 60
$textboxTimeout.Height = 900
$textboxTimeout.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($textboxTimeout)


$chkbox_showdebug = New-Object System.Windows.Forms.CheckBox
$chkbox_showdebug.text = "debug start-process"
$chkbox_showdebug.Top  = 840
$chkbox_showdebug.Left = 350
$chkbox_showdebug.Width  = 600
$chkbox_showdebug.Height = 60
$chkbox_showdebug.Font = New-Object System.Drawing.Font("Lucida Console",20,[System.Drawing.FontStyle]::Regular)
$chkbox_showdebug.checked = -1
$chkbox_showdebug.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($chkbox_showdebug)


#$chkbox_showUsernamePassword = New-Object System.Windows.Forms.CheckBox
#$chkbox_showUsernamePassword.text = "Show Username/Password"
#$chkbox_showUsernamePassword.Top  = 900
#$chkbox_showUsernamePassword.Left = 450
#$chkbox_showUsernamePassword.Width  = 750
#$chkbox_showUsernamePassword.Height = 60
#$chkbox_showUsernamePassword.Font = New-Object System.Drawing.Font("Lucida Console",20,[System.Drawing.FontStyle]::Regular)
#$form.Controls.Add($chkbox_showUsernamePassword)


$chkbox_showOstress = New-Object System.Windows.Forms.CheckBox
$chkbox_showOstress.text = "Show OSTRESS"
$chkbox_showOstress.Top  = 900
$chkbox_showOstress.Left = 350
$chkbox_showOstress.Width  = 600
$chkbox_showOstress.Height = 60
$chkbox_showOstress.Font = New-Object System.Drawing.Font("Lucida Console",20,[System.Drawing.FontStyle]::Regular)
$chkbox_showOstress.checked = -1
$chkbox_showOstress.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.Controls.Add($chkbox_showOstress)

$form.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)


$okButton = New-Object System.Windows.Forms.Button
$okButton.Top= 990
$okButton.Left= 150
$okButton.Width= 210
$okButton.Height= 60
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$okButton.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Top= 990
$cancelButton.Left= 450
$cancelButton.Width= 210
$cancelButton.Height= 60
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$cancelButton.Font = New-Object System.Drawing.Font("Lucida Console",24,[System.Drawing.FontStyle]::Regular)
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)


# read entries from last-execution if file exists


$lastexecpath = 'exec_Ostress.txt'
if (Test-Path -LiteralPath $lastexecpath) {
    $content = Get-Content -Path $lastexecpath
    $textBoxInstance.text = $content[0]
    $textBoxDatabase.text = $content[1]
    $textBoxUsername.text = $content[2]
    $textBoxPassword.text = $content[3]
    $textboxSessions.text = $content[4]
    $textboxRepetitions.text = $content[5]
    $textboxTimeout.text = $content[6]
#} else {
#    "Path doesn't exist: $path"
}


$form.Topmost = $true

$form.Add_Shown({$textBoxInstance.Select()})
$result = $form.ShowDialog()

[string]$srv
[string]$database
[string]$user
[string]$Pass
[string]$sessions
[string]$repeats
[string]$timeout
[string]$args

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
        $textBoxPassword.text | Out-File -FilePath $lastexecpath -Append
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
            $paths = 'databasewatcher_TestConnection'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path -Recurse # -Verbose
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\Connection_test.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_TestConnection" -T146' 

            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args 
        }

    '1' {    
            # remove previous execution:
            $paths = 'databasewatcher_CompileWorkload'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Compile_Workload.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_CompileWorkload" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -ArgumentList $args 

        }         

    '2' {
            # remove previous execution:
            $paths = 'databasewatcher_CPU_Stress' , 'databasewatcher_CPU_Stress_setup'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_CPU - setup.sql" -n1 -r1 -t' + $timeout + ' -o"databasewatcher_CPU_Stress_setup" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_CPU.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_CPU_Stress" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        }         

    '3' 
        {    
            # remove previous execution:
            $paths = 'databasewatcher_SQLCPUPower' , 'databasewatcher_SQLCPUCosine' , 'databasewatcher_SQLCPUNumbers' , 'databasewatcher_SQLCPUNumbers_AUX'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\CPU Busy - Power.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_SQLCPUPower" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\CPU Busy - COSine.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_SQLCPUCosine" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\CPU Busy - Numbers Table.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_SQLCPUNumbers" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

        }
    '4' 
        {    
            # remove previous execution:
            $paths = 'databasewatcher_blockers_only'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_blockers.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_blockers_only" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

        } 
    '5' 
        {    
            
            # remove previous execution:
            $paths = 'databasewatcher_Sargability'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Sargability.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_Sargability" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args


        } 

    '6' {    
            # remove previous execution:
            $paths = 'databasewatcher_ExecutionPlan'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_ExecutionPlan.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_ExecutionPlan" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        }

    '7' {    
            # remove previous execution:
            $paths = 'databasewatcher_Cursors'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Cursors.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_Cursors" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    '8' {    
            # remove previous execution:
            $paths = 'databasewatcher_Errors'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Errors.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_Errors" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    '9' {    
            # remove previous execution:
            $paths = 'databasewatcher_TempDBResults'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\Stress_TempDB.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_TempDBResults" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        }

    'A' {    
            # remove previous execution:
            $paths = 'databasewatcher_CPURunner'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_CPURunner.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_CPURunner" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    'B' {    
            # remove previous execution:
            $paths = 'databasewatcher_HeavyQuery'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_HeavyQuery.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_HeavyQuery" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    'C' {

            $paths = 'databasewatcher_Dynamic_Workload'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Dynamic_Workload.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_Dynamic_Workload" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        }

    'D' {    
            # remove previous execution:
            $paths = 'databasewatcher_MemoryGrant'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_MemoryGrant.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_MemoryGrant" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    'E' {
            # remove previous execution:
            $paths = 'databasewatcher_KeysetCursor'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\STRESS 103 - KEYSET CURSOR for UPDATE Person.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_KeysetCursor" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    'F' {
            # remove previous execution:
            $paths = 'databasewatcher_UPDATECursor'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\STRESS 101 - UPDATE Person Cursor.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_UPDATECursor" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        }

    'G' {
            # remove previous execution:
            $paths = 'databasewatcher_READONLYCursor'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\STRESS 102 - READONLY Cursor Person.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_READONLYCursor" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    'H' {
            # remove previous execution:
            $paths = 'databasewatcher_InsertEnlargedSales'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_EnlargeSalesTables.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_InsertEnlargedSales" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
        } 

    'I' {
            # remove previous execution:
            $paths = 'databasewatcher_CPU_SETUP' , 'databasewatcher_ParamSniffing' , 'databasewatcher_CPU', 'databasewatcher_Hash', 'databasewatcher_PARAMETERIZATION', 'databasewatcher_Recompile', 'databasewatcher_High_CPU'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_CPU - setup.sql" -n1 -r1 -t' + $timeout + ' -o"databasewatcher_CPU_SETUP" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_ParamSniffing - setup.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_ParamSniffing_SETUP" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_ParamSniffing.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_ParamSniffing" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_CPU.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_CPU" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Hash.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_Hash" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_PARAMETERIZATION.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_PARAMETERIZATION" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Recompile.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_Recompile" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_HighCPU.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_HighCPU" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

        }


    'J' { # J for TempDB small/med/large #tables

            # remove previous execution:
            $paths = 'databasewatcher_TempDB_Objects' , 'databasewatcher_TempDB_Objects_small' , 'databasewatcher_TempDB_medsize', 'databasewatcher_TempDB_Objects_large'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\tempstress_ddl.sql" -n1 -r1 -t' + $timeout + ' -o"databasewatcher_TempDB_Objects" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\gen_tempstress_small.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_TempDB_Objects_small" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\gen_tempstress_medsize.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_TempDB_Objects_medsize" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\gen_tempstress_large.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_TempDB_Objects_large" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

        }


    'K' { # K for WriteLog med/large tables

            # remove previous execution:
            $paths = 'databasewatcher_WriteLog_Objects' , 'databasewatcher_WriteLog_Objects_small' , 'databasewatcher_WriteLog_Objects_medsize', 'databasewatcher_WriteLog_Objects_large'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\WriteLog_ddl.sql"       -n1 -r1 -t' + $timeout + ' -o"databasewatcher_WriteLog_Objects" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\gen_WriteLog_small.sql"   -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_WriteLog_Objects_small" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\gen_WriteLog_medsize.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_WriteLog_Objects_medsize" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\gen_WriteLog_large.sql"   -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_WriteLog_Objects_large" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

        }



    'L' { # 'L for Deadlocks'

            # remove previous execution:
            $paths = 'databasewatcher_deadlock_setup' , 'databasewatcher_deadlock_session_1' , 'databasewatcher_deadlock_session_2'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Deadlock_Setup.sql"     -n1 -r1 -t' + $timeout + ' -o"databasewatcher_deadlock_setup" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Deadlock_Session_1.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_deadlock_session_1" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_Deadlock_Session_2.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_deadlock_session_2" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

        }

    'M' { # 'M for Attentions'

            # remove previous execution:
            $paths = 'databasewatcher_attentions_JoinPredicate' , 'databasewatcher_attentions_LockEscalation_setup' , 'databasewatcher_attentions_LockEscalation' , 'databasewatcher_attentions_AutoStats' , 'databasewatcher_attentions_HashWarnings', 'databasewatcher_attentions_SortWarnings'
            foreach ($path in $paths) {
                if (Test-Path -LiteralPath $path) {
                    Remove-Item -LiteralPath $path  -Recurse # -Verbose 
                #} else {
                #   "Path doesn't exist: $path"
                }
            }
            # lock-escalation-setup:
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_LockEscalation_Setup.sql"     -n1 -r1 -t' + $timeout + ' -o"databasewatcher_attentions_LockEscalation_setup" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args
            # lock-escalation-workload
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_LockEscalation_Workload.sql"  -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_attentions_LockEscalation" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_attentions_JoinPredicate.sql" -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_attentions_JoinPredicate" -q -T146'
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

            # sort warning
            $args = '-S"' + $srv + '" -U"' +$user + '" -P"' + $pass + '" -d"' + $database + '" -i"TSQL\AdventureWorks_attentions_SortWarning.sql"   -n' + $sessions + ' -r' + $repeats + ' -t' + $timeout + ' -o"databasewatcher_attentions_SortWarnings" -q -T146' 
            if ($chkbox_showdebug.checked) {
                write-host $args.replace($pass,'<password>')
            }
            Start-Process -FilePath "OSTRESS.EXE" -WindowStyle $OSTRESSWindowStyle -ArgumentList $args

        }


    }

}

