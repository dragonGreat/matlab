function [ave,var,maxValue,minValue ] = getTheDataFeature( inputArg,wipeOutData)
inputData=[inputArg{1,1},inputArg{1,2},inputArg{1,3},inputArg{1,4}];
%�����������ݵ�ͳ��ֵ


inputData(find(inputData(:,1)==0),:)=[];




ave=mean(inputData) ; %�Ծ���M��ÿһ��Ϊ���󣬶�ÿһ�е����ݷֱ���������
var= std(inputData,0,1);   %����
[maxValue,~]=max(inputData);   %���ֵ
[minValue,~]=min(inputData);  %��Сֵ


end

