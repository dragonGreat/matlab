function [ output_args ] = ANN_agorithm( inputData )

fprintf('GO ANN_agorithm.....\n');
%%%���ݹ�һ��

 net=newff(trainDataTotalP,trainDataTotalT,33,{'purelin','tansig'},'trainlm');%��
      net.trainparam.show = 100; % ��ʾƵ�ʣ���������Ϊûѵ��100����ʾһ��
      net.trainparam.epochs = 30000 ;%ѵ������
      net.trainparam.goal = 0.005 ;%ѵ��Ŀ����С���
      net.trainParam.lr = 0.9 ;%ѧϰ����
      
      init(net);%ѵ������ǰ��ʼ������
      net=train(net,trainDataTotalP,trainDataTotalT);
      y=sim(net,trainDataTotalP);%���沢���
      e=trainDataTotalT-y;%��������Ԫ�Ĳ�ֵ
      error=mse(e,net);%errorΪ������������
      fprintf('BPѵ���������error=%f\n',error);
      save ANN net 
     
%%Ԥ��
predictInputData=dataTotalP(:,testFoldLogic);
% ss1=size(predictInputData,2)
objectOutputData=dataTotalT(:,testFoldLogic);
% ss2=size(objectOutputData,2)
predictionOutputbp=sim(net,predictInputData);
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

