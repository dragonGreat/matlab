function target=kNN(trainData,labels,testData,k)
% trainData: training samples data,n*d matrix
% labels: training samples' class label,n*1
% testData: testing data
% target:class label given by kNN
% k:the number of neighbors
ClassLabel=unique(labels);%取集合a的不重复元素构成的向量
 %fprintf('the ClassLabel is :%s\n',ClassLabel);
c=length(ClassLabel);
n=size(trainData,1);
 %fprintf('length=%d,trainDataSize=%d\n',c,n);
% target=zeros(size(test,1),1);
dist=zeros(size(trainData,1),1);%距离初始值
for j=1:size(testData,1)
    cnt=zeros(c,1);
    for i=1:n
        dist(i)=norm(trainData(i,:)-testData(j,:));%norm(A-B)=sqrt(sum((A-B)^2))%求所有训练样本到单个测试样本的距离
    end
    [d,index]=sort(dist);%按列排序，d是排列好的新矩阵，index是重排的详细信息，也就是做了什么样的变动
    for i=1:k
        ind=find(ClassLabel==labels(index(i)));%找到k个邻居，看分别是ClassLabel中的第几类
        cnt(ind)=cnt(ind)+1;
    end
    [m,ind]=max(cnt);%找到列最大值，即找出K个邻居中占总类数中最多的哪一类属于哪一类
    target(j)=ClassLabel(ind);%给出类别
end



    
    



