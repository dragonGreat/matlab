function target=kNN(trainData,labels,testData,k)
% trainData: training samples data,n*d matrix
% labels: training samples' class label,n*1
% testData: testing data
% target:class label given by kNN
% k:the number of neighbors
ClassLabel=unique(labels);%ȡ����a�Ĳ��ظ�Ԫ�ع��ɵ�����
 %fprintf('the ClassLabel is :%s\n',ClassLabel);
c=length(ClassLabel);
n=size(trainData,1);
 %fprintf('length=%d,trainDataSize=%d\n',c,n);
% target=zeros(size(test,1),1);
dist=zeros(size(trainData,1),1);%�����ʼֵ
for j=1:size(testData,1)
    cnt=zeros(c,1);
    for i=1:n
        dist(i)=norm(trainData(i,:)-testData(j,:));%norm(A-B)=sqrt(sum((A-B)^2))%������ѵ���������������������ľ���
    end
    [d,index]=sort(dist);%��������d�����кõ��¾���index�����ŵ���ϸ��Ϣ��Ҳ��������ʲô���ı䶯
    for i=1:k
        ind=find(ClassLabel==labels(index(i)));%�ҵ�k���ھӣ����ֱ���ClassLabel�еĵڼ���
        cnt(ind)=cnt(ind)+1;
    end
    [m,ind]=max(cnt);%�ҵ������ֵ�����ҳ�K���ھ���ռ��������������һ��������һ��
    target(j)=ClassLabel(ind);%�������
end



    
    



