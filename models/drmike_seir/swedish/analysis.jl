# use drmike's model
include("../SwedishCovid19Models/models/drmike_seir/original/drmike_seir_model_20200317.jl")

# Conversion from susceptible to exposed, β via:
#   p = probability to be exposed when meeting an infected person
#   n = number of people you come into contact with on a given day
β(p, n) = p*n

# drmike uses these two in the blog post:
β1 = β(0.02, 20)
β2 = β(0.04, 20)

# Exponential distr with σ 0.25 to represent the 2-14 day incubation period.
σ = 0.25

# Rate at which infected people recover, γ via:
#   L = days to recover from infection
γ(L) = 1/L

# drmike talks about this in the blog post:
γ1 = γ(10)
# But then uses as starting point:
γ2 = γ(7) # 0.143

# death rate for Sweden
PopulationSweden = 10.12e6
DaysPerYear = 365 # Since time series is per day
k = 88764 # Number of normal deaths per year in Sweden?
μSweden = k/(PopulationSweden*DaysPerYear)

# Starting point parameters:
p = [β1, σ, γ2, μSweden]

# which gives r0:
r0(p...) # 2.80

# Scenario 1: 20 people every day. Not clear which p is used but let's use 0.04
p1 = 0.04
n1 = 20
params1 = [β(p1, n1), σ, γ(7), μSweden]
r0_1 = r0(params1...) # 5.60

res1 = seir(params1...)

# Scenario 2: Social distancing to get to a R0 of 2.67. 
# Not clear which parameters he changes but I assume only n and
# thus needed n = 10 to get close.
p2 = 0.038
n2 = 10
params2 = [β(p2, n2), σ, γ(7), μSweden]
r0_2 = r0(params2...) # 2.80

res2 = seir(params2...)
