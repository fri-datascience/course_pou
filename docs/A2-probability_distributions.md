# Probability distributions

Name | pdf/pmf | cdf | mean | variance | Use in R | relationships
------------- | ------------- | --- | --- | --- | --- | --- 
Bernoulli | $p^k (1 - p)^{1 - k}$ <br> \@ref(exr:binomialpmf) | | | | | 
binomial | $\binom{n}{k} p^k (1 - p)^{n - k}$ <br> \@ref(exr:binomialpmf) | | | | | 
Poisson | $\frac{\lambda^k e^{-\lambda}}{k!}$ <br> \@ref(exr:geopoispmf) | | | | | 
geometric | $p(1-p)^k$ <br> \@ref(exr:geopoispmf) | $1 - (1-p)^{k + 1}$ <br> \@ref(exr:geocdf)| | | | 
Normal | | | | | | 
MVN | | | | 
categorical | | | | | | 
dirichlet |  | | | | | 
beta | $\frac{x^{\alpha - 1} (1 - x)^{\beta - 1}}{\text{B}(\alpha, \beta)}$ \@ref(exr:betacdf) | | | | | 
gamma |  | | | | | 
exponential | $\lambda e^{-\lambda}$ <br> \@ref(exr:expcdf)| $1 - e^{-\lambda x}$ <br> \@ref(exr:expcdf) | | | | 
logistic |  | | | | | 
rayleigh |  | | | | | 
t | | | | | | 
F |  | | | | |
$\chi^2$ |  | | | | | 
Wishart |  | | | | | 
Pareto |  | | | | |
Weibull |  | | | | | 
negative binomial |  | | | | | 
multinomial |  | | | | | 


