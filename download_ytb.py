import argparse
from pathlib import Path
from pytubefix import YouTube, Playlist, exceptions

def download(video_url, audio, playlist, path):
    download_path = Path(path) if path else Path.cwd()
    download_path.mkdir(parents=True, exist_ok=True)
    videos = Playlist(video_url).videos if playlist else [YouTube(video_url)]
    for video in videos:
        try:
            stream = video.streams.get_audio_only() if audio else video.streams.get_highest_resolution()
            if stream is None:
                print(f"Não foi possível encontrar o stream para {video.title}. Pulando...")
                continue
            stream.download(output_path=str(download_path))
            print(f"Download concluído: {video.title}")
        except exceptions.AgeRestrictedError:
            print(f"Vídeo {video.title} ignorado devido a restrição de idade.")

def main():
    parser = argparse.ArgumentParser(description="Baixa vídeos ou playlists do YouTube.")
    parser.add_argument("video_url", nargs="+", help="URL do vídeo ou da playlist.")
    parser.add_argument("--audio", action="store_true", help="Baixar apenas o áudio.")
    parser.add_argument("--playlist", action="store_true", help="Indica que a URL é de uma playlist.")
    parser.add_argument("--path", default=None, help="Caminho de download (opcional, padrão é o diretório atual).")

    args = parser.parse_args()
    video_url = " ".join(args.video_url)
    download(video_url, args.audio, args.playlist, args.path)

if __name__ == "__main__":
    main()
