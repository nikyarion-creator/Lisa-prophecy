from fastapi import FastAPI
from app.api.routes.pages import router as pages_router
from app.core.templates import setup_templates

def create_app() -> FastAPI:
    app = FastAPI()

    setup_templates(app)
    app.include_router(pages_router)

    return app


app = create_app()
