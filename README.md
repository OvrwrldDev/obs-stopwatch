# 🕒 OBS Stopwatch Pro+

A lightweight, professional stopwatch script for OBS Studio built with Lua.  
Perfect for streams, speedruns, challenges, and any timed content.

---

## ✨ Features

- ⏱️ Count-up timer (HH:MM:SS)  
- ⏵ Start, ⏸ Pause, ▶ Resume, 🔁 Reset  
- 🎮 Fully configurable hotkeys  
- 🧠 Accurate time tracking with pause/resume support  
- 🖥️ Outputs to any Text (GDI+/FreeType) source  
- ⚡ Lightweight — no installation or compilation needed  

---

## 📦 Installation

1. Download or copy the script file:  
   `stopwatch_pro_plus.lua`

2. Open OBS and go to:  
   **Tools → Scripts**

3. Click **“+”** and select the `.lua` file.

4. In the script settings:  
   - Select your **Text Source** (Name it Timer and type it into the Text Source Box in the script selector, then press your start hotkey for it to activate, then pause it, and restart it for it to stay on screen) .

---

## ⚙️ Setup

### 1. Create a Text Source
- Add a **Text (GDI+)** or **Text (FreeType 2)** source in OBS  
- This will display the stopwatch  

### 2. Assign Hotkeys
Go to:  
**Settings → Hotkeys**

Set keys for:
- Stopwatch Start  
- Stopwatch Pause  
- Stopwatch Resume  
- Stopwatch Reset  

---

## 🎮 Usage

- Press **Start** to begin the timer  
- Press **Pause** to freeze time  
- Press **Resume** to continue  
- Press **Reset** to return to `00:00:00`  

---

## 💅 Styling Tips

- Use clean fonts like **Consolas**, **Roboto Mono**, or **Montserrat**  
- Add outline or drop shadow for readability  
- Position it within your stream overlay  

---

## 🛠️ Requirements

- OBS Studio (Lua scripting enabled — included by default)

---

## 📄 License

Free to use and modify.
