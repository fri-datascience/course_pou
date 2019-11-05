# Probability distributions

Name | parameters | pdf/pmf | cdf | mean | variance 
------------- | ------------- | --- | --- | --- | --- | --- 
Bernoulli | $p$ | $p^k (1 - p)^{1 - k}$ <br> \@ref(exr:binomialpmf) | | |  
binomial |$n$, $p$| $\binom{n}{k} p^k (1 - p)^{n - k}$ <br> \@ref(exr:bincdf) | | | 
Poisson |$\lambda$| $\frac{\lambda^k e^{-\lambda}}{k!}$ <br> \@ref(exr:poisex) | |  | 
geometric | $p$ | $p(1-p)^k$ <br> \@ref(exr:geocdf) | $1 - (1-p)^{k + 1}$ <br> \@ref(exr:geocdf)| |
normal |$\mu$, $\sigma$ |$\frac{1}{\sqrt{2 \pi \sigma^2}} e^{\frac{(x - \mu)^2}{2 \sigma^2}}$ <br> \@ref(exr:normalpdf)| $\int_{-\infty}^x \frac{1}{\sqrt{2 \pi \sigma^2}} e^{\frac{(t - \mu)^2}{2 \sigma^2}} dt$ <br> \@ref(exr:normalpdf)| |  
beta |$\alpha$, $\beta$| $\frac{x^{\alpha - 1} (1 - x)^{\beta - 1}}{\text{B}(\alpha, \beta)}$ <br> \@ref(exr:betacdf) | | | 
gamma |$\alpha$, $\beta$| $\frac{\beta^\alpha}{\Gamma(\alpha)} x^{\alpha - 1}e^{-\beta x}$  <br> \@ref(exr:gammapdf) | $\frac{\gamma(\alpha, \beta x)}{\Gamma(\alpha)}$ <br> \@ref(exr:gammapdf)| | 
exponential |$\lambda$| $\lambda e^{-\lambda x}$ <br> \@ref(exr:expcdf)| $1 - e^{-\lambda x}$ <br> \@ref(exr:expcdf) |  |
logistic |$\mu$, $s$| $\frac{e^{-\frac{x - \mu}{s}}}{(1 + e{-\frac{x - \mu}{s}})^2}$ <br> \@ref(exr:logitpdf) | $\frac{1}{1 + e^{-\frac{x - \mu}{s}}}$ <br> \@ref(exr:logitpdf) | | 
negative binomial |$r$, $p$| $\binom{k + r - 1}{k}(1-p)^r p^k$ <br> \@ref(exr:negbinpdf) | | | 



