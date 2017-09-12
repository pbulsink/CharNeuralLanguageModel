# Character Aware Neural Language Model: R Implementation #

This is an implementation of the method outlined by [Kim, Jernite, Sontag and Rush](https://arxiv.org/abs/1508.06615), utilizing [Keras](keras.io) for [R](https://rstudio.github.io/keras/), following the implementation by [jarfo](https://github.com/jarfo/kchar) on GitHub. 

## Data ## 
As with all implementations, data should be split into `train.txt`, `valid.txt`, and `test.txt`. Each line of the .txt file should be a sentence. The English Penn Treebank (PTB) data is included as the default. 

## Development ## 
Please feel free to fork, suggest changes and pull requests if you wish to assist with development. 

## Version Info ## 

This script was most recently tested under the following session conditions:

```
>sessionInfo()
R version 3.4.1 (2017-06-30)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 7 x64 (build 7601) Service Pack 1

Matrix products: default

locale:
[1] LC_COLLATE=English_Canada.1252  LC_CTYPE=English_Canada.1252    LC_MONETARY=English_Canada.1252 LC_NUMERIC=C                   
[5] LC_TIME=English_Canada.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] keras_2.0.7.2

loaded via a namespace (and not attached):
 [1] Rcpp_0.12.12     digest_0.6.12    rprojroot_1.2    R6_2.2.2         jsonlite_1.5     backports_1.1.0  magrittr_1.5    
 [8] evaluate_0.10.1  tfruns_0.9.1     stringi_1.1.5    reticulate_1.1   rmarkdown_1.6    tools_3.4.1      stringr_1.2.0   
[15] rsconnect_0.8.5  compiler_3.4.1   tensorflow_1.3.1 htmltools_0.3.6  knitr_1.17  
```

