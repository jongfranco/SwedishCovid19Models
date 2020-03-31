# From http://epirecip.es/epicookbook/chapters/sir/julia

# 1. Using the DE macro DSL
using DifferentialEquations

sir_ode = @ode_def SIRModel begin
    dS = -β*S*I
    dI = β*S*I-γ*I
    dR = γ*I
end β γ

parms = [0.1,0.05]
init = [0.99,0.01,0.0]
tspan = (0.0,200.0)

sir_prob = ODEProblem(sir_ode,init,tspan,parms)

sir_sol = solve(sir_prob,saveat = 0.1);

# 2. Visualisation using Plots
using Plots

plot(sir_sol,xlabel="Time",ylabel="Number")

# 3. Using the DE function interface
function sir_ode2(du,u,p,t)
    S,I,R = u
    b,g = p
    du[1] = -b*S*I
    du[2] = b*S*I-g*I
    du[3] = g*I
end

parms = [0.1,0.05]
init = [0.99,0.01,0.0]
tspan = (0.0,200.0)
sir_prob2 = ODEProblem(sir_ode2,init,tspan,parms)
sir_sol = solve(sir_prob2,saveat = 0.1);
