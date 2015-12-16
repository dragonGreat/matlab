# _*_ coding:utf-8 _*_
# __author__ = 'dragon'
import xlrd
import scipy.io as sio

totalDev = [
    'fan', {'step': 4, 'dataGetNum': 1, 'plotFig': 1},  # step:一共测试了多少步数据，这里是4步，dataGetNum ,每步中有几组数据。这里是1
    'hairdryer', {'step': 2, 'dataGetNum': 1, 'plotFig': 2},
    'kettle', {'step': 1, 'dataGetNum': 1, 'plotFig': 3},
    'mipad', {'step': 1, 'dataGetNum': 1, 'plotFig': 4},
    'pc', {'step': 1, 'dataGetNum': 1, 'plotFig': 5},
    'bus', {'step': 13, 'dataGetNum': 1, 'plotFig': 6}
]


def readExcel(totalDev, flagSv2mat=0):
    allData = []
    j = 0  # 指定数据插入的索引位置
    for totalDevNum in range(len(totalDev) / 2):  # 轮询用电器的数量len(totalDev) / 2
        for typeStep in range(totalDev[2 * totalDevNum + 1]['step']):  # 一共测试了多少步数据
            for typeGetNum in range(totalDev[2 * totalDevNum + 1]['dataGetNum']):  # 第一步中有几组数据
                pathP = '../sourceData3/' + totalDev[2 * totalDevNum] + str(typeStep + 1) + 'P' + str(
                    typeGetNum + 1) + '.xlsx'
                pathPF = '../sourceData3/' + totalDev[2 * totalDevNum] + str(typeStep + 1) + 'PF' + str(
                    typeGetNum + 1) + '.xlsx'
                pathU = '../sourceData3/' + totalDev[2 * totalDevNum] + str(typeStep + 1) + 'U' + str(
                    typeGetNum + 1) + '.xlsx'
                pathI = '../sourceData3/' + totalDev[2 * totalDevNum] + str(typeStep + 1) + 'I' + str(
                    typeGetNum + 1) + '.xlsx'
                ###############################fanP######################################################################
                dataP = xlrd.open_workbook(pathP)
                tableP = dataP.sheets()[0]
                P = tableP.col_values(3)[2:]
                ###############################fanPF######################################################################
                dataPF = xlrd.open_workbook(pathPF)
                tablePF = dataPF.sheets()[0]
                PF = tablePF.col_values(3)[2:]
                ###############################fanI######################################################################
                dataI = xlrd.open_workbook(pathI)
                tableI = dataI.sheets()[0]
                I = tableI.col_values(3)[2:]
                ###############################fanI######################################################################
                dataU = xlrd.open_workbook(pathU)
                tableU = dataU.sheets()[0]
                U = tableU.col_values(3)[2:]
                for i in reversed(range(len(P))):  # 去掉异常值，主要是初始状态的0值
                    if P[i] == '000000':
                        del P[i]
                        del PF[i]
                        del I[i]
                        del U[i]

                allData.insert(2 * j, totalDev[2 * totalDevNum] + str(1 + typeStep))  # 插入用电器类型
                allData.insert(2 * j + 1, {'P': P, 'PF': PF, 'I': I, 'U': U})  # 插入所对应用电器的参数值
                j = j + 1
    if 1 == flagSv2mat:
        # 只有在有新数据加入的时候才存入MAT，默认不存flagSv2mat=0
        print ('save allData to mat')
        sio.savemat('allData.mat', {'allData': allData})
    else:
        print ("not save allData to mat")
    return allData


if __name__ == '__main__':
    all=readExcel(totalDev)
