### How to calculate LA50 (percentage TBSA at which 50 percent of burn patients will die)?

I have this dataset on burns.

https://www.dropbox.com/s/vtnbz6dwk3arztx/finalthesis2.csv?dl=0.

These are the relevant variables in my data:

     [1] "X"                  "serialnum"          "ip_no"             
     [4] "name"               "age"                "sex"               
     [7] "address"            "type_of_burns"      "intention_of_burns"
    [10] "inhalation_injury"  "TBSA"               "fullthicknessburns"
    [13] "mortality"          "duration_of_stay"   "absi"              
    [16] "creatinine"         "hb"                 "albumin"           
    [19] "platelet_count"     "Agemodified"        "tbsamodified"     

From this data, I want to calculate `LA50` (TBSA value where the 50% of burn patients die).

How to do that in R using probit regression? Any urgent help please? I couldn't find help anywhere. So asking in this forum.

Thanking you.
Suman



## Answer


You are interested in the mortality rate depending on TBSA, and specifically which value for TBSA corresponds with a 50% mortality rate.

As you mentioned, Generalized Linear regression is the way to go here, using a logit or probit link function.

How does this work? In normal linear regression, you assume residuals that are normally distributed, and by extension this means that the response variable should be continuous and not be bounded by some upper or lower bound. However, with mortality rate, the response variable is bounded between 0 and 1. 

GLMs transform the response variable so that it goes from $(0,1)$ to $(-\infty,\infty)$, using a link function. Examples of link functions for this case are the logit link and the probit link.

So if you have the mortality $M_i \in (0,1)$, then in the probit model:

$$\Phi^{-1}(M_i) = \eta_i = \beta_0 + \beta_1\textrm{TBSA}$$

where $\Phi^{-1}(x)$ is the inverse CDF of the standard normal distribution. The CDF translates some value $x$ into the probability $P(X\sim N(0,1) \leq x)$. It is easy to see that $\Phi(-\infty)=0$ and $\Phi(\infty)=1$. Also note that $\Phi(0)=0.5$. Of course, taking the inverse of the function performs the transformation we want.

If we then use any package to fit this GLM model, we get estimates for $\beta_0$ and $\beta_1$. So how do we get the LA50 from this?

As we noted earlier, the LA50 is the value for TBSA for which $M_i = 0.5$. Plugging this into the model above, we get:

$$\Phi^{-1}(0.5) = \eta_i = \beta_0 + \beta_1\textrm{TBSA}$$

Earlier we noted that $\Phi(0)=0.5$, so $\Phi^{-1}(0.5)=0$, so to find the LA50, we have to solve:

$$0 = \beta_0 + \beta_1\textrm{TBSA}$$

This should be a piece of cake.
