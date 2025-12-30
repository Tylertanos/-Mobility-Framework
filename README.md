# Mobility Framework (Roblox)

A modular, client-side mobility and UI framework designed for Roblox projects.

This framework focuses on:
- Clean architecture
- Touch-friendly controls
- Modular systems (dash, camera lock, target lock)
- Themeable and configurable UI
- Mobile and PC compatibility

---

## ✨ Features

- Modular UI system with tabs and toggles
- Theme system (dark / neon / custom)
- Draggable and editable UI layout
- Session-based UI position saving
- Mobile radial menu support
- Dash, camera lock, and lock-on systems
- Indicator visuals for locked targets

---

## 📁 Project Structure

📦 mobility-framework
│
├─ 📁 src
│   ├─ MainLoader.lua
│   │
│   ├─ 📁 Modules
│   │   ├─ UIManager.lua
│   │   ├─ ThemeManager.lua
│   │   ├─ DragManager.lua
│   │   ├─ SaveManager.lua
│   │   ├─ Dash.lua
│   │   ├─ LockOn.lua
│   │   ├─ RadialMenu.lua
│   │   └─ Indicators.lua
│   │
│   └─ 📁 UI
│       ├─ MainGui.lua
│       ├─ Tabs.lua
│       └─ Components.lua
│
├─ 📁 config
│   ├─ Settings.lua
│   ├─ Theme.lua
│   ├─ Keybinds.lua
│   └─ SavedUI.lua
│
├─ 📁 build
│   └─ packed.lua          # single-file version (optional)
│
├─ README.md
├─ LICENSE
└─ .gitignore
