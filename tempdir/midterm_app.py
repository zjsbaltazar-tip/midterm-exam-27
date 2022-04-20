from flask import Flask, render_template, redirect, url_for, request

application = Flask(__name__, static_url_path="/static")

# Index redirect to Log In View
@application.route("/", methods=["GET"])
def index():
    return redirect(url_for("logInUser"))

# Login View
@application.route("/login_user", methods=["GET", "POST"])
def logInUser():
    if request.method == "GET":
        return render_template("login.html")
    elif request.method == "POST":
        return redirect(url_for("index"))

# Register View
@application.route("/register_user", methods=["GET", "POST"])
def registerUser():
    if request.method == "GET":
        return render_template("registration.html")
    elif request.method == "POST":
        return redirect(url_for("index"))

if __name__=="__main__":
    application.debug = True
    application.run(host="0.0.0.0", port=5050)