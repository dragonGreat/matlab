close all;
clear;
clc;
fprintf('lets go ! ... ...\n');
%allTestSample=3;%�����������������õ�������
isPlot=0;
fan=1;
fanStep=3;
fanDataGetNum=2;
miphone=2;
miphoneStep=2;
miphoneDataGetNum=1;
monitor=3;
monitorStep=2;
monitorDataGetNum=1;
bus=4;
busStep=2;
busDataGetNum=1;

%sampleFeatureNum=4;%ÿ������������������������ȡ���õ���������
pAddPf=1;%Ϊ0ʱֻ��һ��ͼ��Ϊ1ʱ�����ͼ ��Ĭ��1

%�ļ�����������  originalSample+classNum+charcter+numStep+num
%.xlsx=ԭʼ��������+�����+������+��num������+�ò�������num������

for i=1:fanStep%read fan data
     for j=1:fanDataGetNum
           pathP=['\sourceData\fan',num2str(i),'P',num2str(j),'.xlsx'];
           pathPF=['\sourceData\fan',num2str(i),'PF',num2str(j),'.xlsx'];
           pathU=['\sourceData\fan',num2str(i),'U',num2str(j),'.xlsx'];
           pathI=['\sourceData\fan',num2str(i),'I',num2str(j),'.xlsx'];
           
           [dataP,dataNumP]= readExcelData(pathP);
           [dataPF,dataNumPF]= readExcelData(pathPF);
           [dataU,dataNumU]= readExcelData(pathU);
           [dataI,dataNumI]= readExcelData(pathI);
          if(isPlot)  
                     plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,fan*100+i*10+j);   
          end
     end
end
fprintf('fan data plot over!\n');

for i=1:miphoneStep%read miphone data
     for j=1:miphoneDataGetNum
           pathP=['\sourceData\miphone',num2str(i),'P',num2str(j),'.xlsx'];
           pathPF=['\sourceData\miphone',num2str(i),'PF',num2str(j),'.xlsx'];
           pathU=['\sourceData\miphone',num2str(i),'U',num2str(j),'.xlsx'];
           pathI=['\sourceData\miphone',num2str(i),'I',num2str(j),'.xlsx'];
           
           [dataP,dataNumP]= readExcelData(pathP);
           [dataPF,dataNumPF]= readExcelData(pathPF);
           [dataU,dataNumU]= readExcelData(pathU);
           [dataI,dataNumI]= readExcelData(pathI);
           if(isPlot)  
                    plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,miphone*100+i*10+j);
           end
     end
end
 fprintf('miphone data plot over!\n');
 
 for i=1:monitorStep%read monitor data
     for j=1:miphoneDataGetNum
           pathP=['\sourceData\monitor',num2str(i),'P',num2str(j),'.xlsx'];
           pathPF=['\sourceData\monitor',num2str(i),'PF',num2str(j),'.xlsx'];
           pathU=['\sourceData\monitor',num2str(i),'U',num2str(j),'.xlsx'];
           pathI=['\sourceData\monitor',num2str(i),'I',num2str(j),'.xlsx'];
           
           [dataP,dataNumP]= readExcelData(pathP);
           [dataPF,dataNumPF]= readExcelData(pathPF);
           [dataU,dataNumU]= readExcelData(pathU);
           [dataI,dataNumI]= readExcelData(pathI);
           if(isPlot)  
                    plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,monitor*100+i*10+j);
           end
     end
end
 fprintf('minitor data plot over!\n');
 
 for i=1:busStep%read bus data
     for j=1:miphoneDataGetNum
           pathP=['\sourceData\bus',num2str(i),'P',num2str(j),'.xlsx'];
           pathPF=['\sourceData\bus',num2str(i),'PF',num2str(j),'.xlsx'];
           pathU=['\sourceData\bus',num2str(i),'U',num2str(j),'.xlsx'];
           pathI=['\sourceData\bus',num2str(i),'I',num2str(j),'.xlsx'];
           
           [dataP,dataNumP]= readExcelData(pathP);
           [dataPF,dataNumPF]= readExcelData(pathPF);
           [dataU,dataNumU]= readExcelData(pathU);
           [dataI,dataNumI]= readExcelData(pathI);
          if(isPlot)
                    plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,bus*100+i*10+j);
          end
     end
end
 fprintf('bus data plot over!\n');

fprintf('over!\n');

