相关说明及修改：
1,对（第一步功率进行.xlsx）中的A3单元格进行数据补全，推测出（656290）

2，为方便数据读取，对相应有相间文件进行重命名。

     命名规则：负载名+第几步+数据类型+数据采集次数（默认1次）（P：power,PF:power factor）
     例如1：空调控制器（airCondition)第一步的功率数据第一次采集。命名为：airCondition1P.xlsx或airCondition1P1.xlsx
     例如2：空调控制器（airCondition)第二步的功率因数数据第二次采集。命名为：airCondition2PF2.xlsx

     待机功率：airCondition0P.xlsx   
     待机功率因数：airCondition0PF.xlsx

     第一步功率：airCondition1P.xlsx
     第一步功率因数：airCondition1PF.xlsx
     。
     。
     。
     第六步功率：airCondition6P.xlsx
     第六步功率因数：airCondition6PF.xlsx


3，第三步中第二次测量存在空白数据或是字母类数据，作删除处理，这样就会导致功率数据和功率因数数据个数不一样