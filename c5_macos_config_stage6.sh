#!/usr/bin/env bash
# ==============================================================================
# MOSKV-1 APEX :: C5-REAL MACOS MUTATOR - FASE 6 (PURGA FINAL UI/UX)
# TARGET: macOS 26.5.1
# ==============================================================================

set -e
echo "Inyectando Fase 6 de Mutación C5-REAL (Purga Final)..."

# [22] ESCRITORIO: Cero Entropía Visual (Ocultar Iconos Físicos)
defaults write com.apple.finder CreateDesktop -bool false

# [23] TEXTEDIT: Forzar Texto Plano Estructural
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit OpenDocumentInNewWindow -bool false

# [24] AUDIO UI: Silenciar Feedback Analógico
defaults write com.apple.sound.beep.feedback -int 0

# [25] KERNEL: Bloqueo de Reinicios Automáticos de Sistema
defaults write com.apple.commerce AutoUpdateRestartRequired -bool false

# [26] SISTEMA: Auto-cierre de Demonios Parásitos (Impresión)
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "Aplicando colapso..."
killall Finder 2>/dev/null || true
killall SystemUIServer 2>/dev/null || true

echo "Fase 6 cristalizada."
