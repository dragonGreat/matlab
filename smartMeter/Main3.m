%%1.���ݻ�ȡ˳�� 'P','PF','U','I'
%%%fan,hairdryer,kettle,mipad,pc
%fan1-4:a,b,c,d 
%hairdryer1-3:efg
%kettle:h,mipad:i,pc:j
close all;
clear;
clc;
fprintf('Main3  function lets go ! ... ...\n');
wipeOutData=0;%��Ҫɾ��������
isGetFingerprint=0;%�Ƿ���Ҫ��ȡ�õ�ָ������
isGetDataToMat3=0;%0������all2.mat�����ݣ�1�ٴθ���all2.mat�е����� ����û�������ݵ������ֻҪ�ڵ�һ��ʹ��ʱ��1,Ĭ��Ϊ0
        getDataToMat3(isGetDataToMat3,wipeOutData);%�����ݴ�excel��ת��mat��
        all3Data=load('all3.mat');%���ݵĻ�ȡ
%%%%%%%%%%%%%ÿ���õ������ݻ�ȡ%%%%%%%%%%%%%%%%%%%
fan=all3Data.fancell;%��ȡ����ÿ������
hairdryer=all3Data.hairdryercell;%��ȡ�ֻ�ÿ������
kettle=all3Data.kettlecell;%��ȡ��ʾ��ÿ������
mipad=all3Data.mipadcell;%��ȡ��ƽ��ÿ������
pc=all3Data.pccell;%��ȡ̨��ÿ������
bus=all3Data.buscell;%��ȡ����ÿ������
%%%%%%%%%%%%������ϴ%%%%%%%%%%%%%%%%%%%%
busChoice=1;
[trainData,labels]=GetDataToTrain(fan,hairdryer,kettle,mipad,pc,wipeOutData);
[testData1,statusChanceNum]=busDecompose(bus,busChoice);

for i=1:statusChanceNum
    testData=testData1{1,i};
    targetL=kNN(trainData,labels,testData,5);
    fprintf('the target is :%s\n',targetL);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf('Main2 function fun over!\n');



% �� y         ��ɫ           ��             ����
%      m         �ۺ�           ��             Ȧ��
%      c         ����           ��             ����
%      r         ���           ��             ������ 
%      g         ��ɫ           ��             ʵ��
%      b         ��ɫ           *              ������
%      w         ��ɫ           ��             ����
%      k         ��ɫ         ��.
%                             �� --            �㻮��


% 
% A.A=[1,2,3;1,2,3;3,2,1];
% B=[1,1,1;2,2,2];
% [rowA,colA]=size(A.A);
% [rowB,colB]=size(B);
%           for i=1:rowB
%               for j=1:rowA
%                            s(i,j)=sum((B(i,1)-A.A(j,1))^2+(B(i,2)-A.A(j,2))^2+(B(i,3)-A.A(j,3))^2)  
%               end  
%           end

