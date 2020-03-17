#' Function: my_knn_cv. 
#' 
#' Predict given class by using covariats sepal.(length, width)
#'                      and petal.(length, width) 
#' Input: a data frame, true class value of training data
#'        an integer representing the number of neighbors
#'       an integer representing the number of folds
#' Output: A list which consists of a vector that includes all observations and a vector
#'         than includes numeric data.
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv){
  
  # Initialize the data
  class <- NULL;cv_err <- NULL
  ns <- sample(1:k_cv, nrow(train), replace = TRUE)
  for (i in 1:k_cv) {
    # Locate testing data and training data
    test.data <- train[which(ns == i), ]
    train.data <- train[which(ns != i), ]
    cl.i <- cl[which(ns != i)]
    # Model prediction
    res <- knn(train = train.data, test = test.data, k = k_nn, cl = cl.i)
    # Error rate
    cv_err[i] <- length(which(res != cl[which(ns == i)])) / length(res)
  }
  # Result of prediction
  class <- knn(train = train, test = train, k = k_nn, cl = cl)
  return(list(class, cv_err))
}