until x11vnc -display :99 -rfbport ${X11_PORT} -shared -forever; do
    echo "x11vnc server crashed with exit code $?.  Respawning.." >&2
    sleep 1
done