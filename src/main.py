import whisper
import os

model = whisper.load_model("medium")

dir_path = os.path.dirname(os.path.abspath(__file__))

current_path = os.path.dirname(os.path.abspath(__file__))
audios_dir = os.path.join(os.path.dirname(current_path), "audios")
texts_dir = os.path.join(os.path.dirname(current_path), "texts")

for audio_file in os.listdir(audios_dir):
    file_name = audio_file.rsplit('.', 1)[0]
    audio_file_path = os.path.join(audios_dir, audio_file)
    
    text_file_name = file_name + '.txt'
    text_file_path = os.path.join(texts_dir, text_file_name)

    result = model.transcribe(audio_file_path)
    with open(text_file_path, 'w+') as new_file:
        new_file.write(result["text"])
    new_file.close
