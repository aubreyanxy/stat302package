#' Function: my_lm 
#' 
#' Return a table of information includes "Estimate","Std. Error","t value","Pr(>|t|)" in the form of table
#'            It's a brief combination of lm() and summary()
#' Input: regression formula, data frame
#' Output: A table includes related data
#' @export
my_lm <- function(formula, data){
  # Create form and get Dependent & Independent value
  X <- model.matrix(formula, data)
  form <- model.frame(formula, data)
  Y <- model.response(form)
  
  # Coefficient 
  my_Coef <- solve(t(X) %*% X) %*% t(X) %*% Y
  
  # Degree of freedom
  df <- nrow(X) - nrow(my_Coef)
  
  # Calculate standard deviation
  std <- 0
  for (i in 1:nrow(X)) {
    std.i <- ((Y[i] - X[i, ] %*% my_Coef)^2) / df
    std <- std + std.i
  }
  sqrt(std)
  
  # A matrix that saves "summary()" data
  my_df <- matrix(rep(NA, 4 * nrow(my_Coef)), ncol = 4)
  
  # rename the columns' names and rows' names
  colnames(my_df) <- c("Estimate","Std. Error","t value","Pr(>|t|)")
  rownames(my_df) <- rownames(my_Coef)
  
  # Convert matrix into dataframe 
  my_df <- as.data.frame(my_df)
  
  # Insert value related to "estimate" and save it to 5 decimals
  my_df$Estimate <- round(my_Coef, 5)
  # Insert value related to "Standard Error" and save it to 5 decimals
  my_df$`Std. Error` <- round(sqrt(as.vector(std) * diag(solve(t(X) %*% X))), 5)
  # Insert value related to "t-Value" and save it to 5 decimals
  my_df$`t value` <- round(as.numeric(my_Coef) / sqrt(as.vector(std) * diag(solve(t(X) %*% X))), 3)
  # Insert value related to P-value
  my_df$`Pr(>|t|)` <- 2 * pt(abs(as.numeric(my_Coef) / sqrt(as.vector(std) * diag(solve(t(X)%*%X)))), df, lower.tail = FALSE)
  
  return(my_df)
}
