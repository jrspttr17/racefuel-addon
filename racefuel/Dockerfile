FROM ghcr.io/home-assistant/aarch64-base:latest

RUN apk add --no-cache git python3 py3-pip bash

RUN echo '#!/usr/bin/with-contenv bashio' > /run.sh && \
    echo 'GITHUB_TOKEN=$(bashio::config "github_token")' >> /run.sh && \
    echo 'if [ -d "/app/.git" ]; then' >> /run.sh && \
    echo '    cd /app && git pull https://${GITHUB_TOKEN}@github.com/jrspttr17/racefuel main' >> /run.sh && \
    echo 'else' >> /run.sh && \
    echo '    git clone https://${GITHUB_TOKEN}@github.com/jrspttr17/racefuel /app' >> /run.sh && \
    echo 'fi' >> /run.sh && \
    echo 'pip install --no-cache-dir -r /app/requirements.txt' >> /run.sh && \
    echo 'cd /app && streamlit run app.py --server.port 8501 --server.address 0.0.0.0' >> /run.sh && \
    chmod +x /run.sh

CMD [ "/run.sh" ]