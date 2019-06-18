########### works local only ###############
# https://pypi.org/project/Werkzeug/
############################################
# import os
# from flask import Flask, request, redirect, url_for
# from werkzeug import secure_filename

# UPLOAD_FOLDER = '/tmp/'
# ALLOWED_EXTENSIONS = set(['xml'])

# app = Flask(__name__)
# app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# def allowed_file(filename):
#     return '.' in filename and \
#            filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

# @app.route("/", methods=['GET', 'POST'])
# def index():
#     if request.method == 'POST':
#         file = request.files['file']
#         if file and allowed_file(file.filename):
#             filename = secure_filename(file.filename)
#             file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
#             return redirect(url_for('index'))
#     return """
#     <!doctype html>
#     <title>Upload new File</title>
#     <h1>Upload new File</h1>
#     <form action="" method=post enctype=multipart/form-data>
#       <p><input type=file name=file>
#          <input type=submit value=Upload>
#     </form>
#     <p>%s</p>
#     """ % "<br>".join(os.listdir(app.config['UPLOAD_FOLDER'],))

# if __name__ == "__main__":
#     app.run(host='0.0.0.0', port=5000, debug=True)

#####################
# works
#####################
import datetime
import os

from flask import Flask, jsonify, make_response, request

from models import Items
from database import db_session

app = Flask(__name__)

@app.route('/', methods=['POST'])
def score():
    features = request.json['Check']
    item = Items(name=features, status="", date_added=datetime.datetime.now())
    db_session.add(item)
    db_session.commit()
    return make_response(jsonify({'checkxml': features}))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)