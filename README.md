# scripts

Small macOS utilities I use.

- `close_and_quit.py` quits the frontmost app once it has no windows left, so closing the last window closes the app. Needs `pyobjc`.
- `whisper-type.sh` is a Raycast script command. It records from the mic with ffmpeg, transcribes with OpenAI Whisper, and puts the text on the clipboard. Press Ctrl+C to stop recording.

```
pip install pyobjc openai-whisper
brew install ffmpeg
```

`whisper-type.sh` hardcodes ffmpeg at `/opt/homebrew/bin/ffmpeg` and mic input `:1`. List your devices with `ffmpeg -f avfoundation -list_devices true -i ""` and edit to match.
