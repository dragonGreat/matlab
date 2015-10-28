function plotMulFigureSmartMeter(flag,dataP,dataNumP,dataPF,dataNumPF,dataU,dataNumU,dataI,dataNumI,i,aveValue,varValue,maxValue,minValue)

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
                        xlabel('relative time')
                        ylabel('value/10W');
                        titleH=['P:',' mean=',num2str(aveValue(1,1)),' var=',num2str(varValue(1,1)),' max=',num2str(maxValue(1,1)),' min=',num2str(minValue(1,1))];%保证每个xslx中的数据一样多
                        title(titleH);
                        legend('P','location','Best');
                
                subplot(2,2,2);
                        plot(1:dataNumPF,dataPF,'g');
                        xlabel('relative time')
                        ylabel('value');
                        titleH=['PF:',' mean=',num2str(aveValue(1,2)),' var=',num2str(varValue(1,2)),' max=',num2str(maxValue(1,2)),' min=',num2str(minValue(1,2))];
                        title(titleH);
                        legend('PF','location','Best');

                subplot(2,2,3);
                        plot(1:dataNumU,dataU,'r');
                        xlabel('relative time')
                        ylabel('value/10V');
                        titleH=['U:',' mean=',num2str(aveValue(1,3)),' var=',num2str(varValue(1,3)),' max=',num2str(maxValue(1,3)),' min=',num2str(minValue(1,3))];
                        title(titleH);
                        legend('U','location','Best');
                
                subplot(2,2,4);
                        plot(1:dataNumI,dataI,'k');
                        xlabel('relative time')
                        ylabel('value/mA');
                        titleH=['I:',' mean=',num2str(aveValue(1,4)),' var=',num2str(varValue(1,4)),' max=',num2str(maxValue(1,4)),' min=',num2str(minValue(1,4))];
                        title(titleH);
                        legend('I','location','Best');
                
     end
end

