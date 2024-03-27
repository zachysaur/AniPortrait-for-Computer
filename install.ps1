Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
#$Env:PIP_INDEX_URL = "https://mirror.baidu.com/pypi/simple"
#$Env:HF_ENDPOINT = "https://hf-mirror.com"

if (!(Test-Path -Path "venv")) {
    Write-Output  "create python venv..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "Installing dependencies..."
pip install -U -r requirements-windows.txt

Write-Output "Check Models..."
if (!(Test-Path -Path "pretrained_model")) {
    Write-Output  "Downloading AniPortrait..."
    huggingface-cli download --resume-download ZJYang/AniPortrait --local-dir pretrained_model
}

Set-Location .\pretrained_model

if (!(Test-Path -Path "image_encoder")) {
    Write-Output  "Downloading image_encoder..."
    huggingface-cli download --resume-download bdsqlsz/image_encoder --local-dir image_encoder
}

if (!(Test-Path -Path "wav2vec2-base-960h")) {
    Write-Output  "Downloading wav2vec2..."
    huggingface-cli download --resume-download facebook/wav2vec2-base-960h --local-dir wav2vec2-base-960h
}

$install_SD15 = Read-Host "Do you need to download SD15? If you don't have any SD15 model locally select y, if you want to change to another SD1.5 model select n. [y/n] (Default is y)"
if ($install_SD15 -eq "y" -or $install_SD15 -eq "Y" -or $install_SD15 -eq "") {
    if (!(Test-Path -Path "stable-diffusion-v1-5")) {
        Write-Output  "Downloading stable-diffusion-v1-5..."
        huggingface-cli download --resume-download bdsqlsz/stable-diffusion-v1-5 --local-dir stable-diffusion-v1-5   
    }
}

Write-Output "Installed finish"
Read-Host | Out-Null ;
