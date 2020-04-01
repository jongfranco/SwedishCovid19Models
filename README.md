# SwedishCovid19Models

We collect data, papers, and models for modeling/prediction in relation to COVID-19. Focus is on epidemiological modeling, typically with a statistical/stochastic flavor. We also try to track predictions (mainly point estimates) that have been done in public fora.

Our focus is on Sweden but our aim in the modeling is generality and modularity so that others can apply to their context. We also track international models that include Sweden or that can be used as comparison points for Swedish models.

Our goal is not to point out one, "best" model but to get strength in numbers, i.e. by seeing a number of different models and approaches and their predictions this can, taken together, help inform policy and decisions.

We also point to some good, external sites below that can give a general, graphical overview of the current state of the pandemic. Our focus is on models and predictions, though.

We invite everyone to contribute by building on or helping improve our models and information.

**Disclaimer**: Research around COVID-19 is happening at a very fast pace around the world and very few papers have yet been fully peer reviewed. We thus caution that proper peer reviewing and acceptance of papers will be needed before we can truly know which models and approaches have been properly conceived and make sense. Also, remember that making credible models of any real-world phenomena is often hard and [in particular when less is known and the subject is complex](https://fivethirtyeight.com/features/why-its-so-freaking-hard-to-make-a-good-covid-19-model/), such as for viruses and COVID-19. And models frequently give (wildly) [different results depending on assumptions and goals in the modelling](https://www.bloomberg.com/opinion/articles/2020-03-31/what-the-coronavirus-models-are-trying-to-tell-us). Still, since this is developing fast we think there is value in collecting what is out there and, as much as possible, to try it in a Swedish context. If you find an error, please file an issue above and we will do our best to quickly correct it. Thanks for your understanding.

## Graphs and overviews

The current best graphical overview of the COVID-19 pandemic can, in our view, be found in the graphs and analysis from OurWorldInData so we [refer you there](https://flip.it/h.wzvd). A similar, graphical "tracker" for key data for Sweden was also recently added [here](https://c19.se/) and the more "official" one from Folkhälsomyndigheten [can be found here](https://experience.arcgis.com/experience/09f821667ce64bf7be6f9f87457ed9aa).

## Models

### Point estimates: Number of dead, final in total

Point predictions of the final number of total deaths in Sweden.

| Estimate         | Num. dead  | Date | Comment |
| ---------------- |:----------:|:----:|:--------|
| [Björkman200330](point_estimates/20200330_Bjorkman_DN_debatt.txt) | 1000 | 2020-03-30 | in near-time, for 2020 |

### Swedish general models (Incidence, ICU need, Deaths)

Values listed below are predicted peak value and peak date (day/month). As one example, [Sjodin20200320v1](https://www.medrxiv.org/content/10.1101/2020.03.20.20039594v1) predicted on 2020-03-20 that on May 28th 2020 there is a need for 5,837 ICU hospital beds in Sweden if we have normal mobility and don't limit social distancing while with strong distancing this limits the ICU need to 686 beds and delays the peak to July 30th. The effect on the number of deaths is also stark, predicted at 16,748 in the former scenario but reduced to 3186 in the latter.

| Model | Infections | ICU need / day | Deaths | Date |
| ----- |:----------:|:--------:|:------:|:----:|  
| [Sjodin20200320v1](https://www.medrxiv.org/content/10.1101/2020.03.20.20039594v1) - 1 Normal mobility & distancing | 817,490 (17/5) | 5,837 (28/5) | 16,748 | 2020-03-20 |
| [Sjodin20200320v1](https://www.medrxiv.org/content/10.1101/2020.03.20.20039594v1) - 3 Normal mobility & strong distancing | 80,966 (19/7) | 686 (30/7) | 3,186 | 2020-03-20 |
| [Sjodin20200320v1](https://www.medrxiv.org/content/10.1101/2020.03.20.20039594v1) - 7 Low mobility & strong distancing | 115,362 (10/8) | 925 (17/8) | 3,866 | 2020-03-20 |
| [Sjodin20200320v1](https://www.medrxiv.org/content/10.1101/2020.03.20.20039594v1) - 9 Low mobility & strong distancing > age 60 | 860,146 (25/5) | 4,759 (8/6) | 13,097 | 2020-03-20 | 

- [Sjodin20200320v1](https://www.medrxiv.org/content/10.1101/2020.03.20.20039594v1) paper estimates all 4 major outcome metrics for different scenarios. We summarize only a few scenarios above, see the paper for details. Their model is a "compartmental SEIR alike model including compartment for hospitalization and ICU care". Basically, they use ODE's and solve it at the level of municipalities where the municipality radiation model was calibrated using a N1H1 Influenza A model for Swedish influenza incidence. 
  * The nine (9) scenarios studied are parameterized per municipality mobility (Normal 100% or Low 50%), social distancing (100%, 75%, 50%, 25%, 50%@>60). All scenarios also assume "Isolation of hospitalized cases and self-quarantine of apparent symptomatic infections". Each scenario is then further parameterized on the Infection Fatality Ratio (1.0%, 0.5%, 0.2%). We only show the medium, 0.5% IFR, in the table above.
  * We have contacted the authors to be clear that we have not misunderstood the scenarios since the predicted numbers increase between scenario 3 and 7. Since the latter has lower mobility one might expect lower values. However, it might lead to longer time until immunity spreads and thus just flatten the curve and delay things.

### EU Infected and R0 Models

| Model            | % Infected | R0 | Date |
| ---------------- |:----------:|:--:|:----:| 
| [Flaxman200330](papers/localpdfs/flaxman2020.pdf) - Sweden | 3.1% [0.85%-8.4%] | 2.64 [1.40-4.18] | 2020-03-30 |
| [Flaxman200330](papers/localpdfs/flaxman2020.pdf) - Norway | 0.41% [0.09%-1.2%] | 0.97 [0.14-2.14] | 2020-03-30 |
| [Flaxman200330](papers/localpdfs/flaxman2020.pdf) - Italy | 9.8% [3.2%-26%] | |2020-03-30 |

- [Flaxman200330](papers/localpdfs/flaxman2020.pdf) is a hierarchical Bayesian model comparing 11 European countries. They note that uncertainties are high though and that Sweden's R0 estimate might be higher since we have not ordered a lockdown; this might be a modeling artefact. The report will be updated weekly. The model is only fit on the number of reported deaths from ECDC data, no case data is used. The (Stan) [code for this model is available](https://github.com/ImperialCollegeLondon/covid19model).

### International CFR (Case Fatality Rate) Models

| Model            | COVID-19 CFR  | CI 95% | WHO CFR (at the time) | crude CFR |Date |
| ---------------- |:-------------:|:------:|:---------------------:|:---------:|:----:| 
| [Angelopoulos2020](https://arxiv.org/abs/2003.08592) - Global | 2.4% | | 3.4% |  4.4% | 2020-03-26 |
| [Hauser2020v2](https://github.com/jriou/covid_adjusted_cfr) - China | 3.0% | 2.6-3.4% | 3.4% | | 2020-03-22 |
| [Hauser2020v2](https://github.com/jriou/covid_adjusted_cfr) - Italy | 3.3% | 2.0-4.7% | 3.4% | | 2020-03-22 |

The CI column lists the confidence interval for frequentist analyses and credible interval for bayesian analysis when applicable / available. WHO CFR is their global estimate regardless of country listed above and "crude CFR" refers to the naïve estimator.

Further links and details:
- [Angelopoulos2020](https://arxiv.org/abs/2003.08592) - Better estimation techniques for CFR based on Expectation Maximization. Recommends that crude CFR shouldn't be used as it is unreliable.
  * 2020-03-19: Estimates a global corrected CFR of 2.4% for COVID-19, in contrast to WHO estimate of 3.4% and data indicating 4.4%.
  * [Code is available](https://github.com/aangelopoulos/cfr-covid-19) for applying this method.
- [Hauser2020v2](https://github.com/jriou/covid_adjusted_cfr), a Bayesian CFR model from Hauser et al at University of Bern. ([Latest PDF](https://github.com/jriou/covid_adjusted_cfr/blob/master/manuscript/manuscript_v2.pdf))
  * This underestimates the total deaths since it predicts deaths among people already infected during the period of interest, i.e. it does not model people that will be infected after the period for which you have data. This is since the goal is to get a better estimate of Case Fatality Rate, not to predict cases or deaths.

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

- [Sjodin20200320v1](https://www.medrxiv.org/content/10.1101/2020.03.20.20039594v1)
