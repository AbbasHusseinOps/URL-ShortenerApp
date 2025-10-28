FROM python:3.11-slim AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
COPY src/ ./src
RUN python - <<'PY'
import pathlib; pathlib.Path('/app/src/__init__.py').touch()
PY

FROM gcr.io/distroless/python3-debian12
WORKDIR /app
ENV PYTHONPATH=/app:/usr/local/lib/python3.11/site-packages
COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=build /usr/local/bin /usr/local/bin
COPY --from=build /app/src /app/src
USER 65532:65532
EXPOSE 8080
CMD ["-m", "uvicorn", "src.main:app", "--host=0.0.0.0", "--port=8080"]



