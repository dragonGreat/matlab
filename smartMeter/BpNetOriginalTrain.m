function  BpNetOriginalTrain(originalNetData,originalNetLabelData,originalTestNetData,originalTestNetLabelData)%,testInputData,testOutputData,ReturnTestMinMaxInputData1,ReturnTestMinMaxOutputData1
%BP网络  
%%%%%%%%%%%%%根据数据自动检索并确定隐层神经元数目，以最小误差为标准，可调用函数%%%%%%%%%%%


[dataTotalP,dataTotalT ]= dataAdd( originalNetData,originalNetLabelData, originalTestNetData,originalTestNetLabelData);
 fprintf('在BpNetOriginalTrain中总样本dataTotalP=%d,dataTotalP2=%d,dataTotalT=%d,dataTotalT2=%d\n',size(dataTotalP,1),size(dataTotalP,2),size(dataTotalT,1),size(dataTotalT,2));
% [trainV,valV,testV] = dividevec(testInputData,testOutputData,0.1,0.8);
%   BPneuronHiddenNum= findNeuronInHiddenLayer(dataTotalP,dataTotalT,9 );
%    fprintf('在BpNetTrain中BPneuronHiddenNum=%d\n',BPneuronHiddenNum);
train_x=dataTotalP;
dbn.sizes = [15 33];%RBM隐含层神经元的
opts.numepochs =  1;
opts.batchsize = 0.5;%1
opts.momentum  =   0;
opts.alpha     =   5;
dbn = dbnsetup(dbn, train_x, opts);
dbn = dbntrain(dbn, train_x, opts);

hitNum1=0;
hitNumBP1=0;
N=size(dataTotalP,2);
indices=crossvalind('Kfold',N,10);
for n=1:1
    testFoldLogic=(indices==n);
    trainFoldLogic=~testFoldLogic;
    trainDataTotalP=dataTotalP(:,trainFoldLogic);
    trainDataTotalT=dataTotalT(:,trainFoldLogic);
     fprintf('在第%d次Train训练样本中总样本=%d,训练样本=%d\n',n,size(dataTotalP,2),size(trainDataTotalP,2));
%     fprintf('indices=%d,test1=%d,train1=%d\n',indices,test1,train1);


%%%%%%选定隐层神经元数目后，建立网络，训练仿真。%%%%%%%%%%
net=newff(trainDataTotalP,trainDataTotalT,33,{'logsig','tansig'},'trainlm');
%net=newff(minmax(trainDataTotalP),[33,9],{'logsig','tansig'},'trainlm');
%相关层传递函数
%purelin 线性传递函数
%tansig 正切 S 型传递函数
%logsig 对数 S 型传递函数
%学习训练函数：动量BP算法：traingdm
      net.IW{1,1}= dbn.rbm{2}.W;%隐含层权值向量
%       net.LW{2,1}=zeros(size(net.LW{2,1}))+0.75;%输出层权值向量
      net.b{1,1}=dbn.rbm{2}.c;%输入到隐含层权值阈值
%       net.b{2,1}=zeros(size(net.b{2,1}));%隐含层到输出层权值向量
     
      net.trainparam.show = 100; % 显示频率，这里设置为没训练100次显示一次
      net.trainparam.epochs = 30000 ;%训练次数
      net.trainparam.goal = 0.005 ;%训练目标最小误差
      net.trainParam.lr = 0.9 ;%学习速率
      init(net);%训练网络前初始化网络
      net=train(net,trainDataTotalP,trainDataTotalT);
      y=sim(net,trainDataTotalP);%仿真并输出
      e=trainDataTotalT-y;%输入与神经元的差值
      error=mse(e,net);%error为网络的误差向量
      r=norm(error);%r为网络的整体误差
      fprintf('DBN训练网络的误差：error=%f,r=%f\n',error,r);
%      e
%       w1=net.IW{1}     %输入到隐层权值
%       theta1=net.b{1}   %隐层阈值
%       w2=net.LW{2}      %隐层到输出层权值
%       theta2=net.b{2}    %输出层阈值
      save BpNetOfMyDBN net 
%%%%%%%%%%%%将训练输出结果反归一化，输入不用%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
writeToTxtFuction(5,0,0,0,net.IW{1,1});
writeToTxtFuction(6,0,0,0,net.b{1,1});
writeToTxtFuction(7,0,0,0,net.LW{2,1});
writeToTxtFuction(8,0,0,0,net.b{2,1});
%%%%%%%%%%%预测%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
predictInputData=dataTotalP(:,testFoldLogic);
% ss1=size(predictInputData,2)
objectOutputData=dataTotalT(:,testFoldLogic);
% ss2=size(objectOutputData,2)
predictionOutput=sim(net,predictInputData);
% ss3=size(predictionOutput,2)
%%%%%%%%%%%%将测试输出结果反归一化，输入不用%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rowNum= size(predictionOutput,2) ;
for ii1=1:rowNum
index(ii1)=find(max(predictionOutput(:,ii1))==(predictionOutput(:,ii1)));
end

