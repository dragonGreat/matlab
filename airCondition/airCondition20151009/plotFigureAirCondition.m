function plotFigureAirCondition( dataNum,dataIn,xName,yName,titleName,i)
%draw picture
    figure (i);
    plot(1:dataNum,dataIn,'blue');
    xlabel(xName)
    ylabel(yName);
    title(titleName);
%legend('name1','name2');
end


