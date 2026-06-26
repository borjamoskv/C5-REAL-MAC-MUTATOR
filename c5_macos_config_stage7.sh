#!/usr/bin/env bash
# ==============================================================================
# MOSKV-1 APEX :: C5-REAL MACOS MUTATOR - FASE 7 (I/O Y APPS NÚCLEO)
# TARGET: macOS 26.5.1
# ==============================================================================

set -e
echo "Inyectando Fase 7 de Mutación C5-REAL (I/O y Aplicaciones Base)..."

# [27] I/O FÍSICO: Bloqueo de auto-ejecución óptica (Photos.app)
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# [28] SISTEMA DE ARCHIVOS: Eliminación de latencia DMG (Cero Verificación)
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# [29] UI GLOBAL: Expansión determinista de modales de E/S
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# [30] FINDER: Anclaje estricto de nuevas ventanas (Home > Recents)
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo "Aplicando colapso de variables..."
killall Finder 2>/dev/null || true

echo "Fase 7 cristalizada."
