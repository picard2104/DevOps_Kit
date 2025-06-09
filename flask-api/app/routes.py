from flask import request, jsonify
from . import create_app, db
from .models import Result

app = create_app()


@app.route('/submit', methods=['POST'])
def submit():
    try:
        data = request.get_json()
        if not data or 'name' not in data or 'score' not in data:
            return jsonify({"error": "Invalid data"}), 400

        new_result = Result(name=data['name'], score=data['score'])
        db.session.add(new_result)
        db.session.commit()
        return jsonify({"message": "Result added"}), 201
    except Exception as e:
        app.logger.error(f"Error in /submit: {str(e)}")
        return jsonify({"error": "Internal server error"}), 500


@app.route('/results', methods=['GET'])
def get_results():
    try:
        results = Result.query.all()
        return jsonify([result.to_dict() for result in results]), 200
    except Exception as e:
        app.logger.error(f"Error in /results: {str(e)}")
        return jsonify({"error": "Internal server error"}), 500


@app.route('/ping', methods=['GET'])
def ping():
    return jsonify({"status": "ok"}), 200
