function  readSmartMeterData( sampleNum,stepNum,howNum ,setNum)
%sampleNum=�õ�����������,stepNum=���õ������õĲ���,howNum=�ò����²ɼ��˼�������
%   
%sampleNum=2,stepNum=2,howNum=2;
for i=1:sampleNum
        for j=1:stepNum
                for k=1:howNum
                    pathP(j)=['\sourceData\original',num2str(i),'P',num2str(j),'s',num2str(k),'.xlsx'];
                    pathPF=['\sourceData\original',num2str(i),'PF',num2str(j),'s',num2str(k),'.xlsx'];                
                    pathI=['\sourceData\original',num2str(i),'I',num2str(j),'s',num2str(k),'.xlsx'];
                    pathU=['\sourceData\original',num2str(i),'U',num2str(j),'s',num2str(k),'.xlsx'];
                end
        end 
end

end

