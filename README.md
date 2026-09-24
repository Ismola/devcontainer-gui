# Dev Containers GUI authorization

Pequeña configuración de autostart para escritorios Linux que permite utilizar aplicaciones gráficas X11 desde VS Code Dev Containers.

## Qué hace

Al iniciar la sesión gráfica, `devcontainer-gui.desktop` ejecuta `enable-devcontainer-gui`. El script:

1. Localiza `xhost` y obtiene el usuario actual sin guardar rutas ni usuarios concretos.
2. Ejecuta `xhost +SI:localuser:<usuario>`.
3. Reintenta durante un máximo de 20 segundos porque X11/XWayland puede no estar preparado cuando comienza el autostart.
4. Termina en cuanto obtiene autorización.

La autorización se limita al usuario local. El proyecto no utiliza `xhost +`, que permitiría conectarse al servidor X a cualquier cliente.

## Qué no hace

- No instala ni configura VS Code, Docker o Dev Containers.
- No comparte por sí solo los sockets X11 o Wayland con un contenedor.
- No concede acceso a `root` ni a otros usuarios.
- No configura Chromium, su aceleración gráfica, el backend Ozone, monitores o resoluciones.

VS Code debe seguir reenviando el display al devcontainer. Esta configuración solo concede al usuario local acceso al servidor X11/XWayland del host.

## Requisitos

- Linux con una sesión X11 o XWayland.
- `xhost`, normalmente incluido en el paquete `x11-xserver-utils` o equivalente.
- Un entorno de escritorio compatible con archivos XDG Autostart. Se incluye `X-KDE-autostart-after=panel` para KDE Plasma; otros escritorios ignoran esa extensión.

## Instalación

```sh
git clone https://github.com/Ismola/devcontainer-gui.git
cd devcontainer-gui
./install.sh
```

La autorización comenzará automáticamente en el siguiente inicio de sesión. Para aplicarla en la sesión actual:

```sh
~/.local/bin/enable-devcontainer-gui
```

## Desinstalación

```sh
./uninstall.sh
```

Cierra la sesión para descartar la autorización ya aplicada por `xhost`.

## Archivos instalados

| Origen | Destino |
|---|---|
| `enable-devcontainer-gui` | `~/.local/bin/enable-devcontainer-gui` |
| `devcontainer-gui.desktop` | `~/.config/autostart/devcontainer-gui.desktop` |

## Licencia

MIT
