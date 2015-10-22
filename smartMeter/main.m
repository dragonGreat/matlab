close all;
clear;
clc;
fprintf('main  function lets go ! ... ...\n');
wipeOutData=0;
isGetDataToMat=0;%0不更新all.mat中数据，1再次更新all.mat中的数据 ，在没有新数据的情况下只要在第一次使用时赋1,默认为0
getDataToMat(isGetDataToMat);%将数据从excel中转到mat中
allData=load('all.mat');
fan=allData.fancell;%获取电扇每步数据
miphone=allData.miphonecell;%获取手机每步数据
monitor=allData.monitorcell;%获取显示器每步数据
bus=allData.buscell;%获取总线每步数据

[fanAve,fanVar,fanMax,fanMin] = getTheDataFeature(allData.fancell{1,1},wipeOutData);

fprintf('getdata:%f,%f,%f,%f\n',fanAve,fanVar,fanMax,fanMin);

              

fprintf('main function fun over!\n');



% 　 y         黄色           ·             点线
%      m         粉红           ○             圈线
%      c         亮蓝           ×             ×线
%      r         大红           ＋             ＋字线 
%      g         绿色           －             实线
%      b         蓝色           *              星形线
%      w         白色           ：             虚线
%      k         黑色         －.
%                             　 --            点划线



% % % % % % % *********************************************************************************************% % %
% fan=allData.fancell;%获取电扇每步数据
% x=6;%x=1-6
% figure(1);
%     subplot(2,3,1);
%         plot(1:length(fan{1,x}{1,1}),fan{1,x}{1,1},'r');
%                 title('Power');
%                 xlabel('number');
%                 ylabel('value');
%                 legend('P','location','Best');
%     subplot(2,3,2);
%         plot(1:length(fan{1,x}{1,2}),fan{1,x}{1,2},'b');
%                 title('PowerFactor');
%                 xlabel('number');
%                 ylabel('value');
%                 legend('PF','location','Best');
%                 
%     subplot(2,3,3);
%         plot(1:length(fan{1,x}{1,3}),fan{1,x}{1,3},'g');
%                 title('voltage');
%                 xlabel('number');
%                 ylabel('value');
%                 legend('U','location','Best');
%                
%     subplot(2,3,4);
%         boxplot(fan{1,x}{1,3});
%         title('voltage box');
% 
%                 
%      subplot(2,3,5);
%         plot(1:length(fan{1,x}{1,4}),fan{1,x}{1,4},'k');
%                 title('current');
%                 xlabel('number');
%                 ylabel('value');
%                 legend('I','location','Best');             
%                 
%      subplot(2,3,6);
%         plot(1:length(fan{1,x}{1,1}),fan{1,x}{1,1},'r',1:length(fan{1,x}{1,2}),fan{1,x}{1,2},'b',1:length(fan{1,x}{1,3}),fan{1,x}{1,3},'k',1:length(fan{1,x}{1,4}),fan{1,x}{1,4},'g');
%                 title('all(P,PF,U,I)');
%                 xlabel('number');
%                 ylabel('value');
%                 legend('P','PF','U','I','location','Best');   
% % % % % % % *********************************************************************************************% % %
%%功率谱
% figure(2)
% 
% x1=length(bus{1,x}{1,1});
% y1=bus{1,x}{1,1};
% fs=1;
% y=fft(y1);
% mag=abs(y);
% f=(0:length(y)-1)'*fs/length(y);%进行对应的频率转换
% plot(f,mag)
% % % % % % % *********************************************************************************************% % %


% figure(1);
%     subplot(2,3,1);
%         plot(fan{1,1}{1,1},fan{1,1}{1,2},'ro');
%                 title('fan');
%                 xlabel('power/W');
%                 ylabel('PF');
%                % legend('P','location','Best');
%     subplot(2,3,2);
%         plot(fan{1,2}{1,1},fan{1,2}{1,2},'bo');
%                 title('fan');
%                 xlabel('power/W');
%                 ylabel('PF');
%     subplot(2,3,3);
%         plot(miphone{1,1}{1,1},miphone{1,1}{1,2},'ro');
%                 title('mi');
%                 xlabel('power/W');
%                 ylabel('PF');
%                % legend('P','location','Best');
%     subplot(2,3,4);
%         plot(miphone{1,2}{1,1},miphone{1,2}{1,2},'bo');
%                 title('mi');
%                 xlabel('power/W');
%                 ylabel('PF');
%      subplot(2,3,5);
%         plot(monitor{1,1}{1,1},monitor{1,1}{1,2},'ro');
%                 title('monitor');
%                 xlabel('power/W');
%                 ylabel('PF');
%                % legend('P','location','Best');
%     subplot(2,3,6);
%         plot(monitor{1,2}{1,1},monitor{1,2}{1,2},'bo');
%                 title('monitor');
%                 xlabel('power/W');
%                 ylabel('PF');
% figure(2);
%         plot(fan{1,3}{1,1},fan{1,3}{1,2},'bo',miphone{1,2}{1,1},miphone{1,2}{1,2},'ro',monitor{1,2}{1,1},monitor{1,2}{1,2},'go');
%                 title('风扇，小米手机，显示器');
%                 xlabel('power/W');
%                 ylabel('PF');
%                 legend('fan','miphone','monitor','location','Best');
% 
%  figure(3);
%          plot(bus{1,2}{1,1},bus{1,2}{1,2},'ro');
%                 title('bus');
%                 xlabel('power/W');
%                 ylabel('PF');
 % % % % % % % *********************************************************************************************% % %
