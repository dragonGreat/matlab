function getDataToMat2(flag ,wipeOutData)
%%�ڶ��ֽ�������ȡ�����ķ�ʽ
fprintf('go getDataToMat2 function!\n');

isPlot=0;%�Ƿ�ͼ

fan=1;%��ͼ��ţ�����Ҫ,�������ֲ�ͬ�����
fanStep=3;%fanһ�������˼������ݣ�������3��
fanDataGetNum=1;%fan��ÿ���������м�������
fanNum=1;%cell�е�cell��
fancell=cell(1,fanStep*fanDataGetNum);%����ȡ��P,PF,U,I
%modelFancell=cell(1,fanStep*fanDataGetNum);%��mean,var,max,min

miphone=2;
miphoneStep=2;
miphoneDataGetNum=1;
miphoneNum=1;
miphonecell=cell(1,miphoneStep*miphoneDataGetNum);
%modelMiphonecell=cell(1,miphoneStep*miphoneDataGetNum);

monitor=3;  
monitorStep=1;
monitorDataGetNum=1;
monitorNum=1;
monitorcell=cell(1,monitorStep*monitorDataGetNum);
%modelMonitorcell=cell(1,monitorStep*monitorDataGetNum);

mipad=4;  
mipadStep=1;
mipadDataGetNum=1;
mipadNum=1;
mipadcell=cell(1,mipadStep*mipadDataGetNum);
%modelMipadcell=cell(1,mipadStep*mipadDataGetNum);

lamp=5;  
lampStep=1;
lampDataGetNum=1;
lampNum=1;
lampcell=cell(1,lampStep*lampDataGetNum);
%modelLampcell=cell(1,lampStep*lampDataGetNum);

solderingIron=6;  
solderingIronStep=3;
solderingIronDataGetNum=1;
solderingIronNum=1;
solderingIroncell=cell(1,solderingIronStep*solderingIronDataGetNum);
%modelSolderingIroncell=cell(1,solderingIronStep*solderingIronDataGetNum);

bus=7;
busStep=5;
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
                       pathP=['\sourceData2\fan',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData2\fan',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData2\fan',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData2\fan',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);

                    fancell{fanNum}={dataP,dataPF,dataU,dataI};                                     
                      if(isPlot)                                
                                  [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fancell{1,i},wipeOutData);
                                  %modelFancell(fanNum)=[aveValue',varValue',maxValue',minValue']
                                 plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,fan*100+i*10+j,aveValue,varValue,maxValue,minValue);   
                      end
                      fanNum=fanNum+1;
                 end
            end
            fprintf('fan data get over!\n');


            for i=1:miphoneStep%read miphone data
                 for j=1:miphoneDataGetNum
                       pathP=['\sourceData2\miphone',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData2\miphone',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData2\miphone',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData2\miphone',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                      miphonecell{miphoneNum}={dataP,dataPF,dataU,dataI};           
                       if(isPlot)  
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(miphonecell{1,i},wipeOutData);
                                %modelMiphonecell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,miphone*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                        miphoneNum=miphoneNum+1;
                 end
            end
             fprintf('miphone data get over!\n');


             for i=1:monitorStep%read monitor data
                 for j=1:miphoneDataGetNum
                       pathP=['\sourceData2\monitor',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData2\monitor',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData2\monitor',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData2\monitor',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                       monitorcell{monitorNum}={dataP,dataPF,dataU,dataI};  
                       if(isPlot)  
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(monitorcell{1,i},wipeOutData);
                                %modelMonitorcell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,monitor*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                       monitorNum=monitorNum+1;
                 end
            end
             fprintf('minitor data get  over!\n');
             
             
             for i=1:mipadStep%read monitor data
                 for j=1:mipadDataGetNum
                       pathP=['\sourceData2\mipad',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData2\mipad',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData2\mipad',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData2\mipad',num2str(i),'I',num2str(j),'.xlsx'];

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
             
             for i=1:lampStep%read miphone data
                 for j=1:lampDataGetNum
                       pathP=['\sourceData2\lamp',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData2\lamp',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData2\lamp',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData2\lamp',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                      lampcell{lampNum}={dataP,dataPF,dataU,dataI};
                      lampNum=lampNum+1;
                       if(isPlot)  
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(lampcell{1,i},wipeOutData);
                               % modelLampcell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,lamp*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                 end
            end
             fprintf('lamp data get over!\n');


             for i=1:solderingIronStep%read monitor data
                 for j=1:solderingIronDataGetNum
                       pathP=['\sourceData2\solderingIron',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData2\solderingIron',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData2\solderingIron',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData2\solderingIron',num2str(i),'I',num2str(j),'.xlsx'];

                       [dataP,dataNumP]= readExcelData(pathP);
                       [dataPF,dataNumPF]= readExcelData(pathPF);
                       [dataU,dataNumU]= readExcelData(pathU);
                       [dataI,dataNumI]= readExcelData(pathI);
                       solderingIroncell{solderingIronNum}={dataP,dataPF,dataU,dataI};
                       solderingIronNum=solderingIronNum+1;
                       if(isPlot)  
                                [aveValue,varValue,maxValue,minValue] = getTheDataFeature(solderingIroncell{1,i},wipeOutData);
                                %modelSolderingIroncell{fanNum}={[aveValue',varValue',maxValue',minValue']};
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,solderingIron*100+i*10+j,aveValue,varValue,maxValue,minValue);
                       end
                 end
            end
             fprintf('solderingIron data get  over!\n');
             
             
             


             for i=1:busStep%read bus data
                 for j=1:busDataGetNum
                       pathP=['\sourceData2\bus',num2str(i),'P',num2str(j),'.xlsx'];
                       pathPF=['\sourceData2\bus',num2str(i),'PF',num2str(j),'.xlsx'];
                       pathU=['\sourceData2\bus',num2str(i),'U',num2str(j),'.xlsx'];
                       pathI=['\sourceData2\bus',num2str(i),'I',num2str(j),'.xlsx'];

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
            
             save all2.mat fancell miphonecell monitorcell mipadcell lampcell solderingIroncell buscell
            % save model.mat modelFancell modelMiphonecell modelMonitorcell modelMipadcell modelLampcell modelSolderingIroncell modelBuscell
             fprintf('in getDataToMat2 function , save data to all2.mat success!\n')
else
    fprintf('in getDataToMat2 function ,not save data to all.mat\n')
end

end
