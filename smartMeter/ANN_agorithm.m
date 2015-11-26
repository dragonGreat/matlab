function [ output_args ] = ANN_agorithm( inputData )

fprintf('GO ANN_agorithm.....\n');
%%%数据归一化

 net=newff(trainDataTotalP,trainDataTotalT,33,{'purelin','tansig'},'trainlm');%新
      net.trainparam.show = 100; % 显示频率，这里设置为没训练100次显示一次
      net.trainparam.epochs = 30000 ;%训练次数
      net.trainparam.goal = 0.005 ;%训练目标最小误差
      net.trainParam.lr = 0.9 ;%学习速率
      
      init(net);%训练网络前初始化网络
      net=train(net,trainDataTotalP,trainDataTotalT);
      y=sim(net,trainDataTotalP);%仿真并输出
      e=trainDataTotalT-y;%输入与神经元的差值
      error=mse(e,net);%error为网络的误差向量
      fprintf('BP训练网络的误差：error=%f\n',error);
      save ANN net 
     
%%预测
predictInputData=dataTotalP(:,testFoldLogic);
% ss1=size(predictInputData,2)
objectOutputData=dataTotalT(:,testFoldLogic);
% ss2=size(objectOutputData,2)
predictionOutputbp=sim(net,predictInputData);
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

