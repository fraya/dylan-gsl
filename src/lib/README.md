# Directory structure

The library is split into two main parts:

- GSL
- FFI

## GSL

The GSL part is a set of Dylan modules that provide a more idiomatic Dylan interface to the GSL library.

| Module | File Link |
| :--- | :--- |
| **gsl-common** | [common.dylan](gsl/common.dylan) |
| **gsl-complex** | [complex.dylan](gsl/complex.dylan) |
| **gsl-error** | [error.dylan](gsl/error.dylan) |
| **gsl-math** | [math.dylan](gsl/math.dylan) |
| **gsl-randist** | [randist.dylan](gsl/randist.dylan) |
| **gsl-rng** | [rng.dylan](gsl/rng.dylan) |
| **gsl-running-statistics** | [running-statistics.dylan](gsl/running-statistics.dylan) |
| **gsl-statistics** | [statistics.dylan](gsl/statistics.dylan) |
| **gsl-vector** | [vector.dylan](gsl/vector.dylan) |

### Randist

Here is the list of the random distributions available in the GSL library (some of them might not be implemented yet):

- [X] Gaussian distribution
- [X] Unit Gaussian distribution
- [X] Tail Gaussian and Unit Gaussiandistributions
- [ ] Bivariate Gaussian
- [ ] Multivariate Gaussian
- [X] Exponential distribution
- [X] Laplace distribution
- [X] Exponential Power distribution
- [X] Cauchy distribution
- [X] Rayleigh distribution
- [X] Landau distribution
- [X] Levy Alpha-Stable distribution
- [X] Levy Skewed Alpha-Stable distribution
- [X] Gamma distribution
- [X] Flat distribution
- [X] Lognormal distribution
- [ ] Chi-squared distribution
- [ ] Student's t-distribution
- [ ] F-distribution
- [ ] T-distribution (same as Student's t-distribution)
- [ ] Beta distribution
- [ ] Logistic distribution
- [ ] Pareto distribution
- [ ] Spherical vector distribution
- [ ] Weibull distribution
- [ ] Type-1 Gumbel distribution
- [ ] Type-2 Gumbel distribution
- [ ] Triangular distribution
- [ ] Dirichlet distribution
- [ ] Poisson distribution
- [ ] Bernoulli distribution
- [ ] Binomial distribution
- [ ] Multinomial distribution
- [ ] Negative binomial distribution
- [ ] Pascal distribution
- [ ] Geometric distribution
- [ ] Hypergeometric distribution
- [ ] Logarithmic distribution
- [ ] Wishart distribution

## FFI

The FFI part is a direct binding to the GSL library.
