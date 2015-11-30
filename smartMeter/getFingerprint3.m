function [trainData,labels]=getFingerprint3(isGetFingerprint ,wipeOutData,fan,hairdryer,kettle,mipad,pc)
%%%%%%%%%%s0��ʼ״̬%%%%%%%%%%%%%%%%%%%%%%fan,hairdryer,kettle,mipad,pc
       if(isGetFingerprint==1)
            fprintf('go get the fingerprint3!\n');
 %%%%%%%%%%s1-fan1%%%%%%%%%%%%%%%%%%%%%%
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fan{1,1},wipeOutData);
                s1_fan1_p=aveValue(1,1);%����
                s1_fan1_pf=aveValue(1,2);%��������
                s1_fan1_i=aveValue(1,4);%����
%%%%%%%%%%s2-fan2%%%%%%%%%%%%%%%%%%%%%% 
         [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fan{1,2},wipeOutData);
                s2_fan2_p=aveValue(1,1);%����
                s2_fan2_pf=aveValue(1,2);%��������
                s2_fan2_i=aveValue(1,4);%����
 %%%%%%%%%%s3-fan3%%%%%%%%%%%%%%%%%%%%%% 
         [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fan{1,3},wipeOutData);
                s3_fan3_p=aveValue(1,1);%����
                s3_fan3_pf=aveValue(1,2);%��������
                s3_fan3_i=aveValue(1,4);%����
%%%%%%%%%%s4-fan4%%%%%%%%%%%%%%%%%%%%%% 
         [aveValue,varValue,maxValue,minValue] = getTheDataFeature(fan{1,4},wipeOutData);
                s4_fan4_p=aveValue(1,1);%����
                s4_fan4_pf=aveValue(1,2);%��������
                s4_fan4_i=aveValue(1,4);%����
 %%%%%%%%%%s5-hairdryer%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(hairdryer{1,1},wipeOutData);
                s5_hairdryer1_p=aveValue(1,1);%����
                s5_hairdryer1_pf=aveValue(1,2);%��������
                s5_hairdryer1_i=aveValue(1,4);%����
%%%%%%%%%%s6-hairdryer%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(hairdryer{1,2},wipeOutData);
                s6_hairdryer2_p=aveValue(1,1);%����
                s6_hairdryer2_pf=aveValue(1,2);%��������
                s6_hairdryer2_i=aveValue(1,4);%����
%%%%%%%%%%s7-hairdryer%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(hairdryer{1,3},wipeOutData);
                s7_hairdryer3_p=aveValue(1,1);%����
                s7_hairdryer3_pf=aveValue(1,2);%��������
                s7_hairdryer3_i=aveValue(1,4);%����
 %%%%%%%%%%s8-kettle%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(kettle{1,1},wipeOutData);
                s8_kettle_p=aveValue(1,1);%����
                s8_kettle_pf=aveValue(1,2);%��������
                s8_kettle_i=aveValue(1,4);%����       
 %%%%%%%%%%s9-mipad%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(mipad{1,1},wipeOutData);
                s9_mipad_p=aveValue(1,1);%����
                s9_mipad_pf=aveValue(1,2);%��������
                s9_mipad_i=aveValue(1,4);%���� 
                
 %%%%%%%%%%s10-pc%%%%%%%%%%%%%%%%%%%%%% 
        [aveValue,varValue,maxValue,minValue] = getTheDataFeature(pc{1,1},wipeOutData);
                s10_pc_p=aveValue(1,1);%����
                s10_pc_pf=aveValue(1,2);%��������
                s10_pc_i=aveValue(1,4);%���� 
%%%%%%%%%%%%����ѵ�����ݺͱ�ǩ%%%%%%%%%%%%%%%%%%%%
        trainData_1=[ 0,s1_fan1_p;s2_fan2_p;s3_fan3_p;s4_fan4_p;s5_hairdryer1_p;s6_hairdryer2_p;s7_hairdryer3_p;s8_kettle_p;s9_mipad_p;s10_pc_p]; 
        labels_1=['z','a','b','c','d','e','f','g','h','i','j']';
        trainData=trainData_1;
        labels=labels_1;
       end


end

