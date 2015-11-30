function [testData ,statusValue]= busDecompose( bus,busChoice)

fprintf('GO  busDecompose ......\n');
%%%%%%%%%%%%%%bus数据处理%%%%%%%%%%%%%%%%
busP_ori=bus{1,busChoice}{1,1};%原始功率数据
busPF_ori=bus{1,busChoice}{1,2};%原始功率因子数据
busU_ori=bus{1,busChoice}{1,3};%原始电压
busI_ori=bus{1,busChoice}{1,4};%原始电流
Plength=length(busP_ori);%数据个数或是相对时间
busP=[0;busP_ori];%功率初始行补0
busPF=[1000;busPF_ori];%功率因子初始行补1
busU=[2200;busU_ori];%电压初始行补2200
busI=[0;busI_ori];%电流初始行补0
%%%%%%%%%%%%参数设置%%%%%%%%%%%%%%%%%%
t0=1;%初始时间
t1=1;%下一个状态的时间
threshold_value=30;%阈值
busP_threshold_P=threshold_value;%正向阈值
busP_threshold_N=-threshold_value;%反向阈值
statusValue=1;%统计状态数
equipmentNum=0;%总线上所挂载的设备数
fprintf('\n');
%%%%%%%%%%%%decompose%%%%%%%%%%%%%%%%%%
 for i=1:Plength
      busResultP(i)=busP(i+1,1)-busP(i,1);%确定下一个状态跳变点
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
%%%%%%%%%%%%%均值%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%最大值%%%%%%%%%%%%%%%%%%%          
%           [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
%           [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
%           [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
% %%%%%%%%%%%%%最小值%%%%%%%%%%%%%%%%%%%          
%           [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
%           [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
%           [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
% %%%%%%%%%%%%%标准差%%%%%%%%%%%%%%%%%%%
%           busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
%           busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
%           busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('均值P=%f，均值PF=%f,均值U=%f，均值I=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
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
          fprintf('均值P=%f，均值PF=%f,均值U=%f，均值I=%f\n\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
          t0=t1;
          statusValue=statusValue+1;
      end
      
%       if(i==Plength)%最后一个数据时
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
 %          fprintf('均值P=%f，均值PF=%f,均值U=%f，均值I=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
%      end
end
[U_max,~]=max(busU_ori);
[U_min,~]=min(busU_ori);
fprintf('状态改变数：statusValue=%d,电压最大值=%fV，最小值=%fV，(最大值-最小值)=%fV\n',statusValue,U_max,U_min,U_max-U_min);  
fprintf('\n');
end

