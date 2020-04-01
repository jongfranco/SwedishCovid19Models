# Angelopoulos2020

Anastasios Nikolas Angelopoulos, Reese Pathak, Rohit Varma, Michael I. Jordan, "Identifying and Correcting Bias from Time- and Severity- Dependent Reporting Rates in the Estimation of the COVID-19 Case Fatality Rate", 2020.

- "estimating the CFR by dividing the number of deaths by the number of cases should not be used anymore as it is unreliable" (our comment: This is often called the "naive CFR" or the "crude CFR", and should be avoided)
- "Moving forward we suggest instead the use of maximum likelihood models which correct for time-dependent bias"
- "We report results from a likelihood model validated on data from past pandemic influenzas which accounts for the bias introduced by time- and severity-dependent reporting rates during the ongoing COVID-19 pandemic."
- Using our method... "we obtain a CFR estimate of 2.4% for COVID-19". (2020-03-23)

Our analysis of this paper:

- The last author is one of the most prominent and well-respected researchers in Machine Learning. We have confidence in the abilities of the team involved.
- Their argument is compelling.
- It thus seems likely that their estimate of 2.4% is a better CFR estimate than the ones from WHO.
- However, since their estimate did go down with data from only 4 more days (from March 19th to March 23rd below) we would argue that applying their method on later data will be very revealing. If their CFR estimate continues to go down with more data this would indicate the estimate is still not "stable".
- However, their method relies on reliable recovery data which we do not yet have for Sweden. This is probably why they focus on China and Italy as well as the global estimate.
- [Code is available](https://github.com/aangelopoulos/cfr-covid-19) for applying this method.

## Versions and predictions

| Version | CFR - Global | Date |
| ------- |:------------:|:----:|
[Angelopoulus2020v3](https://arxiv.org/abs/2003.08592v3) | 2.4% | 2020-03-23 |
[Angelopoulus2020v2](https://arxiv.org/abs/2003.08592v2) | 2.4% | 2020-03-23 |
[Angelopoulus2020v1](https://arxiv.org/abs/2003.08592v1) | 2.8% | 2020-03-19 |

Date is the date on which the estimate was calculated (and not when the paper was available).
