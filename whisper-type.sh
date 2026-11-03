#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Voice to Clipboard
# @raycast.mode silent

FFMPEG=/opt/homebrew/bin/ffmpeg
WHISPER="$(command -v whisper)"

TMPFILE=$(mktemp /tmp/voiceXXXXXX)
WAVFILE="${TMPFILE}.wav"

echo "Recording... press Ctrl+C to stop"
$FFMPEG -f avfoundation -i ":1" -ar 16000 -ac 1 "$WAVFILE" 2>/tmp/ffmpeg_log.txt &
FFMPEG_PID=$!

trap "kill $FFMPEG_PID 2>/dev/null" INT
wait $FFMPEG_PID

sleep 0.5

if [ ! -s "$WAVFILE" ]; then
  echo "No audio captured."
  exit 1
fi

echo "Transcribing..."
$WHISPER "$WAVFILE" --model base --output_format txt --output_dir /tmp 2>/dev/null
BASENAME=$(basename "$WAVFILE" .wav)
TEXT=$(cat "/tmp/${BASENAME}.txt" 2>/dev/null)

echo "$TEXT" | pbcopy
echo "Done: $TEXT"

rm -f "$TMPFILE" "$WAVFILE" "/tmp/${BASENAME}.txt"
