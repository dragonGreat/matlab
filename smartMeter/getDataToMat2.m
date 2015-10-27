function getDataToMat2(flag )
%%第二种将数据提取出来的方式
fprintf('go getDataToMat2 function!\n');

isPlot=1;%是否画图

fan=1;%画图标号，必须要,用来区分不同的类别
fanStep=3;%fan一共测试了几步数据，这里是3步
fanDataGetNum=1;%fan中每步数据中有几组数据
fanNum=1;%cell中的cell数
fancell=cell(1,fanStep*fanDataGetNum);

miphone=2;
miphoneStep=2;
miphoneDataGetNum=1;
miphoneNum=1;
miphonecell=cell(1,miphoneStep*miphoneDataGetNum);

monitor=3;  
monitorStep=1;
monitorDataGetNum=1;
monitorNum=1;
monitorcell=cell(1,monitorStep*monitorDataGetNum);

mipad=4;  
mipadStep=1;
mipadDataGetNum=1;
mipadNum=1;
mipadcell=cell(1,mipadStep*mipadDataGetNum);

lamp=5;  
lampStep=1;
lampDataGetNum=1;
lampNum=1;
lampcell=cell(1,lampStep*lampDataGetNum);

solderingIron=6;  
solderingIronStep=1;
solderingIronDataGetNum=1;
solderingIronNum=1;
solderingIroncell=cell(1,solderingIronStep*solderingIronDataGetNum);

bus=7;
busStep=5;
busDataGetNum=1;
busNum=1;
buscell=cell(1,busStep*busDataGetNum);
%sampleFeatureNum=4;%每个样本所包含的特征数（提取的用电器特征）
pAddPf=1;%为0时只画一副图，为1时画多个图 ，默认1

%文件的命名规则  originalSample+classNum+charcter+numStep+num
%.xlsx=原始数据类型+类别名+特征名+第num步测试+该步测试了num组数据
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
                    fanNum=fanNum+1;
                    
                      if(isPlot)  
                                 plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,fan*100+i*10+j);   
                      end
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
                      miphoneNum=miphoneNum+1;
                       if(isPlot)  
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,miphone*100+i*10+j);
                       end
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
                       monitorNum=monitorNum+1;
                       if(isPlot)  
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,monitor*100+i*10+j);
                       end
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
                       mipadNum=mipadNum+1;
                       if(isPlot)  
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,mipad*100+i*10+j);
                       end
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
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,lamp*100+i*10+j);
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
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,solderingIron*100+i*10+j);
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
                                plotMulFigureSmartMeter(pAddPf,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,bus*100+i*10+j);
                      end
                 end
            end
            fprintf('bus data get over!\n');
            
             save all2.mat fancell miphonecell monitorcell buscell
             fprintf('in getDataToMat2 function , save data to all.mat success!\n')
else
    fprintf('in getDataToMat2 function ,not save data to all.mat\n')
end

end

