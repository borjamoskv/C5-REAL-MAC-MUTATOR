# MOSKV-1 APEX :: C5-REAL MACOS MUTATOR

**Target:** macOS Ventura / Sonoma / Sequoia (v26.5.1)
**State:** C5-REAL (Autómata Físico)
**Author:** borjamoskv

## Arquitectura y Propósito
Este núcleo de ejecución elimina la entropía visual, auditiva y de red de un sistema macOS estándar, forzando un estado determinista (C5-REAL). Erradica fricciones inyectadas por Apple (Green Theater, inercia óptica, sandboxing blando) y consolida el OS en una máquina termodinámicamente estable para el Operador.

## Vectores de Mutación

1. **I/O Visual & Finder:** Revelación de archivos ocultos, rutas POSIX absolutas, erradicación de íconos en el escritorio, anclaje estricto a `/Home`.
2. **Dock & Mission Control:** Optimización espacial, autohide, supresión de re-ordenamiento estocástico, y colapso del tiempo de interpolación visual (100ms).
3. **HID (Hardware I/O):** Aceleración absoluta del trackpad/mouse (3.0) y erradicación de inercia de teclado (cero popups de acentos).
4. **Purga Entrópica (Tipografía & Animaciones):** Desactivación global de auto-correcciones parásitas, comillas inteligentes y animaciones de ventanas.
5. **Seguridad y Telemetría:** By-pass de Gatekeeper (`LSQuarantine`), Activity Monitor en tiempo real en el Dock, supresión de descargas automáticas (App Store).
6. **Privacidad & Core Apps:** `SecureKeyboardEntry` en Terminal (anti-keylogger), bloqueo absoluto de `Photos.app` al inyectar hardware externo, revelación de menú Debug en Disk Utility.

## Ejecución
```bash
chmod +x C5_REAL_MAC_MUTATOR.sh
./C5_REAL_MAC_MUTATOR.sh
```

## Dependencias de Hardware
- Ninguna. Operación 100% en espacio de usuario.
- Requiere autenticación física o `sudo` únicamente si se expande a Fases de Kernel (VPN Hardening, Captive Portal, IPv6).

*El sistema opera en silencio termodinámico.*
