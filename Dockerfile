FROM python:3.11-slim

# Install Tkinter and necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-tk \
        tcl8.6 \
        tk8.6 \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

# No PyQt5 needed, so no pip install here

ENV DISPLAY=:0

CMD ["python", "KoboPatchGUI-Tk.py"]
