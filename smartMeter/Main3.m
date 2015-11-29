%%1.数据获取顺序 'P','PF','U','I'
%%%fan,hairdryer,kettle,mipad,pc
%fan1-4:a,b,c,d 
%hairdryer1-3:efg
%kettle:h,mipad:i,pc:j
close all;
clear;
clc;
fprintf('Main3  function lets go ! ... ...\n');
wipeOutData=0;%需要删除的数据
isGetFingerprint=0;%是否需要获取用电指纹数据
isGetDataToMat3=0;%0不更新all2.mat中数据，1再次更新all2.mat中的数据 ，在没有新数据的情况下只要在第一次使用时赋1,默认为0
        getDataToMat3(isGetDataToMat3,wipeOutData);%将数据从excel中转到mat中
        all3Data=load('all3.mat');%数据的获取
%%%%%%%%%%%%%每种用电器数据获取%%%%%%%%%%%%%%%%%%%
fan=all3Data.fancell;%获取电扇每步数据
hairdryer=all3Data.hairdryercell;%获取手机每步数据
kettle=all3Data.kettlecell;%获取显示器每步数据
mipad=all3Data.mipadcell;%获取米平板每步数据
pc=all3Data.pccell;%获取台灯每步数据
bus=all3Data.buscell;%获取总线每步数据
%%%%%%%%%%%%数据清洗%%%%%%%%%%%%%%%%%%%%
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



% 　 y         黄色           ·             点线
%      m         粉红           ○             圈线
%      c         亮蓝           ×             ×线
%      r         大红           ＋             ＋字线 
%      g         绿色           －             实线
%      b         蓝色           *              星形线
%      w         白色           ：             虚线
%      k         黑色         －.
%                             　 --            点划线


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

