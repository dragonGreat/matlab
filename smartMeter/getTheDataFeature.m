function [aveValue,varValue,maxValue,minValue ] = getTheDataFeature( inputArg,wipeOutData)
%��һ��cell�е������������
inputData=[inputArg{1,1},inputArg{1,2},inputArg{1,3},inputArg{1,4}];
%�����������ݵ�ͳ��ֵ
inputData(find(inputData(:,1)==wipeOutData),:)=[];
inputData=inputData(1:length(inputData)-1,:);%ȥ���ٽ��,�����һ����
aveValue=mean(inputData) ; %�Ծ���M��ÿһ��Ϊ���󣬶�ÿһ�е����ݷֱ���������
varValue= std(inputData,0,1);   %��׼��
[maxValue,~]=max(inputData);   %���ֵ
[minValue,~]=min(inputData);  %��Сֵ
end

