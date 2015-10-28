function [aveValue,varValue,maxValue,minValue ] = getTheDataFeature( inputArg,wipeOutData)
%将一个cell中的特征计算出来
inputData=[inputArg{1,1},inputArg{1,2},inputArg{1,3},inputArg{1,4}];
%计算输入数据的统计值
inputData(find(inputData(:,1)==wipeOutData),:)=[];
inputData=inputData(1:length(inputData)-1,:);%去除临界点,即最后一个点
aveValue=mean(inputData) ; %以矩阵M的每一列为对象，对每一列的数据分别求期望。
varValue= std(inputData,0,1);   %标准差
[maxValue,~]=max(inputData);   %最大值
[minValue,~]=min(inputData);  %最小值
end

