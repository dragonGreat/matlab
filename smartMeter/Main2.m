%%1.数据获取顺序 'P','PF','U','I'
%%%fan,miphone,monitor,mipad,lamp,solderingIron
%功率  功率因子，电流 三维空间
%s0=0,s1=fan1,s2=fan2,s3=fan3,s4=miphone,s5=monitor,s6=mipad,s7=lamp,s8=solderingIron
%fan1=[]
close all;
clear;
clc;
fprintf('Main2  function lets go ! ... ...\n');
wipeOutData=0;%需要删除的数据
isGetFingerprint=1;%是否需要获取用电指纹数据
isGetDataToMat2=1;%0不更新all2.mat中数据，1再次更新all2.mat中的数据 ，在没有新数据的情况下只要在第一次使用时赋1,默认为0
        getDataToMat2(isGetDataToMat2,wipeOutData);%将数据从excel中转到mat中
        all2Data=load('all2.mat');
%%%%%%%%%%%%%每种用电器数据获取%%%%%%%%%%%%%%%%%%%
fan=all2Data.fancell;%获取电扇每步数据
miphone=all2Data.miphonecell;%获取手机每步数据
monitor=all2Data.monitorcell;%获取显示器每步数据
mipad=all2Data.mipadcell;%获取米平板每步数据
lamp=all2Data.lampcell;%获取台灯每步数据
solderingIron=all2Data.solderingIroncell;%获取电烙铁每步数据

bus=all2Data.buscell;%获取总线每步数据
%%%%%%%%%%%%指纹建模A%%%%%%%%%%%%%%%%%%%%

getFingerprint(isGetFingerprint ,wipeOutData,fan,miphone,monitor,mipad,lamp,solderingIron )
    A=load('A.mat');%获取指纹，使用指纹矩阵A.A
    Aaa=load('A.mat');
    A=A.A';
[y1,ps] = mapminmax(A,0,1);
A=y1';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
busChoice=4;%选择第几组bus
busP_ori=bus{1,busChoice}{1,1};%原始功率数据
busPF_ori=bus{1,busChoice}{1,2};%原始功率因子数据
busU_ori=bus{1,busChoice}{1,3};%原始电压
busI_ori=bus{1,busChoice}{1,4};%原始电流
Plength=length(busP_ori);%数据个数或是相对时间
busP=[0;busP_ori];%功率初始行补0
busPF=[1000;busPF_ori];%功率因子初始行补1
busU=[2200;busU_ori];%电压初始行补2200
busI=[0;busI_ori];%电流初始行补0


t0=1;%初始时间
t1=1;%下一个状态的时间
threshold_value=40;%阈值
busP_threshold_P=threshold_value;%正向阈值
busP_threshold_N=-threshold_value;%反向阈值
statusValue=1;%统计状态数
equipmentNum=0;%总线上所挂载的设备数
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
%%%%%%%%%%%%%均值%%%%%%%%%%%%%%%%%%%
          P_recog(statusValue)=mean(busP_ori(t0:t1-1,1));
          PF_recog(statusValue)=mean(busPF_ori(t0:t1-1,1));
          U_recog(statusValue)=mean(busU_ori(t0:t1-1,1));
          I_recog(statusValue)=mean(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%最大值%%%%%%%%%%%%%%%%%%%          
          [busP_max(statusValue),~]=max(busP_ori(t0:t1-1,1));
          [busPF_max(statusValue),~]=max(busPF_ori(t0:t1-1,1));
          [busI_max(statusValue),~]=max(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%最小值%%%%%%%%%%%%%%%%%%%          
          [busP_min(statusValue),~]=min(busP_ori(t0:t1-1,1));
          [busPF_min(statusValue),~]=min(busPF_ori(t0:t1-1,1));
          [busI_min(statusValue),~]=min(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%标准差%%%%%%%%%%%%%%%%%%%
          busP_std(statusValue)=std(busP_ori(t0:t1-1,1));
          busPF_std(statusValue)=std(busPF_ori(t0:t1-1,1));
          busI_std(statusValue)=std(busI_ori(t0:t1-1,1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
          fprintf('busResult=%f,  i=%d,  equipmentNum=%d\n',busResultP(i),i,equipmentNum);
          fprintf('P_recog=%f，PF_recog=%f,U_recog=%f，I_recog=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
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
          fprintf('P_recog=%f，PF_recog=%f,U_recog=%f，I_recog=%f\n\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
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
           fprintf('P_recog=%f，PF_recog=%f,U_recog=%f，I_recog=%f\n',P_recog(statusValue),PF_recog(statusValue),U_recog(statusValue),I_recog(statusValue));
      end
end
[U_max,~]=max(busU_ori);
[U_min,~]=min(busU_ori);
fprintf('状态改变数：statusValue=%d,电压最大值=%fV，最小值=%fV，(最大值-最小值)=%fV\n',statusValue,U_max,U_min,U_max-U_min);  
fprintf('\n');
 %%%%%%%%%%%%%获取原始待测矩阵B%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%行=是待测状态数，列=是待测状态的特征%%%%%%%%%%%%%

  B=[sp',spf',si'];%待测数据矩阵
  
 Bbb=B;
 %y2 = mapminmax('apply',B',ps);
 [y2,ps1] = mapminmax(B',0,1);
 B=y2';
%%%%%%%%%%%%求B到A的欧式距离%%%%%%%%%%%%%%%%%%%%
[rowA,colA]=size(A);
[rowB,colB]=size(B);
    if(colA==colB)
       
          for i=1:rowB
              for j=1:rowA
                        s(i,j)=sqrt(0*(B(i,1)-A(j,1))^2+0*(B(i,2)-A(j,2))^2+1*(B(i,3)-A(j,3))^2) ;
              end  
          end
        
    else
        fprintf('指纹矩阵和待测数据矩阵特征数不符\n');
    end
similar=(1./(1+s)*100);
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

