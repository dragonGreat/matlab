function getFingerprint(isGetFingerprint ,wipeOutData,fan,miphone,monitor,mipad,lamp,solderingIron)
%%%%%%%%%%s0初始状态%%%%%%%%%%%%%%%%%%%%%%
       if(isGetFingerprint==1)
            fprintf('go get the fingerprint!\n');
                s0_0_p=0;
                s0_0_pf=1;
                s0_0_i=0;
 %%%%%%%%%%s1-fan1%%%%%%%%%%%%%%%%%%%%%%
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fan{1,1},wipeOutData);
                s1_fan1_p=aveValue(1,1);%功率
                s1_fan1_pf=aveValue(1,2);%功率因子
                s1_fan1_i=aveValue(1,4);%电流
%%%%%%%%%%s2-fan2%%%%%%%%%%%%%%%%%%%%%% 
         [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fan{1,2},wipeOutData);
                s2_fan2_p=aveValue(1,1);%功率
                s2_fan2_pf=aveValue(1,2);%功率因子
                s2_fan2_i=aveValue(1,4);%电流
 %%%%%%%%%%s3-fan3%%%%%%%%%%%%%%%%%%%%%% 
         [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fan{1,3},wipeOutData);
                s3_fan3_p=aveValue(1,1);%功率
                s3_fan3_pf=aveValue(1,2);%功率因子
                s3_fan3_i=aveValue(1,4);%电流
 %%%%%%%%%%s4-miphone%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(miphone{1,1},wipeOutData);
                s4_miphone_p=aveValue(1,1);%功率
                s4_miphone_pf=aveValue(1,2);%功率因子
                s4_miphone_i=aveValue(1,4);%电流
 %%%%%%%%%%s5-monitor%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(monitor{1,1},wipeOutData);
                s5_monitor_p=aveValue(1,1);%功率
                s5_monitor_pf=aveValue(1,2);%功率因子
                s5_monitor_i=aveValue(1,4);%电流       
 %%%%%%%%%%s6-mipad%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(mipad{1,1},wipeOutData);
                s6_mipad_p=aveValue(1,1);%功率
                s6_mipad_pf=aveValue(1,2);%功率因子
                s6_mipad_i=aveValue(1,4);%电流 
                
 %%%%%%%%%%s7-lamp%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(lamp{1,1},wipeOutData);
                s7_lamp_p=aveValue(1,1);%功率
                s7_lamp_pf=aveValue(1,2);%功率因子
                s7_lamp_i=aveValue(1,4);%电流 
 %%%%%%%%%%s8-solderingIron%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(solderingIron{1,1},wipeOutData);
                s8_solderingIron_p=aveValue(1,1);%功率
                s8_solderingIron_pf=aveValue(1,2);%功率因子
                s8_solderingIron_i=aveValue(1,4);%电流 
%%%%%%%%%%%%构造指纹%%%%%%%%%%%%%%%%%%%%
      A=[ 
          s0_0_p, s0_0_pf, s0_0_i;
          s1_fan1_p,s1_fan1_pf,s1_fan1_i;
          s2_fan2_p,s2_fan2_pf,s2_fan2_i;
          s3_fan3_p,s3_fan3_pf,s3_fan3_i;
          s4_miphone_p,s4_miphone_pf,s4_miphone_i;
          s5_monitor_p,s5_monitor_pf,s5_monitor_i;
          s6_mipad_p,s6_mipad_pf,s6_mipad_i;
          s7_lamp_p,s7_lamp_pf,s7_lamp_i;
           s8_solderingIron_p,s8_solderingIron_pf,s8_solderingIron_i;
          ];
      save A.mat A
        end


end

