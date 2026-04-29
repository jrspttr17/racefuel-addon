#!/usr/bin/with-contenv bashio

GITHUB_TOKEN=$(bashio::config 'github_token')

# Clone of update de app
if [ -d "/app/.git" ]; then
    cd /app
    git pull https://${GITHUB_TOKEN}@github.com/jrspttr17/racefuel main
else
    git clone https://${GITHUB_TOKEN}@github.com/jrspttr17/racefuel /app
fi

# Installeer dependencies
pip install --no-cache-dir -r /app/requirements.txt

# Start de app
cd /app
streamlit run app.py --server.port 8501 --server.address 0.0.0.0