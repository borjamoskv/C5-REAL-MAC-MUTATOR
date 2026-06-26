# ==============================================================================
# MOSKV-1 APEX :: C5-REAL RITUALS (SOBERANÍA OPERACIONAL)
# Sustitución explícita de automatismos de macOS por control determinista.
# ==============================================================================

.PHONY: help audit-bin verify-hash update-os check-crashes

help:
	@echo "===================================================================="
	@echo " C5-REAL RITUALS (Sustitución de Guardrails)"
	@echo "===================================================================="
	@echo "Uso:"
	@echo "  make audit-bin file=<ruta>          (Reemplaza LSQuarantine)"
	@echo "  make verify-hash file=<ruta>        (Reemplaza DMG Verify)"
	@echo "  make update-os                      (Reemplaza AutoUpdate)"
	@echo "  make check-crashes                  (Reemplaza CrashReporter)"
	@echo "===================================================================="

# [1] Reemplazo de LSQuarantine: Validación manual de firmas
audit-bin:
	@ifndef file
		$(error ERROR: Debes especificar el archivo. Uso: make audit-bin file=ruta/al/binario)
	@endif
	@echo "[C5-REAL] Evaluando procedencia y firmas (spctl / codesign)..."
	codesign -dv --verbose=4 "$(file)"
	spctl --assess --verbose "$(file)"

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
