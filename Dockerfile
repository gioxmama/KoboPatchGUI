FROM python:3.11-slim

# Install only essential system libraries needed for PyQt5 (Qt GUI)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libgl1-mesa-glx \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 \
        && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Install PyQt5 via pip for Python-side Qt bindings
RUN pip install --no-cache-dir PyQt5

# Set environment variable for GUI apps (important for WSLg)
ENV DISPLAY=:0

# Default command to run the Qt GUI app
CMD ["python", "KoboPatchGUI-Qt.py"]
