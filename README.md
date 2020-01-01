
<h1 align="center">
  <img src="./image/Bibata.png" width="150">
  <br>
  Bibata RGB Cursor
</h1>

<h4 align="center">🚀 Material Based Cursor 🏳️‍🌈</h4>

<p align="center">

Bibata RGB Cursor is based on [Bibata
Cursor](https://github.com/KaizIqbal/Bibata_Cursor/blob/master/README.md). All
credit goes to the author @KaizIqbal.

## Bibata RGB Cursor

Bibata RGB Cursor lets you to create your own Bibata Cursor Theme by specifying
any name and any color. There are also some predefined themes. See `./build.sh
--help` for details.

### Usage Example

In this example we will create a salmon-colored cursor theme.

1. Make sure you have installed all [Build dependencies](#build-dependencies).

2. Build
   ```shell
   git clone https://github.com/SirPscl/Bibata_Cursor_RGB.git
   cd Bibata_Cursor_RGB/
   ./build.sh -n Bibata_Salmon -c "#fa8072"
   ```

3. Install for current user. Settings may be different for your desktop environment, window manager.
   ```shell
   mkdir -p ~/.icons/default/
   cp -r Bibata_Salmon ~/.icons/
   ```
   Set the theme in your `~/.icons/default/index.theme`,
   ```
   [icon theme]
   Inherits=Bibata_Salmon
   ```
   and in `~/.config/gtk-3.0/settings.ini`:
   ```
   gtk-cursor-theme-name=Bibata_Salmon
   gtk-cursor-theme-size=48
   ```
   and in `.Xresources` (or similar):
   ```
   Xcursor.size: 48
   ```
