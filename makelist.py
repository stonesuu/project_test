from datetime import *

# month_dict = {1:31,2:28,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31}

def daylist(date1,date2,*dates):
	indict = {}
	startdate = datetime.strptime(date1,"%Y-%m-%d")
	enddate = datetime.strptime(date2,"%Y-%m-%d")

	gap = enddate - startdate 
	for date in dates:
		middate = datetime.strptime(date,"%Y-%m-%d")
		ind = (middate - startdate).days
		indict[date] = ind
	arr = ['']*((enddate-startdate).days+1)
	for date,ind in indict.items():
		arr[ind] = '<button class="btn btn-xs"><span class="glyphicon glyphicon glyphicon-triangle-top" aria-hidden="true"></span></button>'
	arr[0] = date1
	arr[-1] = date2
	return arr


# d1 = datetime.strptime('2017-04-18','%Y-%m-%d')
# d2 = datetime.strptime('2017-04-01','%Y-%m-%d')
# d1_f = datetime.strftime(d1,'%Y-%m-%d')
# print (d1-d2).days
