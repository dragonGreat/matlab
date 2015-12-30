# _*_ coding:utf-8 _*_
# __author__ = 'dragon'
'''
这个函数主要是用来绘图
'''
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties  # 加入字体属性
import readExcel

font = FontProperties(fname=r"c:\windows\fonts\simsun.ttc", size=14)  # 加入字体属

# data:input data,showOrNot:是否显示图片ischinese:是否支持中文图注，saveFig:是否保存图片
# 默认参数 showOrNot=0,isChinese=0,saveFig=0:图片不显示，不显示中文图注，不保存图片（只在第一次时保存,且只有在showOrNot=1时才能保存图片）
# 中文图注暂时未实现，仅留一个借口
data = readExcel.readExcel()  # 调用默认的数据


def plotFigAll(data=data, showOrNot=0, isChinese=0, saveFig=0):
    print len(data)
    for eachDevNum in range(len(data)/2):
        plotFigSig(data[2 * eachDevNum], data[2 * eachDevNum + 1], showOrNot, saveFig)
        plotFigMul(data[2 * eachDevNum], data[2 * eachDevNum + 1], showOrNot, saveFig)
    plt.show()


        # 为画图进行相关参数提取 ，并掉用相关的函数


def plotFigSig(classDev, dataDev, showOrNot, saveFig):
    if 1 == showOrNot:
        for eachSubPlot in range(4):
            numPlot = 22 * 10 + (eachSubPlot + 1)
            if 0 == eachSubPlot:
                figData = dataDev['P']
                flagTitle = '--P'
            elif 1 == eachSubPlot:
                figData = dataDev['PF']
                flagTitle = '--PF'
            elif 2 == eachSubPlot:
                figData = dataDev['U']
                flagTitle = '--U'
            else:
                figData = dataDev['I']
                flagTitle = '--I'
            plotFig(classDev, numPlot, figData, flagTitle, saveFig)  # 将各个电气特征画到一个画布上


# 将各个电气特征画到一个画布的各个子图中
# classdev:设备名称 figNum:第几个字图 figData:所需画图的数据flagTitle:每一个字图的标注
def plotFig(classDev, figNum, figData, flagTitle, saveFig):
    fig = plt.figure(classDev + 'S', figsize=(12, 13))
    ax = plt.subplot(figNum)
    plt.sca(ax)
    plt.plot(figData)
    plt.title(classDev + flagTitle, fontsize=14)
    plt.xlabel('time')
    plt.ylabel('value')
    if 1 == saveFig:
        print "save fig in the ./img/S"
        fig.savefig('./img/'+classDev + 'S'+'.png')


# 将各个电气特征画到一个画布中无子图
def plotFigMul(classDev, figData, showOrNot, saveFig):
    if 1 == showOrNot:
        fig = plt.figure(classDev + 'M', figsize=(12, 13))
        plt.plot(figData['P'], 'r', figData['PF'], 'b', figData['U'], 'g', figData['I'], 'k')
        plt.title(classDev + "--Mul", fontsize=14)
        plt.xlabel('time')
        plt.ylabel('value')
        plt.legend(('P', 'PF', 'U', 'I'), loc='best')
        if 1== saveFig:
            print "save fig in the ./img/M"
            fig.savefig('./img/'+classDev + 'M'+'.png')


if __name__ == "__main__":
    plotFigAll(data, 0)
