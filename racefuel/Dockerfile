FROM python:3.11-slim

# Installeer git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone jouw privé app repo
ARG GITHUB_TOKEN
RUN git clone https://${GITHUB_TOKEN}@github.com/jrspttr17/racefuel /app

# Installeer dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

WORKDIR /app

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]