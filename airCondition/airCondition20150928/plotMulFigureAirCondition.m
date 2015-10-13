function plotMulFigureAirCondition( dataNum1,dataIn1,dataNum2,dataIn2,xName,yName,titleName,i,s,dataNum3,dataIn3,dataNum4,dataIn4)
%draw multiple picture
if(s==0) 
        if(i==4)
                figure (i);
                plot(1:dataNum1,dataIn1,'b',1:dataNum2,dataIn2,'g',1:dataNum3,dataIn3,'r',1:dataNum4,dataIn4,'k');
                xlabel(xName)
                ylabel(yName);
                title(titleName);
                legend('P','PF','P2','PF2','location','Best');
        else
                figure (i);
                plot(1:dataNum1,dataIn1,'blue',1:dataNum2,dataIn2,'red');
                xlabel(xName)
                ylabel(yName);
                title(titleName);
                legend('P','PF','location','Best');
        end

else
        if(i==4)
            figure (i);
                subplot(2,3,1);

                plot(1:dataNum1,dataIn1,'blue');
                xlabel(xName)
                ylabel(yName);
                title('power');
                legend('P','location','Best');

                subplot(2,3,2);

                plot(1:dataNum2,dataIn2,'red');
                xlabel(xName)
                ylabel(yName);
                title('power factor');
                legend('PF','location','Best');

                subplot(2,3,3);

                plot(1:dataNum1,dataIn1,'blue',1:dataNum2,dataIn2,'red');
                xlabel(xName)
                ylabel(yName);
                title(titleName);
                legend('P','PF','location','Best');

        %%%
               subplot(2,3,4);

                plot(1:dataNum3,dataIn3,'blue');
                xlabel(xName)
                ylabel(yName);
                title('power');
                legend('P2','location','Best');

                subplot(2,3,5);

                plot(1:dataNum4,dataIn4,'red');
                xlabel(xName)
                ylabel(yName);
                title('power factor');
                legend('PF2','location','Best');

                subplot(2,3,6);

                plot(1:dataNum3,dataIn3,'blue',1:dataNum4,dataIn4,'red');
                xlabel(xName)
                ylabel(yName);
                title(titleName);
                legend('P2','PF2','location','Best');
        else
               figure (i);
                subplot(1,3,1);

                plot(1:dataNum1,dataIn1,'blue');
                xlabel(xName)
                ylabel(yName);
                title('power');
                legend('P','location','Best');

                subplot(1,3,2);

                plot(1:dataNum2,dataIn2,'red');
                xlabel(xName)
                ylabel(yName);
                title('power factor');
                legend('PF','location','Best');

                subplot(1,3,3);

                plot(1:dataNum1,dataIn1,'blue',1:dataNum2,dataIn2,'red');
                xlabel(xName)
                ylabel(yName);
                title(titleName);
                legend('P','PF','location','Best');
        end   
end

end
