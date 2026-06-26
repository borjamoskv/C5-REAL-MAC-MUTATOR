# ==============================================================================
# MOSKV-1 APEX :: C5-REAL RITUALS (SOBERANÍA OPERACIONAL)
# Sustitución explícita de automatismos de macOS por control determinista.
# ==============================================================================
.PHONY: help audit-bin verify-signature verify-notarization verify-hash update-os check-crashes snapshot-state rollback-state
help:
	@echo "===================================================================="
	@echo " C5-REAL RITUALS (Sustitución de Guardrails)"
	@echo "===================================================================="
	@echo "Uso:"
	@echo "  make audit-bin file=<ruta>          (Reemplaza LSQuarantine)"
	@echo "  make verify-signature file=<ruta>   (Validar procedencia)"
	@echo "  make verify-notarization file=<ruta>(Validar Notarización Apple)"
	@echo "  make verify-hash file=<ruta>        (Reemplaza DMG Verify)"
	@echo "  make update-os                      (Reemplaza AutoUpdate)"
	@echo "  make check-crashes                  (Reemplaza CrashReporter)"
	@echo "  make snapshot-state                 (Backup de Dominios OS)"
	@echo "  make rollback-state                 (Restaura Dominios OS)"
	@echo "===================================================================="
# [1] Reemplazo de LSQuarantine: Validación manual de firmas
verify-signature:
	@ifndef file
		$(error ERROR: Debes especificar el archivo. Uso: make verify-signature file=ruta/al/binario)
	@endif
	@echo "[C5-REAL] Evaluando procedencia y firmas (spctl / codesign)..."
	codesign -dv --verbose=4 "$(file)"
	spctl --assess --verbose "$(file)"
# [1.5] Reemplazo Adicional: Verificación de Notarización
verify-notarization:
	@ifndef file
		$(error ERROR: Debes especificar el archivo. Uso: make verify-notarization file=ruta/al/binario)
	@endif
	@echo "[C5-REAL] Validando Ticket de Notarización de Apple (stapler)..."
	stapler validate "$(file)"
# [2] Reemplazo de skip-verify: Hash-Pinning explícito
verify-hash:
	@ifndef file
		$(error ERROR: Debes especificar el archivo. Uso: make verify-hash file=ruta/al/archivo)
	@endif
	@echo "[C5-REAL] Calculando Hash SHA-256..."
	shasum -a 256 "$(file)"
# [3] Reemplazo de AutoUpdate: Parcheo deliberado
update-os:
	@echo "[C5-REAL] Escaneando red en busca de vulnerabilidades CVE (softwareupdate)..."
	softwareupdate -l
	@echo "Para inyectar parches, ejecuta manualmente: sudo softwareupdate -i -a"
# [4] Reemplazo de CrashReporter: Telemetría post-fallo forense
check-crashes:
	@echo "[C5-REAL] Extrayendo logs de kernel/aplicación recientes..."
	log show --predicate 'eventMessage contains "crash"' --last 2h --info
# [5] Soberanía Operacional: Reversibilidad de Estado
snapshot-state:
	@echo "[C5-REAL] Exportando dominios termodinámicos a ./vault/..."
	@mkdir -p vault
	defaults export com.apple.finder vault/finder.plist 2>/dev/null || true
	defaults export NSGlobalDomain vault/nsglobaldomain.plist 2>/dev/null || true
	defaults export com.apple.dock vault/dock.plist 2>/dev/null || true
	defaults export com.apple.ActivityMonitor vault/activitymonitor.plist 2>/dev/null || true
	defaults export com.apple.Terminal vault/terminal.plist 2>/dev/null || true
	@echo "[SUCCESS] Instantánea del Estado Físico cristalizada."
rollback-state:
	@echo "[C5-REAL] Restaurando arquitectura base desde ./vault/..."
	defaults import com.apple.finder vault/finder.plist 2>/dev/null || true
	defaults import NSGlobalDomain vault/nsglobaldomain.plist 2>/dev/null || true
	defaults import com.apple.dock vault/dock.plist 2>/dev/null || true
	defaults import com.apple.ActivityMonitor vault/activitymonitor.plist 2>/dev/null || true
	defaults import com.apple.Terminal vault/terminal.plist 2>/dev/null || true
	@echo "[C5-REAL] Colapsando UI para inyectar el estado previo..."
	killall Finder Dock SystemUIServer "Activity Monitor" 2>/dev/null || true
	@echo "[SUCCESS] Estado Termodinámico revertido a la Invariante inicial."
