#LSTMCNN.R

library(keras)
K <- backend()


#Highway Layer is a custom layer, using R6Class
layerHighway <- R6::R6Class("KerasLayer",
    inherit = KerasLayer,
    lock_objects = FALSE
    public = list(
      initialize = function(initializer = initializer_glorot_uniform(),
                            activation = activation_linear(),
                            weights = NULL,
                            W_regularizer = regularizer_l1(),
                            b_regularizer = regularizer_l1(),
                            activity_regularizer = regularizer_l1(),
                            W_constraint = constraint_minmaxnorm(),
                            b_constraint = constraint_minmaxnorm(),
                            bias = TRUE,
                            input_dim = NULL,
                            ...){
        
        self$init <- intitializer
        
        self$activation <- activation
        self$W_regularizer <- W_regularizer
        self$b_regularizer <- b_regularizer
        
        self$bias = bias
        self$initial_weights = weights
        #self$input_spec = input_spec(ndim = 2)
        self$input_dim = input_dim
        
        for(item in seq_along(...)){
          self$set(which = 'public', name = names(...)[item], value = (...)[[item]])
        }
        
        if (self$input_dim){
          self$input_shape <- input_dim
        }
        
      },
      
      build = function(input_shape){
        input_dim <- input_shape[[2]]
        self$input_spec <- self$input_spec(dtype = K$floatx(), shape=list(NULL, input_dim))
        self$W <- self$add_weight(list(input_dim, input_dim), 
                                  initializer=self$init,
                                  name='W',
                                  regularizer=self$W_regularizer,
                                  constraint=self$W_constraint)
        self$W_carry <- self$add_weight(list(input_dim, input_dim),
                                       initializer = self$init,
                                       name = 'W_carry')
        if(self$bias){
          self$b <- self$add_weight(list(input_dim, NULL), 
                                    initializer=initializer_zeros(),
                                    name='b',
                                    regularizer = self$b_regularizer,
                                    constraint = self$b_constraing)
          self$b_carry <- self$add_weight(list(input_dim,NULL),
                                          initializer=initializer_ones(),
                                          name='b_carry')
        } else {
          self$b_carry <- NULL
        }
        
        if(!is.null(self$initial_weights)){
          self$set_weights(self$initial_weights)
          rm(self$initial_weights)
        }
        
        self$built <- TRUE
      },
      
      call = function(x){
        y <- K$dot(x, self$W_carry)
        if (self$bias){
          y <- y + self$bias
        }
        transform_weight <- activation_sigmoid(y)
        
        y <- K$dot(x, self$W)
        if (self$bias){
          y <- y + self$b
        }
        act<-self$activation(y)
        act <- act * transform_weight
        
        output <- act + (1-transform_weight) * x
        
        return(output)
      }
    )
)

layer_highway <- function(object) {
  create_layer(layerHighway, object)
}

#Use standard SGD, contains clipnorm and clipvalue if/when required. 




makeModel<-function(params){
  
}
