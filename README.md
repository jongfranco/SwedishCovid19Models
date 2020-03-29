# SwedishCovid19Models

We collect data, papers, and models for modeling/prediction in relation to COVID-19. Focus is on epidemiological modeling, typically with a statistical/stochastic flavor. 

Our focus is on Sweden but our aim is generality and modularity so that others can apply to their context.

Our goal is not to point out one, "best" model but to get strength in numbers, i.e. by seeing a number of different models and approaches and their predictions this can, taken together, help inform policy and decisions.

## Models

### Model comparisons

### Swedish Incidence Models

TBD, simple table to compare models...

### International CFR (Case Fatality Rate) Models

| Model            | COVID-19 CFR  | WHO CFR (at the time) | Date |
| ---------------- |:-------------:|:---------------------:|:----:| 
| [Angelopoulos2020](https://arxiv.org/abs/2003.08592) | 2.4% | 3.4% | 2020-03-19 |
| [Hauser2020v2](https://github.com/jriou/covid_adjusted_cfr) - China | 3.0% (2.6-3.4%) | 3.4% | 2020-03-22 |
| [Hauser2020v2](https://github.com/jriou/covid_adjusted_cfr) - Italy | 3.3% (2.0-4.7%) | 3.4% | 2020-03-22 |

Further links and details:
- [Angelopoulos2020](https://arxiv.org/abs/2003.08592) - Better estimation techniques for CFR based on Expectation Maximization. Recommends that crude CFR shouldn't be used as it is unreliable.
  * 2020-03-19: Estimates a global corrected CFR of 2.4% for COVID-19, in contrast to WHO estimate of 3.4% and data indicating 4.4%.
- [Hauser2020v2](https://github.com/jriou/covid_adjusted_cfr), a Bayesian CFR model from Hauser et al at University of Bern. ([Latest PDF](https://github.com/jriou/covid_adjusted_cfr/blob/master/manuscript/manuscript_v2.pdf))
  * This underestimates the total deaths since it predicts deaths among people already infected during the period of interest, i.e. it does not model people that will be infected after the period for which you have data. This is since the goal is to get a better estimate of Case Fatality Rate.

## Data

We collect raw as well as cleaned (pre-processed, filtered, and curated) data for people that want to build their own models.

### Raw data

### Cleaned Swedish data

[ECDC data](https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide) for Sweden:
- incidence data, all cases: [all_swedish_cases_incidence_20200328_1036.csv](data/clean/sweden/all_swedish_cases_incidence_20200328_1036.csv)
- incidence data, starting from 3 days before first case: [start_minus3_swedish_cases_incidence_20200328_1036.csv](data/clean/sweden/start_minus3_swedish_cases_incidence_20200328_1036.csv)

[Folkhälsomyndigheten](https://experience.arcgis.com/experience/09f821667ce64bf7be6f9f87457ed9aa):
- age distributed: [age_distributions_cases_and_deaths/20200328_1634.csv](data/raw/Folkhalsomyndigheten/age_distributions_cases_and_deaths/20200328_1634.csv)

## Papers

We collect relevant research papers and pre-prints on modeling in relation to COVID-19 and other, relevant epidemics. [See this file for links to all the papers](papers/Covid19ModelingPapers.md), below we just list the ones for Sweden:

- TBD
