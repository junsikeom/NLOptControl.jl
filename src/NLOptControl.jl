isdefined(Base, :__precompile__) && __precompile__()

module NLOptControl
# TODO  enable setvalue() functionality

using JuMP
import JuMP: setRHS,
             getvalue,
             setvalue,
             @NLexpression,
             @NLobjective,
             @NLparameter,
             @NLconstraint,
             internalmodel
export @NLexpression,
       @NLobjective,
       @NLparameter,
       @NLconstraint,
       setvalue,
       getvalue,
       setRHS

using Ipopt
using FastGaussQuadrature
using DataFrames
using CSV
using Interpolations
using Parameters
import LinearAlgebra

const pseudoSpectralMethods = [ :lgrExplicit , :lgrImplicit ]
const trapezoidalMethods = [ :trapezoidal, :bkwEuler ]

include("math.jl")

include("types.jl")

include("utils.jl")

# TODO: make a hamiltonian function
export  resultsDir!,
        evalConstraints!,
        postProcess!,
        optimize!,
        interpolateLagrange!,
        interpolateLinear!,
        interpolate_lagrange,
        opt2dfs!,
        defineMPC!,
        initOpt!,
        defineIP!,
        mapNames!,
        simIPlant!,
        updateX0!,
        currentIPState,
        goalReached!,
        simMPC!,
        plant2dfs!,
        predictX0!,
        defineTolerances!,
        linearStateTolerances!,
        newConstraint!,
        evalMaxDualInf,
        states!,
        controls!,
        minDF,
        maxDF,
        savePlantData!,
        saveData,
        linearSpline,
        saveOptData,
        integrate!

include("setup.jl")
export  define,
        defineSolver!,
        configure!,
        dynamics!,
        constraints!,
        NLExpr

include("ps.jl")

include("diffeq.jl")

include("PrettyPlots/PrettyPlots.jl")
using .PrettyPlots

export  minDF,
        maxDF,
        plotSettings,
        _pretty_defaults,
        currentSettings,
        statePlot,
        controlPlot,
        costatesPlot,
        costatesPlots,
        allPlots,
        adjust_axis,
        mpcPlot,
        tPlot,
        optPlot,
        xlims!,
        ylims!,
        plot

end # module
