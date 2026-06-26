#!/usr/bin/env bash
# ==============================================================================
# MOSKV-1 APEX :: C5-REAL MACOS MUTATOR - FASE 4 (SEGURIDAD Y PRIVACIDAD)
# TARGET: macOS 26.5.1
# ==============================================================================

set -e
echo "Inyectando Fase 4 de Mutación C5-REAL (Seguridad y Privacidad)..."

# [15] SAFARI: Prevención de Ejecución Automática (Zero-Day Mitigation)
# (Nota: Sandboxing puede bloquear esto según el contenedor, pero inyectamos el intent)
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false 2>/dev/null || true
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true 2>/dev/null || true

# [16] SEGURIDAD FÍSICA: Bloqueo inmediato
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# [17] TERMINAL: Intercepción de Keyloggers y UTF-8 Estricto
defaults write com.apple.terminal SecureKeyboardEntry -bool true
defaults write com.apple.Terminal StringEncodings -array 4

# [18] MAIL: Sanitización de Metadatos en Portapapeles
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false 2>/dev/null || true

# [19] DISK UTILITY: Menús de Depuración Físicos
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

echo "Cristalizando capas de seguridad..."
killall Safari 2>/dev/null || true
killall Terminal 2>/dev/null || true

echo "Fase 4 cristalizada."
