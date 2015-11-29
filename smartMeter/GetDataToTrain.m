function [trainData,labels]=GetDataToTrain(fan,hairdryer,kettle,mipad,pc,wipeOutData)
%%%
fprintf('GO GetDataToTrain ......\n');

cleanFlag=1;%1:P,2;PF,3:I,ÆäËü£ºÖØÊä
%%%%%%%%%%%%%%%%%%fan1-4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainData_fan1,labels_fan1 ] = dataClean(fan{1,1},wipeOutData,cleanFlag,'a');
[trainData_fan2,labels_fan2 ] = dataClean(fan{1,2},wipeOutData,cleanFlag,'b');
[trainData_fan3,labels_fan3 ] = dataClean(fan{1,3},wipeOutData,cleanFlag,'c');
[trainData_fan4,labels_fan4 ] = dataClean(fan{1,4},wipeOutData,cleanFlag,'d');
%%%%%%%%%%%%%%%%%%hairdryer1-3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainData_hairdryer1,labels_hairdryer1 ] = dataClean(hairdryer{1,1},wipeOutData,cleanFlag,'e');
[trainData_hairdryer2,labels_hairdryer2 ] = dataClean(hairdryer{1,2},wipeOutData,cleanFlag,'f');
[trainData_hairdryer3,labels_hairdryer3 ] = dataClean(hairdryer{1,3},wipeOutData,cleanFlag,'g');
%%%%%%%%%%%%%%%%%%kettle%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainData_kettle,labels_kettle] = dataClean(kettle{1,1},wipeOutData,cleanFlag,'h');
%%%%%%%%%%%%%%%%%%mipad%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainData_mipad,labels_mipad] = dataClean(mipad{1,1},wipeOutData,cleanFlag,'i');
%%%%%%%%%%%%%%%%%%pc%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainData_pc,labels_pc] = dataClean(pc{1,1},wipeOutData,cleanFlag,'j');

trainData=[trainData_fan1;trainData_fan2;trainData_fan3;trainData_fan4;trainData_hairdryer1;trainData_hairdryer2;trainData_hairdryer3;trainData_kettle;trainData_mipad;trainData_pc];
labels=[labels_fan1;labels_fan2;labels_fan3;labels_fan4;labels_hairdryer1;labels_hairdryer2;labels_hairdryer3;labels_kettle;labels_mipad;labels_pc];

end

