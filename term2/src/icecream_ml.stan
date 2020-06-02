data {
  int<lower=0> N;
  real<lower=0> kyaku[N];
  real<lower=0> saiko_kion[N];
  real<lower=0> saitei_kion[N];
  int<lower=0> p;
}

parameters {
  real beta[p];
  real<lower=0> sigma;
}

transformed parameters {
  real mu[N];
  for (i in 1:N){
    mu[i] = beta[1] + beta[2]*saiko_kion[i] + beta[3]*saitei_kion[i];
  }
}

model {
  kyaku ~ normal(mu, sigma);
}

