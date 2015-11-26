function  BpNetTrain(originalNetData,originalNetLabelData,originalTestNetData,originalTestNetLabelData)%,testInputData,testOutputData,ReturnTestMinMaxInputData1,ReturnTestMinMaxOutputData1
%BP网络  
%%%%%%%%%%%%%根据数据自动检索并确定隐层神经元数目，以最小误差为标准，可调用函数%%%%%%%%%%%
[dataTotalP,dataTotalT]= dataAdd( originalNetData,originalNetLabelData, originalTestNetData,originalTestNetLabelData);
% [trainV,valV,testV] = dividevec(testInputData,testOutputData,0.1,0.8);

%  BPneuronHiddenNum= findNeuronInHiddenLayer(dataTotalP,dataTotalT,behaviorClass );
%  fprintf('在BpNetTrain中BPneuronHiddenNum=%d\n',BPneuronHiddenNum);
%%%%%%选定隐层神经元数目后，建立网络，训练仿真。%%%%%%%%%%
%net=newff(minmax(dataIn),[3,1],{'tansig','purelin'},'trainlm');
net=newff(minmax(trainDataTotalP),[33,9],{'logsig','tansig'},'trainlm');
%相关层传递函数
%purelin 线性传递函数
%tansig 正切 S 型传递函数
%logsig 对数 S 型传递函数
%学习训练函数：动量BP算法：traingdm
%       net.IW{1,1}=zeros(size(net.IW{1,1}))+0.5;%隐含层权值向量
%       net.LW{2,1}=zeros(size(net.LW{2,1}))+0.75;%输出层权值向量
%       net.b{1,1}=zeros(size(net.b{1,1}))+0.5;%输入到隐含层权值阈值
%       net.b{2,1}=zeros(size(net.b{2,1}));%隐含层到输出层权值向量
     
      net.trainparam.show = 100; % 显示频率，这里设置为没训练50次显示一次
      net.trainparam.epochs = 2000 ;%训练次数
      net.trainparam.goal = 0.005 ;%训练目标最小误差
      net.trainParam.lr = 0.001 ;%学习速率
      %init(net);%训练网络前初始化网络
      net=train(net,dataTotalP,dataTotalT);
      y=sim(net,dataTotalP);%仿真并输出
      e=dataTotalT-y;%输入与神经元的差值
      error=mse(e,net);%error为网络的误差向量
      r=norm(error);%r为网络的整体误差
      fprintf('训练网络的误差：error=%f,r=%f\n',error,r);
%      e
%       w1=net.IW{1}     %输入到隐层权值
%       theta1=net.b{1}   %隐层阈值
%       w2=net.LW{2}      %隐层到输出层权值
%       theta2=net.b{2}    %输出层阈值
      save BpNetOfMy3 net 
%%%%%%%%%%%%将训练输出结果反归一化，输入不用%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

writeToTxtFuction(5,0,0,0,net.IW{1,1});
writeToTxtFuction(6,0,0,0,net.b{1,1});
writeToTxtFuction(7,0,0,0,net.LW{2,1});
writeToTxtFuction(8,0,0,0,net.b{2,1});
fprintf('over!\n' );
end
     

   







% newff函数的格式为：
%  
% net=newff(PR,[S1 S2 ...SN],{TF1 TF2...TFN},BTF,BLF,PF），函数newff建立一个可训练的前馈网络。输入参数说明：
%  
% PR：Rx2的矩阵以定义R个输入向量的最小值和最大值；
%  
% Si：第i层神经元个数；
%  
% TFi：第i层的传递函数，默认函数为tansig函数；
%  
% BTF：训练函数，默认函数为trainlm函数；
%  
% BLF：权值/阀值学习函数，默认函数为learngdm函数；
%  
% PF：性能函数，默认函数为mse函数。


%函数调用的语法
%[trainV,valV,testV] = dividevec(p,t,valPercent,testPercent)
%输入p为输入数据，t为输出数据
%valPercent为训练用的变化数据在总输入中的百分比
%testPercent为训练用的测试数据在总输入中的百分比
%输出trainV,valV,testV分别为按乱序及相应百分比，抽取得到的数据
%另外，打乱后的数据，p和t都是对应的，请放心使用

