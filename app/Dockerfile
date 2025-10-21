FROM python:3.11-slim AS build
ENV PIP_NO_CACHE_DIR=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
WORKDIR /w
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/out -r requirements.txt
COPY src/ /w/src
RUN python - <<'PY'
from pathlib import Path
Path("/w/src/__init__.py").touch(exist_ok=True)
PY

FROM gcr.io/distroless/python3-debian12
WORKDIR /app
ENV PYTHONPATH=/app:/usr/local/lib/python3.11/site-packages
COPY --from=build /out/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=build /w/src /app/src
USER 65532:65532
EXPOSE 8080
ENTRYPOINT ["/usr/bin/python3"]
CMD ["-m", "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8080"]

