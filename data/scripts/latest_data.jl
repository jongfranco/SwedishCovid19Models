using DataFrames, CSV

include("common.jl")

const LATEST_ECDC_FILE = find_latest_file(ECDCDir, "covid19_worldwide_cases_ecdc", "csv")

latest_ecdc_data() = CSV.read(LATEST_ECDC_FILE)

const NordicCountries = ["Sweden", "Denmark", "Finland", "Norway"]

function latest_ecdc_data(selectCountries::Vector{String})
    df = latest_ecdc_data()
    selected = map(ct -> in(ct, selectCountries), df.countriesAndTerritories)
    df[selected, :]
end

latest_ecdc_data(country::String) = latest_ecdc_data([country])

latest_ecdc_data_for_sweden() = latest_ecdc_data("Sweden")

# To sort on date we first parse as Julia date. 
using Dates
const ECDCDateFormat = DateFormat("dd/mm/yyy")

function sort_by_ecdc_date(ecdcdf::DataFrame, rev=false)
    juliadates = Date.(ecdcdf.dateRep, ECDCDateFormat)
    perm = sortperm(juliadates, rev=rev)
    return ecdcdf[perm, :]
end

# Swedish population according to:
# https://www.worldometers.info/world-population/sweden-population/
# which on 2020-03-28 at 11:20 was 10,082,924
const SwedishPopulation20200328_1120 = 10_082_924

const PopulationSizes = Dict(
    "Sweden" => SwedishPopulation20200328_1120
)

population_size(country::String) = PopulationSizes[country]

# Get the S (Susceptible), I (Infected), and D (Dead) vectors.
# If normalized == true normalize to range 0.0-1.0.
function latest_S_I_D_data(country::String; start = nothing, asfloat = false)
    df = sort_by_ecdc_date(latest_ecdc_data(country))
    I = cumsum(df.cases)
    D = cumsum(df.deaths)
    S = (population_size(country) * ones(Int, length(I))) .- (I .+ D)

    if isa(start, Number)
        reldays = round(Int, start)
        idx = findfirst(i -> i > 0, I)
        startidx = min(max(1, idx + reldays), length(I))
        S, I, D = S[startidx:end], I[startidx:end], D[startidx:end]
    end

    if asfloat
        return float(S), float(I), float(D)
    else
        return S, I, D
    end
end