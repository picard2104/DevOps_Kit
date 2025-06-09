from app import create_app, db
from app.models import Result  # noqa: F401

app = create_app()
with app.app_context():
    try:
        db.create_all()
        print("Database tables created successfully!")
    except Exception as e:
        print(f"Error creating tables: {str(e)}")
