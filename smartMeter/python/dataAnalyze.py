# _*_ coding:utf-8 _*_
# __author__ = 'dragon'
'''
1.相关数据说明
 	bus1:PC+fan4  ##data[18]
	bus2:pc+pad
    bus3:pc+hairdryer1
	bus4:pc+fan1
	bus5:pc+hairdryer2
	bus6:pc+phone
	bus7:pc+fan2
	bus8:pc+hairdryer3
	bus9:pc+fan3
	bus10:pc+phone+fan1->fan2->fan3->fan4->fan关->phone关->关
    bus11:fan4->phone->phone关-pc(47)->fan3->fan2（69）->fan1（80）->fan关-关
	bus12:hairdryer1->pc->pad(26)->hairdryer1关（38）->pad关(49)->关
	bus13:hairdryer1->kettle(22)-hairdryer关（32）->关
#################################################################################################################################
	data[18]:bus1的起点

'''
import readExcel
#data中偶数是用电器的类别，如data[0],data[2],相邻奇数保存在用电器的电气数据如data[1],data[3]
data = readExcel.readExcel()
#print data[18]
#通过功率区分两个用电器,第一个参数是用电器名字，第二个用参数是数据包括P,PF,U,I
def class2devBy_P(dataName=None,data=None):
	if (dataName == None or data == None):
		print "No dev name or data in 'class2devBy_P'"
	else:
		print "data analyze \'%s\'" % dataName
		relativeDataP=[]
		for i in range(len(data["P"])):
			if 0 == i:
				relativeDataP.append(int(data["P"][0]))
			else:
				relativeDataP.append(int(data["P"][i]) - int(data["P"][i-1]))
		#print relativeDataP
		fingerPrint(relativeDataP,'P',15,-15)


#根据不同的参数和阈值来区分类别
def fingerPrint(data, label, thresholdVal_P,thresholdVal_N):
	for i in data:
		if i > thresholdVal_P:
			print "from time = %d, find bus add dev=%s " % (data.index(i), power(i))
		if i < thresholdVal_N:
			print "from time = %d, find bus vanish dev=%s " % (data.index(i), power(i))
			#print data.index(i)
	

def power(x):
    return {
        139: 'PC',
        455: 'fan4',
    }[x]


def testData(data=data):
	#print data[19]["P"]
	return data[19]["P"]







if __name__=="__main__":
	#class2devBy_P(data[18], data[19])
	testData()
	#print f(1)