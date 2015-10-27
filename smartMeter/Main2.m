%%1.数据获取顺序 'P','PF','U','I'
close all;
clear;
clc;
fprintf('Main2  function lets go ! ... ...\n');
wipeOutData=0;
isGetDataToMat2=1;%0不更新all.mat中数据，1再次更新all.mat中的数据 ，在没有新数据的情况下只要在第一次使用时赋1,默认为0
getDataToMat2(isGetDataToMat2);%将数据从excel中转到mat中

allData=load('all.mat');

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



