function plotMulFigureSmartMeter(flag,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,i)

     if(flag==0)
                figure (i);
                plot(1:dataNumP,dataP,'b',1:dataNumPF,dataPF,'g',1:dataNumU,dataU,'r',1:dataNumI,dataI,'k');
                xlabel('样本数量')
                ylabel('特征数值大小');
                title('样本1');
                legend('P','PF','U','I','location','Best');
     else
                figure (i);
                
                subplot(2,2,1);
                plot(1:dataNumP,dataP,'b');
                xlabel('样本数量')
                ylabel('特征数值大小');
                title('power');
                legend('P','location','Best');
                
                subplot(2,2,2);
                plot(1:dataNumPF,dataPF,'g');
                xlabel('样本数量')
                ylabel('特征数值大小');
                title('PF');
                legend('PF','location','Best');
                
                subplot(2,2,3);
                plot(1:dataNumU,dataU,'r');
                xlabel('样本数量')
                ylabel('特征数值大小');
                title('U');
                legend('U','location','Best');
                
                subplot(2,2,4);
                plot(1:dataNumI,dataI,'k');
                xlabel('样本数量')
                ylabel('特征数值大小');
                title('I');
                legend('I','location','Best');
                
     end
end

