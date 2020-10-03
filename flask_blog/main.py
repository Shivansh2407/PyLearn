from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from datetime import datetime
import json
import os
import math
from werkzeug.utils import secure_filename

with open('config.json', 'r') as c:
    params = json.load(c)["params"]
    
local_server = params['local_server']
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = 'True',
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password'],
)
mail = Mail(app)
if local_server == True:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
    
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(40), nullable=False)
    tagline = db.Column(db.String(40), nullable=False)
    

@app.route("/")
# @app.route("/home")
def Home():

    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    # [0:params['no_of_posts']]
    
    page = request.args.get('page')
    if not str(page).isnumeric() :
        page = 1
    page = int(page)

    posts = posts[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts']) + int(params['no_of_posts'])]
    # Pagination Logic
    # First  - Previous = # && Next = page+1
    if page==1:
        prev = "#"
        Next = "/?page=" + str(page + 1)
    elif page==last:
        prev = "/?page=" + str(page - 1)
        Next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        Next = "/?page=" + str(page + 1)
    
    return render_template('index.html', params=params, posts=posts, prev=prev, Next=Next)

@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if (request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message= request.form.get('message')
        
        entry = Contacts(name=name, phone_num=phone, msg=message, email=email, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message From ' + name, 
                        sender=email,
                        recipients= [params['gmail-user']],
                        body = "Phone Number is : " + phone + "\n\nMessage is : " + "\n" + message
                    )
        flash('Thanks for submitting your details. We\'ll get back soon.', "success")
    return render_template('contact.html', params=params)

@app.route("/edit/<string:sno>", methods = ['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if sno=='0':
                post = Posts(title=box_title, slug=slug, content=content, tagline=tline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.tagline = tline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)
    

@app.route("/delete/<string:sno>")
def delete():
    pass

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfully"
        

# @app.route("/dashbord", methods = ['GET', 'POST'])
# def logout():
#     posts=Posts.query.all()
#     return render_template('dashbord.html', params=params, posts=posts)

@app.route("/dashboard", methods = ['GET', 'POST'])
def dashbord():
    
    if 'user' in session and session['user'] == params['admin_user']:
        posts=Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    
    if request.method == 'POST' :
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        
        if (username == params['admin_user'] and userpass == params['admin_password']):
            session['user'] = username
            posts=Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    
    return render_template('login.html', params=params)

# if __name__ == '__main__':
app.run(debug=True)