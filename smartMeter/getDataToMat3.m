function getDataToMat3(flag ,wipeOutData)
%%�ڶ��ֽ�������ȡ�����ķ�ʽ
fprintf('go getDataToMat3 function!\n');

isPlot=1;%�Ƿ�ͼ

fan=1;%��ͼ��ţ�����Ҫ,�������ֲ�ͬ�����
fanStep=4;%fanһ�������˼������ݣ�������3��
fanDataGetNum=1;%fan��ÿ���������м�������
fanNum=1;%cell�е�cell��
fancell=cell(1,fanStep*fanDataGetNum);%����ȡ��P,PF,U,I
%modelFancell=cell(1,fanStep*fanDataGetNum);%��mean,var,max,min

hairdryer=2;
hairdryerStep=3;
hairdryerDataGetNum=1;
hairdryerNum=1;
hairdryercell=cell(1,hairdryerStep*hairdryerDataGetNum);
%modelMiphonecell=cell(1,miphoneStep*miphoneDataGetNum);

kettle=3;  
kettleStep=1;
kettleDataGetNum=1;
kettleNum=1;
kettlecell=cell(1,kettleStep*kettleDataGetNum);
%modelMonitorcell=cell(1,monitorStep*monitorDataGetNum);

mipad=4;  
mipadStep=1;
mipadDataGetNum=1;
mipadNum=1;
mipadcell=cell(1,mipadStep*mipadDataGetNum);
%modelMipadcell=cell(1,mipadStep*mipadDataGetNum);

pc=5;  
pcStep=1;
pcDataGetNum=1;
pcNum=1;
pccell=cell(1,pcStep*pcDataGetNum);
%modelLampcell=cell(1,lampStep*lampDataGetNum);

% solderingIron=6;  
% solderingIronStep=3;
% solderingIronDataGetNum=1;
% solderingIronNum=1;
% solderingIroncell=cell(1,solderingIronStep*solderingIronDataGetNum);
% %modelSolderingIroncell=cell(1,solderingIronStep*solderingIronDataGetNum);

bus=6;
busStep=13;
busDataGetNum=1;
busNum=1;
buscell=cell(1,busStep*busDataGetNum);
%modelBuscell=cell(1,busStep*busDataGetNum);
%sampleFeatureNum=4;%ÿ������������������������ȡ���õ���������
pAddPf=1;%Ϊ0ʱֻ��һ��ͼ��Ϊ1ʱ�����ͼ ��Ĭ��1

%�ļ�����������  originalSample+classNum+charcter+numStep+num
%.xlsx=ԭʼ��������+�����+������+��num������+�ò�������num������
if(flag==1)
            for i=1:fanStep%read fan data
                 for j=1:fanDataGetNum
                       pathP=['\sourceData3\fan',num2str(i),'P',num2str(j),'.xlsx'];%��ȡ·��
                       pathPF=['\sourceData3\fan',num2str(i),'PF',num2str(j),'.xlsx'];%��ȡ·��
                       pathU=['\sourceData3\fan',num2str(i),'U',num2str(j),'.xlsx'];%��ȡ·��
                       pathI=['\sourceData3\fan',num2str(i),'I',num2str(j),'.xlsx'];%��ȡ·��

                       [dataP,dataNumP]= readExcelData(pathP);%��ȡ����
                       [dataPF,dataNumPF]= readExcelData(pathPF);%��ȡ����
                       [dataU,dataNumU]= readExcelData(pathU);%��ȡ����
                       [dataI,dataNumI]= readExcelData(pathI);%��ȡ����

                    fancell{fanNum}={dataP,dataPF,dataU,dataI};  %������                                   
                      if(isPlot)        %�Ƿ�Ҫ��ͼ                        
                                  [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fancell{1,i},wipeOutData);%����ͳ����ֵ
                                  %modelFancell(fanNum)=[aveValue',varValue',maxValue',minValue']
                                 plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,fan*100+i*10+j,aveValue,varValue,maxValue,minValue);   
                      end
                      fanNum=fanNum+1;
                 end
            end
            fprintf('fan data get over!\n');


            for i=1:hairdryerStep%read miphone data
                 for j=1:hairdryerDataGetNum
                       pathP=['\sourceData3\hairdryer',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData3\hairdryer',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData3\hairdryer',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData3\hairdryer',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                      hairdryercell{hairdryerNum}={dataP,dataPF,dataU,dataI};           
                       if(isPlot)  
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(hairdryercell{1,i},wipeOutData);
                                %modelMiphonecell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,hairdryer*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                        hairdryerNum=hairdryerNum+1;
                 end
            end
             fprintf('hairdryer data get over!\n');


             for i=1:kettleStep%read monitor data
                 for j=1:hairdryerDataGetNum
                       pathP=['\sourceData3\kettle',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData3\kettle',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData3\kettle',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData3\kettle',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                       kettlecell{kettleNum}={dataP,dataPF,dataU,dataI};  
                       if(isPlot)  
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(kettlecell{1,i},wipeOutData);
                                %modelMonitorcell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,kettle*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                       kettleNum=kettleNum+1;
                 end
            end
             fprintf('kettle data get  over!\n');
             
             
             for i=1:mipadStep%read monitor data
                 for j=1:mipadDataGetNum
                       pathP=['\sourceData3\mipad',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData3\mipad',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData3\mipad',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData3\mipad',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                       mipadcell{mipadNum}={dataP,dataPF,dataU,dataI};        
                       if(isPlot)  
                                 [aveValue,varValue,maxValue,minValue] = getTheDataFeature(mipadcell{1,i},wipeOutData);
                                 %modelMipadcell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,mipad*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                       mipadNum=mipadNum+1;
                 end
            end
             fprintf('mipad data get  over!\n');
             
             for i=1:pcStep%read miphone data
                 for j=1:pcDataGetNum
                       pathP=['\sourceData3\pc',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData3\pc',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData3\pc',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData3\pc',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                      pccell{pcNum}={dataP,dataPF,dataU,dataI};
                      pcNum=pcNum+1;
                       if(isPlot)  
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(pccell{1,i},wipeOutData);
                               % modelLampcell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,pc*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                 end
            end
             fprintf('pc data get over!\n');


             for i=1:busStep%read bus data
                 for j=1:busDataGetNum
                       pathP=['\sourceData3\bus',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData3\bus',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData3\bus',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData3\bus',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                       buscell{busNum}={dataP,dataPF,dataU,dataI};
                       busNum=busNum+1;
                      if(isPlot)
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(buscell{1,i},wipeOutData);
                                %modelBuscell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,bus*100+i*10+j,aveValue,varValue,maxValue,minValue);
                      end
                 end
            end
            fprintf('bus data get over!\n');
            
             save all3.mat fancell hairdryercell kettlecell mipadcell pccell buscell
            % save model.mat modelFancell modelMiphonecell modelMonitorcell modelMipadcell modelLampcell modelSolderingIroncell modelBuscell
             fprintf('in getDataToMat3 function , save data to all3.mat success!\n')
else
    fprintf('in getDataToMat3 function ,not save data to all.mat\n')
end

end


