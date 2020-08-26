cd C:\Users\%USERNAME%\Anaconda3\Scripts\
CALL activate base
START jupyter-lab --no-browser --notebook-dir="C:\Users\%USERNAME%"

timeout 5

pushd C:\Users\%USERNAME%\AppData\Roaming\jupyter\runtime\
for /f "tokens=*" %%x in ('dir *.html* /b /od') do set MOST_RECENT=%%x
echo %MOST_RECENT%

@ECHO ON

start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --app=C:\Users\%USERNAME%\AppData\Roaming\jupyter\runtime\%MOST_RECENT%