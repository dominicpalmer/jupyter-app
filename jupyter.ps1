# Alter if JupyterLab is installed in a different environment 
# or if Chrome isn't installed in the default location
$CONDA_ENV = "base"
$CHROME_PATH = "C:\Program Files\Google\Chrome\Application\chrome.exe"

# Activate the environment and start JupyterLab
cd C:\Users\$env:username\Anaconda3\Scripts\
conda activate $CONDA_ENV.name
start powershell {jupyter-lab --no-browser --notebook-dir="C:\Users\$env:username"}
timeout 5

# Make sure the most recent jupyter instance is used
$RUNTIME_PATH = "C:\Users\$env:username\AppData\Roaming\jupyter\runtime"
$MOST_RECENT_RUNTIME = Get-ChildItem -Path $RUNTIME_PATH -Filter "*.html" | Sort-Object LastAccessTime -Descending | Select-Object -First 1

# Open Chrome in app mode
$STARTMODE = "--app=C:\Users\$env:username\AppData\Roaming\jupyter\runtime\" + $MOST_RECENT_RUNTIME.name
Start-Process -FilePath $CHROME_PATH -ArgumentList $STARTMODE
