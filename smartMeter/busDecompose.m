function [testData ,statusValue]= busDecompose( bus,busChoice)

fprintf('GO  busDecompose ......\n');
%%%%%%%%%%%%%%bus���ݴ���%%%%%%%%%%%%%%%%
busP_ori=bus{1,busChoice}{1,1};%ԭʼ��������
busPF_ori=bus{1,busChoice}{1,2};%ԭʼ������������
busU_ori=bus{1,busChoice}{1,3};%ԭʼ��ѹ
busI_ori=bus{1,busChoice}{1,4};%ԭʼ����
Plength=length(busP_ori);%���ݸ����������ʱ��
busP=[0;busP_ori];%���ʳ�ʼ�в�0
busPF=[1000;busPF_ori];%�������ӳ�ʼ�в�1
busU=[2200;busU_ori];%��ѹ��ʼ�в�2200
busI=[0;busI_ori];%������ʼ�в�0
%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%
t0=1;%��ʼʱ��
t1=1;%��һ��״̬��ʱ��
threshold_value=30;%��ֵ
busP_threshold_P=threshold_value;%������ֵ
busP_threshold_N=-threshold_value;%������ֵ
statusValue=1;%ͳ��״̬��
equipmentNum=0;%�����������ص��豸��
fprintf('\n');
%%%%%%%%%%%%decompose%%%%%%%%%%%%%%%%%%
 for i=1:Plength
      busResultP(i)=busP(i+1,1)-busP(i,1);%ȷ����һ��״̬�����
      busResultPF(i)=busPF(i+1,1)-busPF(i,1);
      busResultU(i)=busU(i+1,1)-busU(i,1);
      busResultI(i)=busI(i+1,1)-busI(i,1);
      
      if(busResultP(i)>busP_threshold_P)
%           sp(statusValue)=busResultP(i);
%           spf(statusValue)=busResultPF(i);
%           si(statusValue)=busResultI(i);
          equipmentNum=equipmentNum+1;
         % B(statusValue,3)=[busResultP(i),busResultPF(i),busResultI(i)];
          t1=i;
%%%%%%%%%%%%%��ֵ%%%%%%%%%%%%%%%%%%%
          P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
          PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
          U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
          I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
         
          if(statusValue==1)
              preMeanStatus=0;
              testData{statusValue}=busP_ori(t0:t1-1,1)-preMeanStatus;
          else
             preMeanStatus=abs(P_recog(statusValue-1));     
             testData{statusValue}=abs(busP_ori(t0:t1-1,1)-preMeanStatus);
          end
%%%%%%%%%%%%%���ֵ%%%%%%%%%%%%%%%%%%%          
%           [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
%           [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
%           [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
% %%%%%%%%%%%%%��Сֵ%%%%%%%%%%%%%%%%%%%          
%           [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
%           [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
%           [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
% %%%%%%%%%%%%%��׼��%%%%%%%%%%%%%%%%%%%
%           busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
%           busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
%           busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('��ֵP=%f����ֵPF=%f,��ֵU=%f����ֵI=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
          statusValue=statusValue+1;
          t0=t1;
      end
      
      if(busResultP(i)<busP_threshold_N)
%           sp(statusValue)=-busResultP(i);
%           spf(statusValue)=-busResultPF(i);
%           si(statusValue)=-busResultI(i);
          equipmentNum=equipmentNum-1;
        %  B(statusValue,3)=[busResultP(i),busResultPF(i),busResultI(i)];
          t1=i;
          P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
          PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
          U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
          I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
          if(statusValue==1)
              preMeanStatus=0;
              testData{statusValue}=busP_ori(t0:t1-1,1)-preMeanStatus;
          else

             preMeanStatus=abs(P_recog(statusValue-1));
             testData{statusValue}=abs(busP_ori(t0:t1-1,1)-preMeanStatus);
          end
%            [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
%           [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
%           [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
%           
%           [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
%           [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
%           [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
%           
%           busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
%           busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
%           busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
         
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('��ֵP=%f����ֵPF=%f,��ֵU=%f����ֵI=%f\n\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
          t0=t1;
          statusValue=statusValue+1;
      end
      
%       if(i==Plength)%���һ������ʱ
% %           sp(statusValue)=-busResultP(i);
% %           spf(statusValue)=-busResultPF(i);
% %           si(statusValue)=-busResultI(i);
%            equipmentNum=equipmentNum-1;
%            %B(statusValue,3)=[busResultP(i),busResultPF(i),busResultI(i)];
%            t1=i;
%            P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
%            PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
%            U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
%            I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
%           if(statusValue==1)
%               preMeanStatus=0;
%              testData{statusValue}=busP_ori(t0:t1-1,1)-preMeanStatus;
%           else
%               preMeanStatus=abs(P_recog(statusValue-1));
%               testData{statusValue}=abs(busP_ori(t0:t1-1,1)-preMeanStatus);
%           end
%           [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
%           [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
%           [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
%           
%           [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
%           [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
%           [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
%           
%           busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
%           busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
%           busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
          
%           fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
 %          fprintf('��ֵP=%f����ֵPF=%f,��ֵU=%f����ֵI=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
%      end
end
[U_max,~]=max(busU_ori);
[U_min,~]=min(busU_ori);
fprintf('״̬�ı�����statusValue=%d,��ѹ���ֵ=%fV����Сֵ=%fV��(���ֵ-��Сֵ)=%fV\n',statusValue,U_max,U_min,U_max-U_min);  
fprintf('\n');
end

