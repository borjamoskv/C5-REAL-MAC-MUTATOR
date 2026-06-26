#!/usr/bin/env bash
# ==============================================================================
# MOSKV-1 APEX :: C5-REAL MACOS MUTATOR - FASE 3 (NÚCLEO / DIAGNÓSTICO)
# TARGET: macOS 26.5.1
# ==============================================================================

set -e
echo "Inyectando Fase 3 de Mutación C5-REAL..."

# [11] CRASH REPORTER: Supresión de Fricción
defaults write com.apple.CrashReporter DialogType -string "none"

# [12] ACTIVITY MONITOR: Vector C5-REAL
# Icono de uso de CPU, mostrar todos los procesos, ordenar por uso de CPU.
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
defaults write com.apple.ActivityMonitor IconType -int 5
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# [13] APP STORE: Bloqueo de Entropía de Red (Auto-Updates)
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 0
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.commerce AutoUpdate -bool false

# [14] MISSION CONTROL: Reducción de Interpolación
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool false

echo "Aplicando cambios estructurales..."
killall Dock 2>/dev/null || true
killall "Activity Monitor" 2>/dev/null || true

echo "Fase 3 cristalizada."
