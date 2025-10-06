FROM langflowai/langflow:1.6.3

RUN pip install --no-cache-dir uv

WORKDIR /app

RUN uv pip install gigachat>=0.1.42.post2

COPY . .

COPY entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
