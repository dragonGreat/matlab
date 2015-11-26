function  BpNetTrain(originalNetData,originalNetLabelData,originalTestNetData,originalTestNetLabelData)%,testInputData,testOutputData,ReturnTestMinMaxInputData1,ReturnTestMinMaxOutputData1
%BP����  
%%%%%%%%%%%%%���������Զ�������ȷ��������Ԫ��Ŀ������С���Ϊ��׼���ɵ��ú���%%%%%%%%%%%
[dataTotalP,dataTotalT]= dataAdd( originalNetData,originalNetLabelData, originalTestNetData,originalTestNetLabelData);
% [trainV,valV,testV] = dividevec(testInputData,testOutputData,0.1,0.8);

%  BPneuronHiddenNum= findNeuronInHiddenLayer(dataTotalP,dataTotalT,behaviorClass );
%  fprintf('��BpNetTrain��BPneuronHiddenNum=%d\n',BPneuronHiddenNum);
%%%%%%ѡ��������Ԫ��Ŀ�󣬽������磬ѵ�����档%%%%%%%%%%
%net=newff(minmax(dataIn),[3,1],{'tansig','purelin'},'trainlm');
net=newff(minmax(trainDataTotalP),[33,9],{'logsig','tansig'},'trainlm');
%��ز㴫�ݺ���
%purelin ���Դ��ݺ���
%tansig ���� S �ʹ��ݺ���
%logsig ���� S �ʹ��ݺ���
%ѧϰѵ������������BP�㷨��traingdm
%       net.IW{1,1}=zeros(size(net.IW{1,1}))+0.5;%������Ȩֵ����
%       net.LW{2,1}=zeros(size(net.LW{2,1}))+0.75;%�����Ȩֵ����
%       net.b{1,1}=zeros(size(net.b{1,1}))+0.5;%���뵽������Ȩֵ��ֵ
%       net.b{2,1}=zeros(size(net.b{2,1}));%�����㵽�����Ȩֵ����
     
      net.trainparam.show = 100; % ��ʾƵ�ʣ���������Ϊûѵ��50����ʾһ��
      net.trainparam.epochs = 2000 ;%ѵ������
      net.trainparam.goal = 0.005 ;%ѵ��Ŀ����С���
      net.trainParam.lr = 0.001 ;%ѧϰ����
      %init(net);%ѵ������ǰ��ʼ������
      net=train(net,dataTotalP,dataTotalT);
      y=sim(net,dataTotalP);%���沢���
      e=dataTotalT-y;%��������Ԫ�Ĳ�ֵ
      error=mse(e,net);%errorΪ������������
      r=norm(error);%rΪ������������
      fprintf('ѵ���������error=%f,r=%f\n',error,r);
%      e
%       w1=net.IW{1}     %���뵽����Ȩֵ
%       theta1=net.b{1}   %������ֵ
%       w2=net.LW{2}      %���㵽�����Ȩֵ
%       theta2=net.b{2}    %�������ֵ
      save BpNetOfMy3 net 
%%%%%%%%%%%%��ѵ������������һ�������벻��%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

writeToTxtFuction(5,0,0,0,net.IW{1,1});
writeToTxtFuction(6,0,0,0,net.b{1,1});
writeToTxtFuction(7,0,0,0,net.LW{2,1});
writeToTxtFuction(8,0,0,0,net.b{2,1});
fprintf('over!\n' );
end
     

   







% newff�����ĸ�ʽΪ��
%  
% net=newff(PR,[S1 S2 ...SN],{TF1 TF2...TFN},BTF,BLF,PF��������newff����һ����ѵ����ǰ�����硣�������˵����
%  
% PR��Rx2�ľ����Զ���R��������������Сֵ�����ֵ��
%  
% Si����i����Ԫ������
%  
% TFi����i��Ĵ��ݺ�����Ĭ�Ϻ���Ϊtansig������
%  
% BTF��ѵ��������Ĭ�Ϻ���Ϊtrainlm������
%  
% BLF��Ȩֵ/��ֵѧϰ������Ĭ�Ϻ���Ϊlearngdm������
%  
% PF�����ܺ�����Ĭ�Ϻ���Ϊmse������


%�������õ��﷨
%[trainV,valV,testV] = dividevec(p,t,valPercent,testPercent)
%����pΪ�������ݣ�tΪ�������
%valPercentΪѵ���õı仯�������������еİٷֱ�
%testPercentΪѵ���õĲ����������������еİٷֱ�
%���trainV,valV,testV�ֱ�Ϊ��������Ӧ�ٷֱȣ���ȡ�õ�������
%���⣬���Һ�����ݣ�p��t���Ƕ�Ӧ�ģ������ʹ��

