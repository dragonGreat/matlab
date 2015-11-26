function  BpNetOriginalTrain(originalNetData,originalNetLabelData,originalTestNetData,originalTestNetLabelData)%,testInputData,testOutputData,ReturnTestMinMaxInputData1,ReturnTestMinMaxOutputData1
%BP����  
%%%%%%%%%%%%%���������Զ�������ȷ��������Ԫ��Ŀ������С���Ϊ��׼���ɵ��ú���%%%%%%%%%%%


[dataTotalP,dataTotalT ]= dataAdd( originalNetData,originalNetLabelData, originalTestNetData,originalTestNetLabelData);
 fprintf('��BpNetOriginalTrain��������dataTotalP=%d,dataTotalP2=%d,dataTotalT=%d,dataTotalT2=%d\n',size(dataTotalP,1),size(dataTotalP,2),size(dataTotalT,1),size(dataTotalT,2));
% [trainV,valV,testV] = dividevec(testInputData,testOutputData,0.1,0.8);
%   BPneuronHiddenNum= findNeuronInHiddenLayer(dataTotalP,dataTotalT,9 );
%    fprintf('��BpNetTrain��BPneuronHiddenNum=%d\n',BPneuronHiddenNum);
train_x=dataTotalP;
dbn.sizes = [15 33];%RBM��������Ԫ��
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
     fprintf('�ڵ�%d��Trainѵ��������������=%d,ѵ������=%d\n',n,size(dataTotalP,2),size(trainDataTotalP,2));
%     fprintf('indices=%d,test1=%d,train1=%d\n',indices,test1,train1);


%%%%%%ѡ��������Ԫ��Ŀ�󣬽������磬ѵ�����档%%%%%%%%%%
net=newff(trainDataTotalP,trainDataTotalT,33,{'logsig','tansig'},'trainlm');
%net=newff(minmax(trainDataTotalP),[33,9],{'logsig','tansig'},'trainlm');
%��ز㴫�ݺ���
%purelin ���Դ��ݺ���
%tansig ���� S �ʹ��ݺ���
%logsig ���� S �ʹ��ݺ���
%ѧϰѵ������������BP�㷨��traingdm
      net.IW{1,1}= dbn.rbm{2}.W;%������Ȩֵ����
%       net.LW{2,1}=zeros(size(net.LW{2,1}))+0.75;%�����Ȩֵ����
      net.b{1,1}=dbn.rbm{2}.c;%���뵽������Ȩֵ��ֵ
%       net.b{2,1}=zeros(size(net.b{2,1}));%�����㵽�����Ȩֵ����
     
      net.trainparam.show = 100; % ��ʾƵ�ʣ���������Ϊûѵ��100����ʾһ��
      net.trainparam.epochs = 30000 ;%ѵ������
      net.trainparam.goal = 0.005 ;%ѵ��Ŀ����С���
      net.trainParam.lr = 0.9 ;%ѧϰ����
      init(net);%ѵ������ǰ��ʼ������
      net=train(net,trainDataTotalP,trainDataTotalT);
      y=sim(net,trainDataTotalP);%���沢���
      e=trainDataTotalT-y;%��������Ԫ�Ĳ�ֵ
      error=mse(e,net);%errorΪ������������
      r=norm(error);%rΪ������������
      fprintf('DBNѵ���������error=%f,r=%f\n',error,r);
%      e
%       w1=net.IW{1}     %���뵽����Ȩֵ
%       theta1=net.b{1}   %������ֵ
%       w2=net.LW{2}      %���㵽�����Ȩֵ
%       theta2=net.b{2}    %�������ֵ
      save BpNetOfMyDBN net 
%%%%%%%%%%%%��ѵ������������һ�������벻��%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
writeToTxtFuction(5,0,0,0,net.IW{1,1});
writeToTxtFuction(6,0,0,0,net.b{1,1});
writeToTxtFuction(7,0,0,0,net.LW{2,1});
writeToTxtFuction(8,0,0,0,net.b{2,1});
%%%%%%%%%%%Ԥ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
predictInputData=dataTotalP(:,testFoldLogic);
% ss1=size(predictInputData,2)
objectOutputData=dataTotalT(:,testFoldLogic);
% ss2=size(objectOutputData,2)
predictionOutput=sim(net,predictInputData);
% ss3=size(predictionOutput,2)
%%%%%%%%%%%%����������������һ�������벻��%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rowNum= size(predictionOutput,2) ;
for ii1=1:rowNum
index(ii1)=find(max(predictionOutput(:,ii1))==(predictionOutput(:,ii1)));
end

%%%%%%%%%%ͳ��ʶ����ȷ��%%%%%%%%%%%%%%%%%%%%%%%

        hitNum(n) = 0 ;
        for ii2 = 1 : rowNum
            if(index(ii2)==find(max(objectOutputData(:,ii2))==objectOutputData(:,ii2))) 
                 hitNum(n) = hitNum(n) + 1 ; 
            end
        end
         hitNum1=hitNum1+100 * hitNum(n) / rowNum;
         fprintf('DBN����������behaviorClass=%d,��ȷ������hitNum=%d����ȷʶ������ hitNum=%0.6f%%\n\n',rowNum,hitNum(n),100 * hitNum(n) / rowNum );
%  %%%%%%%%%%%%%%BP%%%%%%%%%%%%%%%%%%%%%  
      fprintf('GO BP!\n');
      net1=newff(trainDataTotalP,trainDataTotalT,33,{'purelin','tansig'},'trainlm');%purelin
      net1.trainparam.show = 100; % ��ʾƵ�ʣ���������Ϊûѵ��100����ʾһ��
      net1.trainparam.epochs = 30000 ;%ѵ������
      net1.trainparam.goal = 0.005 ;%ѵ��Ŀ����С���
      net1.trainParam.lr = 0.9 ;%ѧϰ����
      init(net1);%ѵ������ǰ��ʼ������
      net1=train(net1,trainDataTotalP,trainDataTotalT);
      y=sim(net1,trainDataTotalP);%���沢���
      e=trainDataTotalT-y;%��������Ԫ�Ĳ�ֵ
      error=mse(e,net1);%errorΪ������������
      r=norm(error);%rΪ������������
      fprintf('BPѵ���������error=%f,r=%f\n',error,r);
      save BpNetOfMyBP net1 
      
predictInputData=dataTotalP(:,testFoldLogic);
% ss1=size(predictInputData,2)
objectOutputData=dataTotalT(:,testFoldLogic);
% ss2=size(objectOutputData,2)
predictionOutputbp=sim(net1,predictInputData);
% ss3=size(predictionOutput,2)
%%%%%%%%%%%%����������������һ�������벻��%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rowNumbp= size(predictionOutputbp,2) ;
for ii1=1:rowNumbp
indexBP(ii1)=find(max(predictionOutputbp(:,ii1))==(predictionOutputbp(:,ii1)));
end
for ii1=1:rowNumbp
indexobeject(ii1)=find(max(objectOutputData(:,ii1))==(objectOutputData(:,ii1)));
end
%%%%%%%%%%ͳ��ʶ����ȷ��%%%%%%%%%%%%%%%%%%%%%%%

        hitNumBP(n) = 0 ;
        for ii2 = 1 : rowNumbp
            if(indexBP(ii2)==find(max(objectOutputData(:,ii2))==objectOutputData(:,ii2))) 
                 hitNumBP(n) = hitNumBP(n) + 1 ; 
            end
        end
         hitNumBP1=hitNumBP1+100 * hitNumBP(n) / rowNumbp;
         fprintf('BP����������behaviorClass=%d,��ȷ������=%d����ȷʶ������ =%0.6f%%\n\n',rowNumbp,hitNumBP(n),100 * hitNumBP(n) / rowNumbp );
end
%  %%%%%%%%%%%%%%��ͼ%%%%%%%%%%%%%%%%%%%%%
functionOfPlot(predictionOutput,1,'DBN���������������','DBN��ÿ������������ʶ����Ϊ��׼ȷ��','DBNģ�Ͳ���','k.');%
functionOfPlot(index,2,'DBN���������������','DBNʶ�����Ϊ���������','DBNģ�Ͷ�������Ϊ��ʶ��Ч��','k*');
functionOfPlot(predictionOutputbp,3,'BP���������������','BP��ÿ������������ʶ����Ϊ��׼ȷ��','BPģ�Ͳ���','k.');%
functionOfPlot(indexBP,4,'BP���������������','BPʶ�����Ϊ���������','BPģ�Ͷ�������Ϊ��ʶ��Ч��','k*');
% functionOfPlot(predictionOutput,4,'BP��������������������','BPʵ������������','����ʶ��Ч��','r.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
n=1:1:294;
plot(n,indexobeject,'k.',n,index,'r.',n,indexBP,'b.');
xlabel('<< �ȶ�������                                 ���ȶ�������>>') ;
ylabel('ʶ�����Ϊ���������') ;
title('DBN��BPģ�͵�ʶ��Ч��') ;
legend('Ŀ����Ϊ','DBNʶ��','BPʶ��',2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('DBN ��10 fold crossvalindƽ��׼ȷ�� hitNum1=%0.6f%%\n', hitNum1 / 10 );
fprintf('BP ��10 fold crossvalindƽ��׼ȷ�� hitNumBP1=%0.6f%%\n', hitNumBP1 / 10 );
end
     

   









