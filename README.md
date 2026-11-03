<div align="center">

# 🛠️ scripts

**Small macOS utilities I use day to day.**

![macOS](https://img.shields.io/badge/macOS-only-000000?style=flat-square&logo=apple&logoColor=white)
![Python](https://img.shields.io/badge/python-pyobjc-3776ab?style=flat-square&logo=python&logoColor=white)
![Bash](https://img.shields.io/badge/bash-raycast-4eaa25?style=flat-square&logo=gnubash&logoColor=white)

</div>

---

## 📂 What's inside

| Script | What it does |
|--------|--------------|
| [`close_and_quit.py`](close_and_quit.py) | Watches the frontmost app and quits it once its last window is closed — the Windows-style "close the window, close the app" behavior on macOS. |
| [`whisper-type.sh`](whisper-type.sh) | A [Raycast](https://raycast.com) script command: records from the mic with ffmpeg, transcribes locally with OpenAI Whisper, and copies the text to the clipboard. |

## 🚀 Setup

**close_and_quit.py**
```bash
pip install pyobjc
python3 close_and_quit.py
```

**whisper-type.sh**
```bash
brew install ffmpeg
pip install openai-whisper
```
Add the script's folder in Raycast (*Extensions → Script Commands*), run **Voice to Clipboard**, speak, then press `Ctrl+C` to stop. Your transcript is on the clipboard.

> ℹ️ `whisper-type.sh` assumes ffmpeg at `/opt/homebrew/bin/ffmpeg` and mic input `:1` — adjust for your machine (`ffmpeg -f avfoundation -list_devices true -i ""`).

---

<div align="center"><sub>Made by <a href="https://github.com/emmanuelhuff7">@emmanuelhuff7</a></sub></div>
