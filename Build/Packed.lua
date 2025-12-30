- **MainLoader** connects all systems
- **Modules** handle behavior only
- **UI** handles visuals only
- **Config** stores user preferences and themes

---

## 🚀 Usage

1. Place all files under a LocalScript environment
2. Run `MainLoader.lua`
3. Use the UI to toggle and configure systems
4. (Optional) Use `build/packed.lua` for single-file distribution

---

## 🎨 Themes

Themes are defined in `config/Theme.lua`.

Switch themes at runtime using:
```lua
ThemeManager:SetTheme("Neon")
