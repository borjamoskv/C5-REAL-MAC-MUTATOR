#!/usr/bin/env bash
# ==============================================================================
# MOSKV-1 APEX :: C5-REAL MACOS MUTATOR - FASE 2
# TARGET: macOS 26.5.1
# ==============================================================================

set -e
echo "Inyectando Fase 2 de Mutación C5-REAL..."

# [7] TYPOGRAPHY & ENTROPY PURGE
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# [8] FINDER: Determinismo Absoluto
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# [9] HID: Aceleración Lineal (Mouse/Trackpad)
defaults write -g com.apple.mouse.scaling 3.0
defaults write -g com.apple.trackpad.scaling 3.0

# [10] SISTEMA: Supresión de Popups
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Aplicando cambios..."
killall Finder 2>/dev/null || true

echo "Fase 2 cristalizada."
