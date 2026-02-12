# Pull base image
FROM python:3.10-slim
COPY --from=ghcr.io/astral-sh/uv:0.10.2 /uv /uvx /bin/

# Set env vars
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working dir
WORKDIR /code

# Install dependencies
COPY pyproject.toml uv.lock /code/
RUN uv sync --frozen --no-install-project

# Copy core
COPY . /code/

ENV PATH="/code/.venv/bin:$PATH"
