import numpy as np
from lstm import LstmParam, LstmNetwork
import dataAnalyze
class ToyLossLayer:
    """
    Computes square loss with first element of hidden layer array.
    """
    @classmethod
    def loss(self, pred, label):
        return (pred[0] - label) ** 2

    @classmethod
    def bottom_diff(self, pred, label):
        diff = np.zeros_like(pred)
        diff[0] = 2 * (pred[0] - label)
        return diff

def example_0():
    # learns to repeat simple sequence from random inputs
    np.random.seed(0)
    x1=[float(i)/700 for i in dataAnalyze.testData().pop()]
    print x1
    # parameters for input data dimension and lstm cell count 
    mem_cell_ct = 10
    #x_dim = 50
    x_dim=len(x1)/2
    concat_len = x_dim + mem_cell_ct 
    lstm_param = LstmParam(mem_cell_ct, x_dim) 
    lstm_net = LstmNetwork(lstm_param)
    y_list = [139/500,455/500]
    input_val_arr=[x1[::2],x1[1::2]]
    #input_val_arr = [np.random.random(x_dim) for _ in y_list]
 #   input_val_arr = [np.random.random(x_dim) for _ in range(4)]
 #   input_val_arr = [np.random.uniform(-0.1,0.1,x_dim) for _ in y_list]



    for cur_iter in range(200):
        print "cur iter: ", cur_iter
        for ind in range(len(y_list)):
            lstm_net.x_list_add(input_val_arr[ind])

            print "y_pred[%d] : %f" % (ind, lstm_net.lstm_node_list[ind].state.h[0])

        loss = lstm_net.y_list_is(y_list, ToyLossLayer)
        print "loss: ", loss
        lstm_param.apply_diff(lr=0.1)
        lstm_net.x_list_clear()

if __name__ == "__main__":
    example_0()

