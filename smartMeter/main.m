%%1.���ݻ�ȡ˳�� 'P','PF','U','I'
close all;
clear;
clc;
fprintf('main  function lets go ! ... ...\n');
wipeOutData=0;
isGetDataToMat=0;%0������all.mat�����ݣ�1�ٴθ���all.mat�е����� ����û�������ݵ������ֻҪ�ڵ�һ��ʹ��ʱ��1,Ĭ��Ϊ0
getDataToMat(isGetDataToMat);%�����ݴ�excel��ת��mat��
allData=load('all.mat');
fan=allData.fancell;%��ȡ����ÿ������
miphone=allData.miphonecell;%��ȡ�ֻ�ÿ������
monitor=allData.monitorcell;%��ȡ��ʾ��ÿ������
bus=allData.buscell;%��ȡ����ÿ������
[fanAve,fanVar,fanMax,fanMin] = getTheDataFeature(allData.fancell{1,1},wipeOutData);
fprintf('getdata:%f,%f,%f,%f\n',fanAve,fanVar,fanMax,fanMin);

busP_ori=bus{1,1}{1,1};
busPF_ori=bus{1,1}{1,2};
busU_ori=bus{1,1}{1,3}/10;
busI_ori=bus{1,1}{1,4};
Plength=length(busP_ori);%���ݸ����������ʱ��
busP=[0;busP_ori];%���ʳ�ʼ�в�0
busPF=[1;busPF_ori];%�������ӳ�ʼ�в�1
busU=[0;busU_ori];%��ѹ��ʼ�в�220
busI=[0;busI_ori];%������ʼ�в�0

t0=1;%��ʼʱ��
t1=1;%��һ��״̬��ʱ��
threshold_value=40;%��ֵ
busP_threshold_P=threshold_value;%������ֵ
busP_threshold_N=-threshold_value;%������ֵ
statusValue=1;
equipmentNum=0;%�����������ص��豸��
 fprintf('\n');
for i=1:Plength
      busResultP(i)=busP(i+1,1)-busP(i,1);
      busResultPF(i)=busPF(i+1,1)-busPF(i,1);
      busResultU(i)=busU(i+1,1)-busU(i,1);
      busResultI(i)=busI(i+1,1)-busI(i,1);
      
      if(busResultP(i)>busP_threshold_P)
          equipmentNum=equipmentNum+1;
          t1=i;
          P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
          PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
          U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
          I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
          
          [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
          [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
          [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
          
          [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
          [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
          [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
          
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('P_recog=%f��PF_recog=%f,U_recog=%f��I_recog=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
          statusValue=statusValue+1;
          t0=t1;
      end
      
      if(busResultP(i)<busP_threshold_N)
          equipmentNum=equipmentNum-1;
          t1=i;
          P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
          PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
          U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
          I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
          
           [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
          [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
          [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
          
          [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
          [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
          [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('P_recog=%f��PF_recog=%f,U_recog=%f��I_recog=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
          t0=t1;
          statusValue=statusValue+1;
      end
      
      if(i==Plength)
           equipmentNum=equipmentNum-1;
           t1=i;
           P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
           PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
           U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
           I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
           
          [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
          [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
          [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
          
          [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
          [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
          [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
          
           fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
           fprintf('P_recog=%f��PF_recog=%f,U_recog=%f��I_recog=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
      end
end
[U_max,~]=max(busU_ori);
[U_min,~]=min(busU_ori);
fprintf('״̬�ı�����statusValue=%d,��ѹ���ֵ=%fV����Сֵ=%fV��(���ֵ-��Сֵ)=%fV\n',statusValue,U_max,U_min,U_max-U_min);  
 fprintf('\n');

%[y,ps] = mapminmax(x,0,1);
%y2 = mapminmax('apply',x2,PS)
figure(1);
[y1,ps] = mapminmax(busResultP,0,1);
plot(y1,'r');
hold on;
y2 = mapminmax('apply',busResultPF,ps);
plot(y2,'b');
y3 = mapminmax('apply',busResultU,ps);
plot(y3,'g');
y4 = mapminmax('apply',busResultI,ps);
plot(y4,'k');
hold off;
 title('P,PF,U,I��������״̬�л������е�����');
 legend('P','PF','U','I','location','Best');
 
 figure(2);
r1 = mapminmax('apply',busP_max-busP_min,ps);
plot(r1,'r');
hold on;
 r2 = mapminmax('apply',busPF_max-busPF_min,ps);
 plot(r2,'b');
 r3 = mapminmax('apply',busI_max-busI_min,ps);
 plot(r3,'k');
 hold off;
 legend('P','PF','I','location','Best');
 title('P,PF,I�е����ֵ����Сֵ����������״̬�л������е�����');
 
figure(3);
plot(P_recog,PF_recog,'b*',PF_recog,P_recog,'r*')
 title('bus');
xlabel('power/W');
ylabel('PF');

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
%                 title('���ȣ�С���ֻ�����ʾ��');
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
