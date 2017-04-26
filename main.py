#!/bin/env python2.7
#coding=utf-8
from  datetime import *
import time
from flask import Flask,session,request,render_template,redirect,json
import dbutil
try:
	conn = dbutil.DB('project','10.99.160.36','root','root')
	conn.connect()
except Exception as e:
	print e
else:
	print 'connect success'


app = Flask(__name__)
app.secret_key = 'sadfagraegrgaregareghhqare'

def getjson(sql):
	try:
		tmp = conn.execute(sql)
		res = json.dumps(tmp)
	except Exception as e:
		return 'error'
	else:
		return res

@app.route('/')
def login_r():
		return redirect('/signin')

@app.route('/signin',methods=['GET','POST'])
def signin():
	if 'user' in session:
		return redirect('/project/dis')
	else:
		if request.method == 'GET':
			return render_template('signin.html')
		elif request.method == 'POST':
			username = request.form.get('username')
			password = request.form.get('password')
			sql = "SELECT id,group_id FROM user WHERE (name='%s' AND password='%s')" % (username,password)
			res = conn.execute(sql)
			if len(res) == 0:
				return render_template('signin.html',message="error")
			else:
				session['user'] = username
				session['user_id'] = res[0][0]
				session['group'] = res[0][1]
				if session['group'] == 0:
					return 'super'
				else:

					return redirect('/project/dis')

@app.route('/logout')
def logout():
	session.pop('user')
	session.pop('group')
	session.pop('user_id')
	return redirect('/signin')

@app.route('/project/dis',methods=['GET','POST'])
def proj_dis():
	if 'user' in session:
		if request.method == 'GET':
			return render_template('ProjectDis.html')
		else:
			GetGrouper = request.form.get('GetGrouper')
			GetAll = request.form.get('GetAll')
			if len(GetGrouper) >0:
				sql = 'SELECT grouper FROM user WHERE name=%s' %(session['user'])
				res = conn.execute(sql)
				return str(res[0][0])
			elif GetAll == 0:
				sql = 'SELECT id,project_name,description,woner,step_name FROM project_schedule ' 
				sql += 'WHERE owner=%s' % (session['user_id'])
				res = getjson(sql)
				return res
			elif GetAll == 1:
				sql = 'SELECT id,project_name,description,woner,step_name FROM project_schedule '
				sql += 'WHERE woner IN (SELECT id FROM user WHERE group=%s)' % (session['group'])
				res = getjson(sql)
				return res
			elif GetAll == 2:
				sql = 'SELECT id,project_name,description,woner,step_name FROM project_schedule'
				res = getjson(sql)
				return res
	else:
		return redirect('/signin')

@app.route('/project/manage')
def proj_namage():
	if 'user' in session:
		return render_template('ProjectManage.html')
	else:
		return redirect('/signin')

@app.route('/project/manage/add',methods=['GET','POST'])
def proj_manage_add():
	if 'user' in session:
		if request.method == 'GET':
			sql = 'SELECT id,project_name,description FROM project WHERE owner=%s' % (session['user_id'])
			res = getjson(sql)
			return res
		else:
			ProjectName = request.form.get('ProjectName')
			description = request.form.get('description')
			sql = 'INSERT INTO project(project_name,description,owner) VALUES (%s,%s,%s)' % (ProjectName,description,session['user_id'])
			res = conn.execute(sql)
			if not res:
				return 'ok'
			else:
				return 'error'
	else:
		return redirect('/signin')

@app.route('/getgantt')
def getgantt():
	date01 = "2017-04-12"
	date02 = "2017-05-12"
	timestamp01 = int(time.mktime(time.strptime(date01,"%Y-%m-%d")))*1000
	timestamp02 = int(time.mktime(time.strptime(date02,"%Y-%m-%d")))*1000
	print timestamp01
	aa01 = "/Date(%s)/" % (timestamp01)
	aa02 = "/Date(%s)/" % (timestamp02)
	arr = [{"name":u"网络建设","desc":u"光缆铺设","values":[{"from":aa01,"to":aa02,"label":u"光缆铺设","customClass": "ganttGreen"}]}]
	res = json.dumps(arr)
	return res
if __name__ == '__main__':
	app.run(host='0.0.0.0',port=9023,debug=True)

#http://www.cnblogs.com/refe/p/5101744.html