FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pyqt5 \
        libgl1-mesa-glx \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 \
        git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt || true

ENV DISPLAY=:0

CMD ["python", "KoboPatchGUI-Qt.py"]
