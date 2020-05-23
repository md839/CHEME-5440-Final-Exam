using DifferentialEquations
using Plots
include("PhasePortraitV2.jl")

function PhaseDiagram(D1,D2)
    v=0.00000000001
    dD1=@. (1/(1+10*D2^2))^2/(0.1+(1/(1+10*D2^2)^2))-D1
    dD2=@. (1/(1+10*D1^2))^2/(0.1+(1/(1+10*D1^2)^2))-D2

    return(dD1,dD2)
end

x1range=(0.0,1.0,50)
x2range=(0.0,1.0,50)
x0=([0.0,10.0],[1.0,10.0])
tspan=(0.0,100.0)

phaseplot(PhaseDiagram, x1range,x2range,xinit=(), t=tspan,clines=true,norm=true,scale=0.5)
