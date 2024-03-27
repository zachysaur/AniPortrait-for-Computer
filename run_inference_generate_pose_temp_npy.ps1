$ref_video="./configs/inference/head_pose_temp/pose_ref_video.mp4"
$save_path="./configs/inference/head_pose_temp/pose.npy"

Set-Location $PSScriptRoot
.\venv\Scripts\activate

$Env:HF_HOME = "./huggingface"
$Env:XFORMERS_FORCE_DISABLE_TRITON = "1"
$Env:PYTHONPATH = $PSScriptRoot
$Env:HF_ENDPOINT = "https://hf-mirror.com"

python.exe "scripts/generate_ref_pose.py" `
 --ref_video=$ref_video `
 --save_path=$save_path