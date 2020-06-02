//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;
  real sepal_len[N];
  real sepal_wid[N];
  real petal_len[N];
  real petal_wid[N];
  int p;
  int y[N];
}

// The parameters accepted by the model. Our model
// accepts two parameters 'mu' and 'sigma'.
parameters {
  // vector[p] beta;
  real beta1;
  real beta2;
  real beta3;
  real beta4;
  real b;
}

// The model to be estimated. We model the output
// 'y' to be normally distributed with mean 'mu'
// and standard deviation 'sigma'.
model {
  for (n in 1:N){
    y ~ bernoulli_logit(
      sepal_len[n]*beta1
        +sepal_wid[n]*beta2
        +petal_len[n]*beta3
        +petal_wid[n]*beta4
        +b);
  }
}

