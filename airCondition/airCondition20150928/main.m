close all;
clear;
clc;

airConditionSample=6;%�������裬��Ϊ����ʱ������������������
pAddPf=1;%Ϊ0ʱֻ��һ��ͼ��Ϊ1ʱ�����ͼ ��Ĭ��1



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
           plotMulFigureAirCondition(dataNumP1,dataP1,dataNumPF1,dataPF1,'��������','������Ӧ��ֵ','power and power fator',i+1,pAddPf,dataNumP12,dataP12,dataNumPF12,dataPF12);
    else
           pathP = ['\sourceData\airCondition',num2str(i),'P.xlsx'];
           pathPF=['\sourceData\airCondition',num2str(i),'PF.xlsx'];
           [dataP1,dataNumP1]= readExcelData(pathP);
           [dataPF1,dataNumPF1]= readExcelData(pathPF);
           plotMulFigureAirCondition(dataNumP1,dataP1,dataNumPF1,dataPF1,'��������','������Ӧ��ֵ','power and power fator',i+1,pAddPf);
    end

end
fprintf('over!\n');
% formatSpec = 'The array is %dx%d.';
% A1 = 2;
% A2 = 3;
% str = sprintf(formatSpec,A1,A2)


% [dataP1,dataNumP1]= readExcelData(pathP1);
% [dataPF1,dataNumPF1]= readExcelData(pathPF1);
% plotFigureAirCondition(dataNumP1,dataP1,'��������','��������power','����');
% plotFigureAirCondition(dataNumPF1,dataPF1,'��������','������������power','����');
