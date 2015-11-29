


% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   fprintf('go testKnn...\n');
    trainData=[2,4,7,]';
    labelsData=['a','b','c']';
    testData=[10,1,3.5,8,9]';
    targetL=kNN(trainData,labelsData,testData,1);
    fprintf('the target is :%s\n',targetL);
    
    
    
  % % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%  fprintf('go testKnn...\n');
% [trainData,labels]=getFingerprint3(1,0,fan,hairdryer,kettle,mipad,pc);
% testData=[138;137;137;443;445;443;443;5112;5145];
% targetL=kNN(trainData,labels,testData,3);
% fprintf('the target is :%s\n',targetL);