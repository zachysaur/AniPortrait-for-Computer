Set-Location $PSScriptRoot
.\venv\Scripts\activate

$Env:HF_HOME = "./huggingface"
$Env:XFORMERS_FORCE_DISABLE_TRITON = "1"
$Env:PYTHONPATH = $PSScriptRoot
$Env:HF_ENDPOINT = "https://hf-mirror.com"

python.exe "scripts/audio2vid.py" --config ./configs/prompts/animation_audio.yaml -W 512 -H 512 -L 64