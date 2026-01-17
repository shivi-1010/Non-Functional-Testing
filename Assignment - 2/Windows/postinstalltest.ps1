# Check Apache 2
if (Get-Command apache2 -ErrorAction SilentlyContinue) {
    Write-Output "Apache 2.4 is installed"
}
else {
    Write-Output "Apache 2.4 is not installed"
}

# Check PHP 7.2
if (Get-Command php7.2 -ErrorAction SilentlyContinue) {
    Write-Output "PHP 7.2 is installed"
}
else {
    Write-Output "PHP 7.2 is not installed"
}

# Check PostgreSQL 14
if (Get-Command pg_config -ErrorAction SilentlyContinue) {
    Write-Output "PostgreSQL 14 is installed"
}
else {
    Write-Output "PostgreSQL 14 is not installed"
}

# Check Python 3.7
if (Get-Command python3.7 -ErrorAction SilentlyContinue) {
    Write-Output "Python 3.7 is installed"
}
else {
    Write-Output "Python 3.7 is not installed"
}

# Check Python libraries
$pythonLibraries = @("beautifulsoup4", "freezegun", "ll-xist", "lxml", "pillow>=2.3", "psycopg2", "python-ldap", "Sphinx")
foreach ($library in $pythonLibraries) {
    if (Get-Command pip3 -ErrorAction SilentlyContinue) {
        if ((pip3 list --format=columns) -like "*$library*") {
            Write-Output "$library is installed"
        }
        else {
            Write-Output "$library is not installed" 
        }
    }
    else {
        Write-Output "pip3 is not installed, cannot check libraries"
    }
}


function is_installed($command) {
    if (Get-Command $command -ErrorAction SilentlyContinue) {
        Write-Output "$command is installed"
    }
    else {
        Write-Output "$command is not installed"
    }
}


function is_versiondefault($command) {
    if (is_installed $command) {
        $version = & $command --version 2>&1 | Select-String -Pattern '(\d+\.?)+[^\.]' -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }
        $default_version = Get-Content /etc/chocolatey/chocolatey.config | Where-Object { $_ -match "^default: $command" } | ForEach-Object { ($_ -split ' ')[2] } | Select-String -Pattern '(\d+\.?)+[^\.]' -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value }

        if ($version -eq $default_version) {
            Write-Output "$command version $version is the default version."
        }
        else {
            Write-Output "$command version $version is not the default version. The default version is $default_version."
        }
    }
}



# Check Apache 2
is_installed apache2

# Check PHP 7.2
is_installed php7.2

# Check PostgreSQL 14
is_installed pg_config

# Check Python 3.7
is_installed python3.7

# Check Python libraries
$pythonLibraries = @("beautifulsoup4", "freezegun", "ll-xist", "lxml", "pillow>=2.3", "psycopg2", "python-ldap", "Sphinx")
foreach ($library in $pythonLibraries) {
    if (Get-Command pip3 -ErrorAction SilentlyContinue) {
        if ((pip3 list --format=columns) -like "*$library*") {
            Write-Output "$library is installed"
        }
        else {
            Write-Output "$library is not installed" 
        }
    }
    else {
        Write-Output "pip3 is not installed, cannot check libraries"
    }
}