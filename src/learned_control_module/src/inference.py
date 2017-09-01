

import tensorflow as tf
import numpy as np


data = np.load('dataset.npz')
#X_train, y_train = data['X_train_f'][:,0:512], data['y_train']
X_test, y_test = data['X_test_f'][:,0:512],  data['y_test']

def get_batches(X,Y, n_seqs, n_steps,n_raw_input,n_classes):
    '''
    slice the mini-batches
    
    X: X_input, to be sliced
    n_seqs: number of sequences
    n_steps: num of steps (in time)
    n_inputs: input features
    n_classes: output classes
    '''
    batch_size = n_seqs * n_steps
    n_batches = int(len(X) / batch_size)
    # keep only integpythoner batches
    X = X[:int(batch_size * n_batches)]
    Y = Y[:int(batch_size * n_batches)]
    
#    # reshape
    X = X.reshape((int(n_seqs), -1, n_raw_input))
    Y = Y.reshape((int(n_seqs), -1, n_classes))
    
    for n in range(0, Y.shape[1], n_steps):
        # inputs
#        x = X[:, n:n+n_steps ,:].reshape(-1,512,1,1)
        x = X[:, n:n+n_steps ,:]
        # targets
        y = Y[:, n:n+n_steps ,:]
        yield x, y
     
#batches = get_batches(X_train,y_train,n_seqs,n_steps,n_raw_input,n_classes)
#x, y = next(batches)
        
checkpoint = tf.train.latest_checkpoint('./lstm_model/checkpoints/')


sess = tf.Session()
new_saver = tf.train.import_meta_graph('./graph/inference_graph.meta')
new_saver.restore(sess, checkpoint)
graph = tf.get_default_graph()

X_in = graph.get_tensor_by_name('cnn_input:0')
p_keep_conv=graph.get_tensor_by_name('keep_conv:0')
p_keep_hidden = graph.get_tensor_by_name('keep_hidden:0')
model_target = graph.get_tensor_by_name('targets:0')
keep_prob = graph.get_tensor_by_name('keep_prob:0')
model_accuracy = graph.get_tensor_by_name('model_accuracy:0')
model_loss = graph.get_tensor_by_name('model_loss:0')

counter = 0
test_accuracy = 0
test_loss = 0
for X_test_lstm, y_test_lstm in get_batches(X_test,y_test,1,10,512,7):
    counter += 1
    feed = {X_in: X_test_lstm.reshape(-1,512,1,1),
            model_target: y_test_lstm,
            keep_prob: 1.,
            p_keep_conv:1.0, p_keep_hidden: 1.0}
    accuracy,loss = sess.run([model_accuracy,model_loss], feed_dict=feed)
#    print(accuracy)
    test_accuracy += accuracy
    test_loss += loss
test_accuracy = test_accuracy/counter
test_loss = test_loss/counter
print('Test accuracy: {:.4f}'.format(test_accuracy),
      'Test loss: {:.4f}'.format(test_loss))
sess.close()
