# Probability distributions

Name | pdf/pmf | cdf | mean | variance | Use in R | relationships
------------- | ------------- | --- | --- | --- | --- | --- 
Bernoulli | $p^k (1 - p)^{1 - k}$ <br> \@ref(exr:binomialpmf) | | | | | 
binomial | $\binom{n}{k} p^k (1 - p)^{n - k}$ <br> \@ref(exr:binomialpmf) | | | | | 
Poisson | $\frac{\lambda^k e^{-\lambda}}{k!}$ <br> \@ref(exr:geopoispmf) | | | | | 
geometric | $p(1-p)^k$ <br> \@ref(exr:geopoispmf) | $1 - (1-p)^{k + 1}$ <br> \@ref(exr:geocdf)| | | | 
Normal | $\frac{1}{\sqrt{2 \pi \sigma^2}} e^{\frac{(x - \mu)^2}{2 \sigma^2}}$ <br> \@ref(exr:normalpdf)| $\int_{-\infty}^x \frac{1}{\sqrt{2 \pi \sigma^2}} e^{\frac{(t - \mu)^2}{2 \sigma^2}} dt$ <br> \@ref(exr:normalpdf)| | | | 
MVN | | | | 
categorical | | | | | | 
dirichlet |  | | | | | 
beta | $\frac{x^{\alpha - 1} (1 - x)^{\beta - 1}}{\text{B}(\alpha, \beta)}$ \@ref(exr:betacdf) | | | | | 
gamma |  | | | | | 
exponential | $\lambda e^{-\lambda}$ <br> \@ref(exr:expcdf)| $1 - e^{-\lambda x}$ <br> \@ref(exr:expcdf) | | | | 
logistic | $\frac{e^{-\frac{x - \mu}{s}}}{(1 + e{-\frac{x - \mu}{s}})^2}$ <br> \@ref(exr:logitpdf) | $\frac{1}{1 + e^{-\frac{x - \mu}{s}}}$ <br> \@ref(exr:logitpdf) | | | | 
rayleigh |  | | | | | 
t | | | | | | 
F |  | | | | |
$\chi^2$ |  | | | | | 
Wishart |  | | | | | 
Pareto |  | | | | |
Weibull |  | | | | | 
negative binomial | $\binom{k + r - 1}{k}(1-p)^r p^k$ <br> \@ref(exr:negbinpdf) | | | | | 
multinomial |  | | | | | 


