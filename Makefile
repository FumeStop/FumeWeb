env:
	uv venv

rmenv:
	rm -rf .venv

install:
	uv sync --no-dev

install-dev:
	uv sync --extra dev

install-extras:
	uv sync --all-extras --no-dev

dev:
	uv run launcher.py

prod:
	uv run hypercorn --bind 0.0.0.0:13132 --certfile cert.pem --keyfile key.pem launcher:app

format:
	ruff check --select I --fix .
	ruff format .

.PHONY: env rmenv activate install install-dev dev prod format
.DEFAULT_GOAL := dev
