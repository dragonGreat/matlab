function [outData,outDataNum]= readExcelData(inPath )
%this function only use for read excel data
%fprintf(' go readExcelData！\n');
%[data,text ]= xlsread('\sourceData\第一步功率因数.xlsx');% ID in data(:,1),other usefull data text(:,4)
[~,text ]= xlsread(inPath);% ID in data(:,1),other usefull data text(:,4)
a=text(:,4);%get usefull data,power or power factor

outDataNum=length(a)-2;%num
b=char(a(3:length(a),1));%get data ,text transfrom into char type
outData=str2num(b);%char transform into num type
%plot(b)
end

