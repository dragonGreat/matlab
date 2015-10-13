close all;
clear;
clc;

airConditionSample=6;%各个步骤，０为待机时，第三步有两组数据
pAddPf=1;%为0时只画一副图，为1时画多个图 ，默认1



for i=0:airConditionSample
    if(i==3)
           pathP = ['\sourceData\airCondition',num2str(i),'P.xlsx'];
           pathPF=['\sourceData\airCondition',num2str(i),'PF.xlsx'];
           [dataP1,dataNumP1]= readExcelData(pathP);
           [dataPF1,dataNumPF1]= readExcelData(pathPF);
           
           pathP2 = ['\sourceData\airCondition',num2str(i),'P2.xlsx'];
           pathPF2=['\sourceData\airCondition',num2str(i),'PF2.xlsx'];    
           [dataP12,dataNumP12]= readExcelData(pathP2);
           [dataPF12,dataNumPF12]= readExcelData(pathPF2);
           plotMulFigureAirCondition(dataNumP1,dataP1,dataNumPF1,dataPF1,'样本数量','样本对应数值','power and power fator',i+1,pAddPf,dataNumP12,dataP12,dataNumPF12,dataPF12);
    else
           pathP = ['\sourceData\airCondition',num2str(i),'P.xlsx'];
           pathPF=['\sourceData\airCondition',num2str(i),'PF.xlsx'];
           [dataP1,dataNumP1]= readExcelData(pathP);
           [dataPF1,dataNumPF1]= readExcelData(pathPF);
           plotMulFigureAirCondition(dataNumP1,dataP1,dataNumPF1,dataPF1,'样本数量','样本对应数值','power and power fator',i+1,pAddPf);
    end

end
fprintf('over!\n');
% formatSpec = 'The array is %dx%d.';
% A1 = 2;
% A2 = 3;
% str = sprintf(formatSpec,A1,A2)


% [dataP1,dataNumP1]= readExcelData(pathP1);
% [dataPF1,dataNumPF1]= readExcelData(pathPF1);
% plotFigureAirCondition(dataNumP1,dataP1,'样本数量','待机功率power','待机');
% plotFigureAirCondition(dataNumPF1,dataPF1,'样本数量','待机功率因子power','待机');
