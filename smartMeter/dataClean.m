function [trainData,labels ] = dataClean( inputArg,wipeOutData,cleanFlag,label)
%%%%inputArg:输入数据cell,wipeOutData:清洗的数据按行整体清洗，cleanFlag:选择提取某种数据,label：标签
%P,PF,U,I
fprintf('GO data clean ......\n');
%将一个cell中的特征计算出来
inputData=[inputArg{1,1},inputArg{1,2},inputArg{1,3},inputArg{1,4}];
%计算输入数据的统计值
inputData(find(inputData(:,1)==wipeOutData),:)=[];%去掉零点
inputData=inputData(1:length(inputData)-1,:);%去除临界点,即最后一个点
labels=zeros(length(inputData),1);
    if(cleanFlag==1)
        trainData=inputData(:,1);%cleanFlag=1;P
    elseif(cleanFlag==2)
        trainData=inputData(:,2);%cleanFlag=2,PF
    elseif(cleanFlag==3)
        trainData=inputData(:,4);%,cleanFlag=3;I
    else
        fprintf('in dataClean ,please input cleanFlag 1,2 or 3......\n');
    end
 labels(:,1)=label;
end