#' Function: my_rf_cv  
#' 
#' Predict output sepal.length using covariates sepal.with
#'                     and petal.(width, length)
#' Input: a numeric number stands for number of folds
#' Output: a number -- the cross-valiadation error
#' @export
my_rf_cv <- function(k){
  
  # Initialize data
  ns <- sample(1:k, nrow(iris), replace = TRUE)
  MSE <- NULL
  for (i in 1:k) {
    # Locate training data and testing data
    TRAINING_DATA <- iris[which(ns != i), -5]
    TEST_DATA <- iris[which(ns == i), -5]
    MODEL <- randomForest(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = TRAINING_DATA, ntree = 100)
    PREDICTIONS <- as.numeric(predict(MODEL, TEST_DATA[, -1]))
    MSE[i] <- mean((TEST_DATA[, 1] - PREDICTIONS)^2)
  }
  m_MSE <- mean(MSE)
  return(m_MSE)
}