# Probability distributions

Name | pdf/pmf | cdf | mean | variance | Use in R | relationships
------------- | ------------- | --- | --- | --- | --- | --- 
Bernoulli | $p^k (1 - p)^{1 - k}$ <br> \@ref(exr:binomialpmf) | | $p$ <br> \@ref(exr:Bernev) | $p(1-p)$ <br> \@ref(exr:Bernev) | | 
binomial | $\binom{n}{k} p^k (1 - p)^{n - k}$ <br> \@ref(exr:binomialpmf) | | $np$ <br> \@ref(exr:binomev) | $np(1-p)$ <br> \@ref(exr:binomev) | | 
Poisson | $\frac{\lambda^k e^{-\lambda}}{k!}$ <br> \@ref(exr:geopoispmf) | | $\lambda$ <br> \@ref(exr:poisev) | $\lambda$ <br> \@ref(exr:poisev) | | 
geometric | $p(1-p)^k$ <br> \@ref(exr:geopoispmf) | $1 - (1-p)^{k + 1}$ <br> \@ref(exr:geocdf)| $\frac{1 - p}{p}$ <br> \@ref(exr:geoev) | TODO: MGF | | 
Normal | $\frac{1}{\sqrt{2 \pi \sigma^2}} e^{\frac{(x - \mu)^2}{2 \sigma^2}}$ <br> \@ref(exr:normalpdf)| $\int_{-\infty}^x \frac{1}{\sqrt{2 \pi \sigma^2}} e^{\frac{(t - \mu)^2}{2 \sigma^2}} dt$ <br> \@ref(exr:normalpdf)| | | | 
MVN | | | | 
categorical | | | | | | 
dirichlet |  | | | | | 
beta | $\frac{x^{\alpha - 1} (1 - x)^{\beta - 1}}{\text{B}(\alpha, \beta)}$ <br> \@ref(exr:betacdf) | | | | | 
gamma | $\frac{\beta^\alpha}{\Gamma(\alpha)} x^{\alpha - 1}e^{-\beta x}$  <br> \@ref(exr:gammapdf) | $\frac{\gamma(\alpha, \beta x)}{\Gamma(\alpha)}$ <br> \@ref(exr:gammapdf)| $\frac{\alpha}{\beta}$ <br> \@ref(exr:gammaev) | $\frac{\alpha}{\beta^2}$ <br> \@ref(exr:gammaev) | | 
exponential | $\lambda e^{-\lambda x}$ <br> \@ref(exr:expcdf)| $1 - e^{-\lambda x}$ <br> \@ref(exr:expcdf) | $\lambda^{-1}$ <br> \@ref(exr:expev) | $\lambda^{-2}$ <br> \@ref(exr:expev) | | 
logistic | $\frac{e^{-\frac{x - \mu}{s}}}{(1 + e{-\frac{x - \mu}{s}})^2}$ <br> \@ref(exr:logitpdf) | $\frac{1}{1 + e^{-\frac{x - \mu}{s}}}$ <br> \@ref(exr:logitpdf) | | | | 
rayleigh |  | | | | | 
t | | | | | | 
F |  | | | | |
$\chi^2$ |  | | | | | 
Wishart |  | | | | | 
Pareto |  | | | | |
Weibull |  | | | | | 
negative binomial | $\binom{k + r - 1}{k}(1-p)^r p^k$ <br> \@ref(exr:negbinpdf) | | | | | 
multinomial | $\frac{n!}{x_1!x_2!...x_k!} p_1^{x_1} p_2^{x_2}...p_k^{x_k}$ <br> \@ref(exr:mnompdf) | | | | | 


