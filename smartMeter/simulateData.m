function  simulateData( flag )
%get simulation data
% if(flag==1)
    sp1=normrnd(5,0.1,100,1);
    sp2=normrnd(5,0.15,100,1);
    sp3=normrnd(100,5.2,100,1);
    sp4=normrnd(220,9.8,100,1);
    sp5=normrnd(700,16,100,1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    spf1=normrnd(0.5,0.1,100,1);
    spf2=normrnd(0.55,0.15,100,1);
    spf3=normrnd(0.95,0.22,100,1);
    spf4=normrnd(0.8,0.11,100,1);
    spf5=normrnd(0.7,0.21,100,1);
    P=[sp1,spf1;sp2,spf2;sp3,spf3;sp4,spf4;sp5,spf5];
    size(P)
     save .\simulateData\simulateP.mat  P
% end

end

