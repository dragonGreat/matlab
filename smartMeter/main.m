close all;
clear;
clc;

allTestSample=1;%测试总样本数（总用电器数）
sampleFeatureNum=4;%每个样本所包含的特征数（提取的用电器特征）
pAddPf=1;%为0时只画一副图，为1时画多个图 ，默认1



for i=1:allTestSample
           pathP = '\sourceData\fanP.xlsx';%功率
           pathPF='\sourceData\fanPF.xlsx';%功率因子
           pathU = '\sourceData\fanU.xlsx';%电压
           pathI='\sourceData\fanI.xlsx';%电流
           [dataP,dataNumP]= readExcelData(pathP);
           [dataPF,dataNumPF]= readExcelData(pathPF);
           [dataU,dataNumU]= readExcelData(pathU);
           [dataI,dataNumI]= readExcelData(pathI);
          
           plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,i);

end
fprintf('over!\n');

