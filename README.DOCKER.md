# Docker Setup for rapidclip-generator

## Overview
This project generates narrated videos using text-to-speech (TTS) services like ElevenLabs and OpenAI. The Docker container provides an isolated environment with all dependencies pre-installed.

## Docker Setup

### 1. Build the Docker Image
Run the following command to build the Docker image:

```bash
docker build -t rapidclip-generator .
```

### 2. Run an Interactive Shell in the Container
Once the image is built, start an interactive shell inside the container:

```bash
docker run -it rapidclip-generator bash
```

## Running the Project
Inside the container, navigate to the `/app` directory (already set in the Dockerfile). Use the following commands to generate videos
### Example with ElevenLabs TTS

```bash
python src/main.py --theme "Space Curiosities (a single curiosity)" \
  --language "en" \
  --voice_id "CstacWqMhJQlnfLPxRG4" \
  --max_duration 60 \
  --tts_service elevenlabs
```

### Example with OpenAI TTS

```bash
python src/main.py --theme "Technology Curiosities (a single curiosity)" \
  --language "en" \
  --max_duration 60 \
  --tts_service openai \
  --openai_tts_model "tts-1-hd" \
  --openai_tts_voice "onyx"
```

## Parameters
| Parameter             | Description                                             | Required |
|----------------------|-----------------------------------------------------|----------|
| `--theme`           | The theme of the script to be created.               | Yes      |
| `--language`        | The language for the script and narration.           | Yes      |
| `--tts_service`     | The TTS service to use (`elevenlabs` or `openai`). Defaults to `elevenlabs`. | No       |
| `--voice_id`        | The voice ID to be used for narration (for ElevenLabs). | Required for ElevenLabs |
| `--openai_tts_model`| The OpenAI TTS model to be used (default: `tts-1-hd`). | No       |
| `--openai_tts_voice`| The OpenAI TTS voice to be used (default: `alloy`).   | No       |
| `--max_duration`    | The maximum allowed duration for the audio (in seconds). | Yes      |

## Output Files
The generated files will be saved in the `output/` folder and include:

- **Narration Audio (`.mp3`)**: The generated speech.
- **Subtitles (`.srt`)**: Synchronized subtitles.
- **Log File (`process.log`)**: Logs of the process, including prompts used.
- **Final Video (`_final.mp4`)**: The completed video with animated transitions (1080x1920 resolution).

