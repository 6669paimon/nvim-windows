Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Chord "Ctrl+d" -Function DeleteChar
# Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord
Set-PSReadLineKeyHandler -Chord "Ctrl+spacebar" -Function AcceptSuggestion

# ReadLine custom color
Set-PSReadLineOption -Colors @{
  "Parameter" = "#2CA198"
  "Command"   = "#21d1c0"
  "InlinePrediction" = "#5A7A7A"
  # "InlinePrediction" = "#477778"
}


# Fzf color
# $ENV:FZF_DEFAULT_OPTS=@"
# --color=marker:#fd5e3a,fg+:#66def9,prompt:#35b5ff,hl+:#fd5e3a
# "@

# Fzf color
$ENV:FZF_DEFAULT_OPTS=@"
--color=bg+:#1d323d,bg:#000B0F,spinner:#fd5e3a,hl:#6cb6ff
--color=fg:#3c6378,header:#6cb6ff,info:#35b5ff,pointer:#48AEF5
--color=marker:#fd5e3a,fg+:#66def9,prompt:#35b5ff,hl+:#fd5e3a
"@

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider "Ctrl+Alt+f" -PSReadlineChordReverseHistory "Ctrl+r"


Set-Alias ls eza-ls
Set-Alias la eza-la
Set-Alias ll eza-ll
Set-Alias e nvim
Set-Alias vim	nvim
Set-Alias rm	"C:\Program Files\Git\usr\bin\rm"
Set-Alias grep	"C:\Program Files\Git\usr\bin\grep"
Set-Alias less	"C:\Program Files\Git\usr\bin\less"
Set-Alias mkdir	"C:\Program Files\Git\usr\bin\mkdir"
Set-Alias touch	"C:\Program Files\Git\usr\bin\touch"

function x { exit }
function .. { cd ..  }
function ... { cd ../..  }
function ga { git add @Args }
function gs { git status @Args }
function gg { git commit -m @Args }
function prc { nvim "$PROFILE" }
function trc { nvim "C:\Users\mai\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" }

function eza-ls {
   eza --group-directories-first --icons --color @Args
 }

function eza-ll {
   eza --group-directories-first --color --icons -l @Args
}

function eza-la {
   eza --group-directories-first --color --icons -lah @Args
}

function tree {
   eza --group-directories-first --color --icons --tree @Args
}

# function update {
#   scoop list | foreach { scoop update $_.Name }
# }

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function bak {
param (
    [string]$file
  )

  # Check if the file has a .bak extension
  if ($file -match "\.bak$") {
    # If the file is a backup (.bak), rename it back to the original file
    $originalFile = $file -replace "\.bak$", ""
    if (Test-Path $originalFile) {
      # Prompt user for confirmation to replace the existing file
      $response = Read-Host "File '$originalFile' already exists. Do you want to replace it? (Y/n)"
      if ($response -eq "" -or $response -match "^[Yy]$") {
        # Remove the existing original file before renaming
        Remove-Item -Path $originalFile -Force
        Rename-Item -Path $file -NewName $originalFile
        Write-Host "Restored '$file' to '$originalFile'."
      } else {
        Write-Host "Operation canceled. '$originalFile' was not replaced."
      }
    } else {
      Rename-Item -Path $file -NewName $originalFile
      Write-Host "Restored '$file' to '$originalFile'."
    }
  } else {
    # If the file is not a .bak, create a backup of the file
    $backupFile = "$file.bak"
    if (Test-Path $backupFile) {
      # Prompt user for confirmation to replace the existing backup file
      $response = Read-Host "Backup file '$backupFile' already exists. Do you want to replace it? (Y/n)"
      if ($response -eq "" -or $response -match "^[Yy]$") {
        # Remove the existing backup file before creating a new backup
        Remove-Item -Path $backupFile -Force
        Copy-Item -Path $file -Destination $backupFile
        Write-Host "Backed up '$file' to '$backupFile' (replaced existing backup)."
      } else {
        Write-Host "Operation canceled. '$backupFile' was not replaced."
      }
    } else {
      Copy-Item -Path $file -Destination $backupFile
      Write-Host "Backed up '$file' to '$backupFile'."
    }
  }
}

Invoke-Expression (&starship init powershell)
