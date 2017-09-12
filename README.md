# Character Aware Neural Language Model: R Implementation #

This is an implementation of the method outlined by [Kim, Jernite, Sontag and Rush](https://arxiv.org/abs/1508.06615), utilizing [Keras](keras.io) for [R](https://rstudio.github.io/keras/), following the implementation by [jarfo](https://github.com/jarfo/kchar) on GitHub. 

## Requirements ##
This was developed using R 3.4.1 and Keras 2.0.7.2. 

## Data ## 
As with all implementations, data should be split into `train.txt`, `valid.txt`, and `test.txt`. Each line of the .txt file should be a sentence. The English Penn Treebank (PTB) data is included as the default. 

## Development ## 
Please feel free to fork, suggest changes and pull requests if you wish to assist with development. 