%%%%%%%%%%统计识别正确率%%%%%%%%%%%%%%%%%%%%%%%

        hitNum(n) = 0 ;
        for ii2 = 1 : rowNum
            if(index(ii2)==find(max(objectOutputData(:,ii2))==objectOutputData(:,ii2))) 
                 hitNum(n) = hitNum(n) + 1 ; 
            end
        end
         hitNum1=hitNum1+100 * hitNum(n) / rowNum;
         fprintf('DBN测试样本数behaviorClass=%d,正确样本数hitNum=%d，正确识别率是 hitNum=%0.6f%%\n\n',rowNum,hitNum(n),100 * hitNum(n) / rowNum );
%  %%%%%%%%%%%%%%BP%%%%%%%%%%%%%%%%%%%%%  
      fprintf('GO BP!\n');
      net1=newff(trainDataTotalP,trainDataTotalT,33,{'purelin','tansig'},'trainlm');%purelin
      net1.trainparam.show = 100; % 显示频率，这里设置为没训练100次显示一次
      net1.trainparam.epochs = 30000 ;%训练次数
      net1.trainparam.goal = 0.005 ;%训练目标最小误差
      net1.trainParam.lr = 0.9 ;%学习速率
      init(net1);%训练网络前初始化网络
      net1=train(net1,trainDataTotalP,trainDataTotalT);
      y=sim(net1,trainDataTotalP);%仿真并输出
      e=trainDataTotalT-y;%输入与神经元的差值
      error=mse(e,net1);%error为网络的误差向量
      r=norm(error);%r为网络的整体误差
      fprintf('BP训练网络的误差：error=%f,r=%f\n',error,r);
      save BpNetOfMyBP net1 
      
predictInputData=dataTotalP(:,testFoldLogic);
% ss1=size(predictInputData,2)
objectOutputData=dataTotalT(:,testFoldLogic);
% ss2=size(objectOutputData,2)
predictionOutputbp=sim(net1,predictInputData);
% ss3=size(predictionOutput,2)
%%%%%%%%%%%%将测试输出结果反归一化，输入不用%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rowNumbp= size(predictionOutputbp,2) ;
for ii1=1:rowNumbp
indexBP(ii1)=find(max(predictionOutputbp(:,ii1))==(predictionOutputbp(:,ii1)));
end
for ii1=1:rowNumbp
indexobeject(ii1)=find(max(objectOutputData(:,ii1))==(objectOutputData(:,ii1)));
end
%%%%%%%%%%统计识别正确率%%%%%%%%%%%%%%%%%%%%%%%

        hitNumBP(n) = 0 ;
        for ii2 = 1 : rowNumbp
            if(indexBP(ii2)==find(max(objectOutputData(:,ii2))==objectOutputData(:,ii2))) 
                 hitNumBP(n) = hitNumBP(n) + 1 ; 
            end
        end
         hitNumBP1=hitNumBP1+100 * hitNumBP(n) / rowNumbp;
         fprintf('BP测试样本数behaviorClass=%d,正确样本数=%d，正确识别率是 =%0.6f%%\n\n',rowNumbp,hitNumBP(n),100 * hitNumBP(n) / rowNumbp );
end
%  %%%%%%%%%%%%%%作图%%%%%%%%%%%%%%%%%%%%%
functionOfPlot(predictionOutput,1,'DBN网络测试样本数量','DBN中每个样本属于所识别行为的准确率','DBN模型测试','k.');%
functionOfPlot(index,2,'DBN网络测试样本数量','DBN识别出行为所属的类别','DBN模型对人体行为的识别效果','k*');
functionOfPlot(predictionOutputbp,3,'BP网络测试样本数量','BP中每个样本属于所识别行为的准确率','BP模型测试','k.');%
functionOfPlot(indexBP,4,'BP网络测试样本数量','BP识别出行为所属的类别','BP模型对人体行为的识别效果','k*');
% functionOfPlot(predictionOutput,4,'BP测试数据输入样本数）','BP实际网络分类类别','测试识别效果','r.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
n=1:1:294;
plot(n,indexobeject,'k.',n,index,'r.',n,indexBP,'b.');
xlabel('<< 稳定样本集                                 非稳定样本集>>') ;
ylabel('识别出行为所属的类别') ;
title('DBN和BP模型的识别效果') ;
legend('目标行为','DBN识别','BP识别',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('DBN 中10 fold crossvalind平均准确率 hitNum1=%0.6f%%\n', hitNum1 / 10 );
fprintf('BP 中10 fold crossvalind平均准确率 hitNumBP1=%0.6f%%\n', hitNumBP1 / 10 );
end
     

   









