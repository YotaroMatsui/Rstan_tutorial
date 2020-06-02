# import
library(rstan)
library(ggplot2)
# install.packages('GGally')
library(GGally)

# read data and conform
iris_data = read.csv('./resource/iris.csv')
sehead(iris_data, n = 3)


# check parameters with ggpairs
ggpairs(iris_data)

# arange data
iris_list = list(
  N = nrow(iris_data),
  sepal_len = iris_data$sepal.length,
  sepal_wid = iris_data$sepal.width,
  petal_len = iris_data$petal.length,
  petal_wid = iris_data$petal.width,
  y = iris_data$class,
  p = 5
)

# calcurate bais 
src = 'src/logistic.stan'
fit = stan(file = src,
           model_name = src,
           data = iris_list,
           seed = 1,
           chains = 4,
           iter = 2000,
           warmup = 1000,
           thin = 1
)

print(fit)

# trace plot
stan_trace(fit,inc_warmup = TRUE)

# dence
stan_dens(fit, separate_chains = TRUE)

# stan plot
stan_plot(fit,
          point_set = 'median',
          show_density = TRUE,
          ci_level = 0.95,
          outer_level = 1.00,
          show_outer_line = TRUE)

# self ac 
stan_ac(fit)

