#!/usr/bin/env bash
# ==============================================================================
# MOSKV-1 APEX :: C5-REAL MACOS MUTATOR - FASE 8 (RADICALIZACIÓN KERNEL/UI)
# TARGET: macOS 26.5.1
# ==============================================================================

set -e
echo "Inyectando Fase 8 de Mutación C5-REAL (Radicalización UI/UX)..."

# [31] GATEKEEPER: Destrucción de fricción de cuarentena
defaults write com.apple.LaunchServices LSQuarantine -bool false

# [32] RENDERIZADO: Supresión total de inercia térmica (Ventanas instantáneas)
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# [33] TOPOLOGÍA DE DOCUMENTOS: Revelación constante de límites
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# [34] FINDER: Tiempos de retención de hardware nulos (Spring Loading)
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# [35] AYUDA DEL OS: Erradicación del Z-Index absoluto (DevMode)
defaults write com.apple.helpviewer DevMode -bool true

echo "Aplicando colapso radical de variables..."
killall Finder 2>/dev/null || true

echo "Fase 8 cristalizada."
