FROM python:3.12-slim

# Установка curl
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Установка uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Добавляем uv в PATH
ENV PATH="/root/.local/bin:$PATH"

# Рабочая директория
WORKDIR /app

# Копируем метаданные проекта
COPY pyproject.toml uv.lock ./

# Устанавливаем зависимости (prod)
RUN uv sync --frozen --no-dev

# Копируем исходники
COPY src ./src

# Прод-запуск
CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
