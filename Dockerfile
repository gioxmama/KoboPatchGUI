FROM python:3.11-slim

# Install Tkinter and required libraries
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-tk \
        tcl8.6 \
        tk8.6 \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the Python app into the image (all .py files etc.)
COPY . .

ENV DISPLAY=:0

# The program will look for .patch files inside /patches
CMD ["python", "KoboPatchGUI-Tk.py"]
