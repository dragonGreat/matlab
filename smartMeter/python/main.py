# _*_ coding:utf-8 _*_
# __author__ = 'dragon'
import pickle,pprint
P = [0, 1, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0,
     44, 1, 0]

for i in reversed(range(len(P))):
    if(P[i] == 0):
        del P[i]
print P
output = open('data.pkl', 'wb')
pickle.dump(P, output)
output.close()
# print len(P)

# for i in range(0,len(P)-1):
#     if(P[i] == 0):
#         del P[i]
# print P
pkl_file = open('data.pkl', 'rb')
ss = pickle.load(pkl_file)
print ss
pkl_file.close()
