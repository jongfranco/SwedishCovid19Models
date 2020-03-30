using DiffEqBayes
using OrdinaryDiffEq, RecursiveArrayTools, Distributions, ParameterizedFunctions, Mamba
using Plots

# params: 

# SEIV model from eq 2 in [Getz2018], where N = S+E+I+V
seiv = @ode_def SEIV_Getz2018 begin 
    dS = λ[t] + ν*V - (τ[I, N] + μ)*S
    dE = τ[I, N]*S - (σ + μ)*E
    dI = σ*E - (γ + α + μ)*I
    dV = γ*I - (v + μ)*V 
end λ[t], ν, τ[I, N], μ, σ, γ, α
# but not sure how to encode λ[t] and τ[I, N]