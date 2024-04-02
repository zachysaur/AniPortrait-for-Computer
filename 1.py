import os
import sys
import subprocess

def main():
    print("Check Models...")
    if not os.path.exists("pretrained_model"):
        print("Downloading AniPortrait...")
        download_model("ZJYang/AniPortrait", "pretrained_model")

    os.chdir("pretrained_model")

    if not os.path.exists("image_encoder"):
        print("Downloading image_encoder...")
        download_model("bdsqlsz/image_encoder", "image_encoder")

    if not os.path.exists("wav2vec2-base-960h"):
        print("Downloading wav2vec2...")
        download_model("facebook/wav2vec2-base-960h", "wav2vec2-base-960h")

    install_sd15 = input("Do you need to download SD15? If you don't have any SD15 model locally select y, if you want to change to another SD1.5 model select n. [y/n] (Default is y): ").lower()
    if install_sd15 == "y" or install_sd15 == "":
        if not os.path.exists("stable-diffusion-v1-5"):
            print("Downloading stable-diffusion-v1-5...")
            download_model("bdsqlsz/stable-diffusion-v1-5", "stable-diffusion-v1-5")

    print("Installed finish")
    input("Press Enter to exit...")

def download_model(model_name, dir_name):
    command = f"huggingface-cli download --resume-download {model_name} --local-dir {dir_name}"
    subprocess.run(command, shell=True)

if __name__ == "__main__":
    main()
