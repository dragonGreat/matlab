# _*_ coding:utf-8 _*_
# __author__ = 'dragon'
P = [0, 1, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0,
     44, 1, 0]

# for i in reversed(range(len(P))):
#     print i
#     if(P[i] == 0):
#         del P[i]
#
#
# print P
# print len(P)
for i in range(0,len(P)-1):
    if(P[i] == 0):
        del P[i]
        i=i-1
print P


