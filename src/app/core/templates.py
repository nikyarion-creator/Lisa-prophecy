from fastapi import FastAPI
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles

templates = Jinja2Templates(directory="src/app/templates")


def setup_templates(app: FastAPI) -> None:
    app.mount(
        "/static",
        StaticFiles(directory="src/app/static"),
        name="static",
    )
