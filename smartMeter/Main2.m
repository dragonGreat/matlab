%%1.���ݻ�ȡ˳�� 'P','PF','U','I'
%%%fan,miphone,monitor,mipad,lamp,solderingIron
%����  �������ӣ����� ��ά�ռ�
%s0=0,s1=fan1,s2=fan2,s3=fan3,s4=miphone,s5=monitor,s6=mipad,s7=lamp,s8=solderingIron
%fan1=[]
close all;
clear;
clc;
fprintf('Main2  function lets go ! ... ...\n');
wipeOutData=0;%��Ҫɾ��������
isGetFingerprint=1;%�Ƿ���Ҫ��ȡ�õ�ָ������
isGetDataToMat2=1;%0������all2.mat�����ݣ�1�ٴθ���all2.mat�е����� ����û�������ݵ������ֻҪ�ڵ�һ��ʹ��ʱ��1,Ĭ��Ϊ0
        getDataToMat2(isGetDataToMat2,wipeOutData);%�����ݴ�excel��ת��mat��
        all2Data=load('all2.mat');
%%%%%%%%%%%%%ÿ���õ������ݻ�ȡ%%%%%%%%%%%%%%%%%%%
fan=all2Data.fancell;%��ȡ����ÿ������
miphone=all2Data.miphonecell;%��ȡ�ֻ�ÿ������
monitor=all2Data.monitorcell;%��ȡ��ʾ��ÿ������
mipad=all2Data.mipadcell;%��ȡ��ƽ��ÿ������
lamp=all2Data.lampcell;%��ȡ̨��ÿ������
solderingIron=all2Data.solderingIroncell;%��ȡ������ÿ������

bus=all2Data.buscell;%��ȡ����ÿ������
%%%%%%%%%%%%ָ�ƽ�ģA%%%%%%%%%%%%%%%%%%%%

getFingerprint(isGetFingerprint ,wipeOutData,fan,miphone,monitor,mipad,lamp,solderingIron )
    A=load('A.mat');%��ȡָ�ƣ�ʹ��ָ�ƾ���A.A
    Aaa=load('A.mat');
    A=A.A';
[y1,ps] = mapminmax(A,0,1);
A=y1';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
busChoice=4;%ѡ��ڼ���bus
busP_ori=bus{1,busChoice}{1,1};%ԭʼ��������
busPF_ori=bus{1,busChoice}{1,2};%ԭʼ������������
busU_ori=bus{1,busChoice}{1,3};%ԭʼ��ѹ
busI_ori=bus{1,busChoice}{1,4};%ԭʼ����
Plength=length(busP_ori);%���ݸ����������ʱ��
busP=[0;busP_ori];%���ʳ�ʼ�в�0
busPF=[1000;busPF_ori];%�������ӳ�ʼ�в�1
busU=[2200;busU_ori];%��ѹ��ʼ�в�2200
busI=[0;busI_ori];%������ʼ�в�0


t0=1;%��ʼʱ��
t1=1;%��һ��״̬��ʱ��
threshold_value=40;%��ֵ
busP_threshold_P=threshold_value;%������ֵ
busP_threshold_N=-threshold_value;%������ֵ
statusValue=1;%ͳ��״̬��
equipmentNum=0;%�����������ص��豸��
 fprintf('\n');
 
 for i=1:Plength
      busResultP(i)=busP(i+1,1)-busP(i,1);
      busResultPF(i)=busPF(i+1,1)-busPF(i,1);
      busResultU(i)=busU(i+1,1)-busU(i,1);
      busResultI(i)=busI(i+1,1)-busI(i,1);
      
      if(busResultP(i)>busP_threshold_P)
          sp(statusValue)=busResultP(i);
          spf(statusValue)=busResultPF(i);
          si(statusValue)=busResultI(i);
          equipmentNum=equipmentNum+1;
         % B(statusValue,3)=[busResultP(i),busResultPF(i),busResultI(i)];
          t1=i;
%%%%%%%%%%%%%��ֵ%%%%%%%%%%%%%%%%%%%
          P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
          PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
          U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
          I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%���ֵ%%%%%%%%%%%%%%%%%%%          
          [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
          [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
          [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%��Сֵ%%%%%%%%%%%%%%%%%%%          
          [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
          [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
          [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%��׼��%%%%%%%%%%%%%%%%%%%
          busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
          busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
          busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('P_recog=%f��PF_recog=%f,U_recog=%f��I_recog=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
          statusValue=statusValue+1;
          t0=t1;
      end
      
      if(busResultP(i)<busP_threshold_N)
          sp(statusValue)=-busResultP(i);
          spf(statusValue)=-busResultPF(i);
          si(statusValue)=-busResultI(i);
          equipmentNum=equipmentNum-1;
        %  B(statusValue,3)=[busResultP(i),busResultPF(i),busResultI(i)];
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
          
          busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
          busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
          busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
         
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('P_recog=%f��PF_recog=%f,U_recog=%f��I_recog=%f\n\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
          t0=t1;
           statusValue=statusValue+1;
      end
      
      if(i==Plength)
          sp(statusValue)=-busResultP(i);
          spf(statusValue)=-busResultPF(i);
          si(statusValue)=-busResultI(i);
           equipmentNum=equipmentNum-1;
           %B(statusValue,3)=[busResultP(i),busResultPF(i),busResultI(i)];
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
          
          busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
          busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
          busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
          
           fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
           fprintf('P_recog=%f��PF_recog=%f,U_recog=%f��I_recog=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
      end
end
[U_max,~]=max(busU_ori);
[U_min,~]=min(busU_ori);
fprintf('״̬�ı�����statusValue=%d,��ѹ���ֵ=%fV����Сֵ=%fV��(���ֵ-��Сֵ)=%fV\n',statusValue,U_max,U_min,U_max-U_min);  
fprintf('\n');
 %%%%%%%%%%%%%��ȡԭʼ�������B%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%��=�Ǵ���״̬������=�Ǵ���״̬������%%%%%%%%%%%%%

  B=[sp',spf',si'];%�������ݾ���
  
 Bbb=B;
 %y2 = mapminmax('apply',B',ps);
 [y2,ps1] = mapminmax(B',0,1);
 B=y2';
%%%%%%%%%%%%��B��A��ŷʽ����%%%%%%%%%%%%%%%%%%%%
[rowA,colA]=size(A);
[rowB,colB]=size(B);
    if(colA==colB)
       
          for i=1:rowB
              for j=1:rowA
                        s(i,j)=sqrt(0*(B(i,1)-A(j,1))^2+0*(B(i,2)-A(j,2))^2+1*(B(i,3)-A(j,3))^2) ;
              end  
          end
        
    else
        fprintf('ָ�ƾ���ʹ������ݾ�������������\n');
    end
similar=(1./(1+s)*100);
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

