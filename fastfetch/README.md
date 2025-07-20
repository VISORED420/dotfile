# Fastfetch Custom Configuration 🐱

## Colorful Minimalist Theme with Cat Image

This configuration features:
- **🌈 Colorful yet minimalist design**
- **🐱 Cute cat image as logo**
- **🎨 Nerd Font icons for each category**
- **✨ Clean, focused information display**

## Cat Image Setup 🐾

I've already downloaded a cute cat image for you! It's located at:
```
~/.config/fastfetch/images/cat.png
```

### To use your own cat image:
1. **Replace the existing cat.png** with your favorite cat photo
2. **Or add a new image** and update the config:
   ```json
   "source": "~/.config/fastfetch/images/your-cat-name.png",
   ```

### Cat Image Sources 📷
- **Placekitten**: https://placekitten.com/200/200
- **Your own cat photos**
- **Cat memes or art**
- **ASCII cat art** (save as .txt file)

## Color Scheme 🎨
**Vibrant minimalist palette:**
- **🔵 Blue**: OS & Separator
- **🟢 Green**: Kernel & CPU
- **🟡 Yellow**: Uptime & Memory
- **🟣 Magenta**: Username & Packages
- **🔴 Red**: WM & GPU
- **🔷 Cyan**: Hostname & Shell
- **⚪ White**: Output values

## Features ✨
- **Essential info only** (no clutter)
- **Nerd Font icons** for visual appeal
- **Color-coded categories** for quick scanning
- **Perfect size cat image** (200x200px)

## Testing Your Configuration 🚀
```bash
fastfetch
```

## Fallback Options
If the cat image doesn't work:
1. **Use built-in cat ASCII**: Uncomment `"source": "cat",` in config
2. **Download different cat**: Replace `cat.png` with another image
3. **Use other logos**: `arch`, `linux`, `none`