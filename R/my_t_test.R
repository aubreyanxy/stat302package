#' Function: my_t.test. 
#' 
#' Return a list of information includes t_statistic, df, range type, and p-value
#'           it's a brief version of t.test() 
#' Input: numeric sample x, numeric number mu, and string paremeter "alternative"
#' Output: A list
#' @export
my_t.test <- function(x, mu, alternative) {
  # Set up a list that includes all potential alternative
  alternative_list <- list("two.sided", "less", "greater")
  # Check if x is numeric
  if(!is.numeric(x)){
    # If not, stop the function and display warning
    stop("x has to be numeric")
    # Check if given parameter alternative is whether included in aternative_list
  } else if(!(alternative %in% alternative_list )){
    # If not, stop the function and display warning
    stop("parameter alternative needs to be one type from 'two.sided', 'less', 'greater'")
    # check if mu is numeric
  } else if (!is.numeric(mu)) {
    # If not, stop the function and display warning
    stop("mu has to be numeric")
  }
  
  # Initialize mu hat, given mu, and size of sample
  mu_hat <- mean(x)
  mu_zero <- mu
  n <- length(x)
  
  # Calculate t-value
  t_val <- (mu_hat - mu_zero) / ( sd(x) / sqrt(n) )
  
  # If alternative equals two sided
  if(alternative == "two.sided") {
    # Calculate P-value 
    p_val <- 2 * pt(-abs(t_val), df = n - 1)
    # If alternative is greater and mu_hat smaller than mu_zero
  } else if(alternative == "greater" && mu_hat <= mu_zero ||
            # Or, if alternative is less and mu_hat is greater than mu_zero
            alternative == "less" && mu_hat >= mu_zero) {
    # Calculate P-value
    p_val <- pt(abs(t_val), df = n - 1)
    # In other situation.
  } else {
    p_val <- pt(-abs(t_val), df = n - 1)
  }
  
  # Create the list that includes result of my_t.test()
  my_list <- list("test_stat" = round(t_val,4),
                  "degrees of freedom" = n - 1,
                  "alternative" = alternative,
                  "p_val" = round(p_val,4))
  
  # Return
  return(my_list)
}