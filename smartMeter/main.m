close all;
clear;
clc;

allTestSample=1;%�����������������õ�������
sampleFeatureNum=4;%ÿ������������������������ȡ���õ���������
pAddPf=1;%Ϊ0ʱֻ��һ��ͼ��Ϊ1ʱ�����ͼ ��Ĭ��1



for i=1:allTestSample
           pathP = '\sourceData\fanP.xlsx';%����
           pathPF='\sourceData\fanPF.xlsx';%��������
           pathU = '\sourceData\fanU.xlsx';%��ѹ
           pathI='\sourceData\fanI.xlsx';%����
           [dataP,dataNumP]= readExcelData(pathP);
           [dataPF,dataNumPF]= readExcelData(pathPF);
           [dataU,dataNumU]= readExcelData(pathU);
           [dataI,dataNumI]= readExcelData(pathI);
          
           plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,i);

end
fprintf('over!\n');

