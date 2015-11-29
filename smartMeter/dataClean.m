function [trainData,labels ] = dataClean( inputArg,wipeOutData,cleanFlag,label)
%%%%inputArg:��������cell,wipeOutData:��ϴ�����ݰ���������ϴ��cleanFlag:ѡ����ȡĳ������,label����ǩ
%P,PF,U,I
fprintf('GO data clean ......\n');
%��һ��cell�е������������
inputData=[inputArg{1,1},inputArg{1,2},inputArg{1,3},inputArg{1,4}];
%�����������ݵ�ͳ��ֵ
inputData(find(inputData(:,1)==wipeOutData),:)=[];%ȥ�����
inputData=inputData(1:length(inputData)-1,:);%ȥ���ٽ��,�����һ����
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