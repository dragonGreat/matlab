function [ave,var,maxValue,minValue ] = getTheDataFeature( inputArg,wipeOutData)
inputData=[inputArg{1,1},inputArg{1,2},inputArg{1,3},inputArg{1,4}];
%计算输入数据的统计值


inputData(find(inputData(:,1)==0),:)=[];




ave=mean(inputData) ; %以矩阵M的每一列为对象，对每一列的数据分别求期望。
var= std(inputData,0,1);   %方差
[maxValue,~]=max(inputData);   %最大值
[minValue,~]=min(inputData);  %最小值


end

