close all;
clear;
clc;
fprintf('main  function lets go ! ... ...\n');
isGetDataToMat=0;%0������all.mat�����ݣ�1�ٴθ���all.mat�е����� ����û�������ݵ������ֻҪ�ڵ�һ��ʹ��ʱ��1,Ĭ��Ϊ0
getDataToMat(isGetDataToMat);
allData=load('all.mat');
bus=allData.buscell;%��ȡ����ÿ������
x=2;
figure(1);
    subplot(2,3,1);
        plot(1:length(bus{1,x}{1,1}),bus{1,x}{1,1}/10,'r');
                title('Power');
                xlabel('number');
                ylabel('value');
                legend('P','location','Best');
    subplot(2,3,2);
        plot(1:length(bus{1,x}{1,2}),bus{1,x}{1,2}/1000,'b');
                title('PowerFactor');
                xlabel('number');
                ylabel('value');
                legend('PF','location','Best');
                
    subplot(2,3,3);
        plot(1:length(bus{1,x}{1,3}),bus{1,x}{1,3}/10,'g');
                title('voltage');
                xlabel('number');
                ylabel('value');
                legend('U','location','Best');
               
    subplot(2,3,4);
        boxplot(bus{1,x}{1,3}/10);
        title('voltage box');

                
     subplot(2,3,5);
        plot(1:length(bus{1,x}{1,4}),bus{1,x}{1,4}/1000,'k');
                title('current');
                xlabel('number');
                ylabel('value');
                legend('I','location','Best');             
                
     subplot(2,3,6);
        plot(1:length(bus{1,x}{1,1}),bus{1,x}{1,1},'r',1:length(bus{1,x}{1,2}),bus{1,x}{1,2},'b',1:length(bus{1,x}{1,3}),bus{1,x}{1,3},'k',1:length(bus{1,x}{1,4}),bus{1,x}{1,4},'g');
                title('all(P,PF,U,I)');
                xlabel('number');
                ylabel('value');
                legend('P','PF','U','I','location','Best');    
       

fprintf('main function fun over!\n');



% �� y         ��ɫ           ��             ����
%      m         �ۺ�           ��             Ȧ��
%      c         ����           ��             ����
%      r         ���           ��             ������ 
%      g         ��ɫ           ��             ʵ��
%      b         ��ɫ           *              ������
%      w         ��ɫ           ��             ����
%      k         ��ɫ         ��.
%                             �� --            �㻮��



% % % % % % % *********************************************************************************************% % %
% fan=allData.fancell;%��ȡ����ÿ������
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
%%������
% figure(2)
% 
% x1=length(bus{1,x}{1,1});
% y1=bus{1,x}{1,1};
% fs=1;
% y=fft(y1);
% mag=abs(y);
% f=(0:length(y)-1)'*fs/length(y);%���ж�Ӧ��Ƶ��ת��
% plot(f,mag)
% % % % % % % *********************************************************************************************% % %

