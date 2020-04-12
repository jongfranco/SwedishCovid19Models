using DataFrames, CSV

include("common.jl")

const SwedesPerAgeGroupCsvLatestFile = find_latest_file(SCBDir, "swedes_per_age_group", "csv")

df = CSV.read(SwedesPerAgeGroupCsvLatestFile)

function merge_counts_to_fhm_age_groups(df)
    fhmcounts = Dict{String, Int}()
    for r in 1:nrow(df)
        agegroup = df[r, 2]
        m = match(r"^\s*(\d+)-(\d+)", agegroup)
        if !isnothing(m)
            lowage, highage = parse(Int, m[1]), parse(Int, m[2])
            di = div(lowage, 10)
            low10 = di*10
            high10 = di*10 + 9
            fhmkey = (low10 == 90) ? "90+" : "$(low10)-$(high10)"
            fhmcounts[fhmkey] = get!(fhmcounts, fhmkey, 0) + df[r, 4]
        elseif occursin("100+", agegroup)
            fhmcounts["90+"] = get!(fhmcounts, "90+", 0) + df[r, 4]
        else
            error("Couldn't match age group: $agegroup")
        end
    end
    fhmcounts
end

const FHMAgeGroupCounts = merge_counts_to_fhm_age_groups(df)

vals = collect(FHMAgeGroupCounts)
agegroups = map(first, vals)
counts = map(t -> t[2], vals)
p = sortperm(agegroups)
pcts = round.(100.0*counts[p]/sum(counts), digits = 4)
dfnew = DataFrame(AgeGroup = agegroups[p], NumSwedes = counts[p], Pct = pcts)
fn = joinpath(CleanDataDir, "scb_swedes_per_age_group.csv")
CSV.write(fn, dfnew)
println("Wrote file $fn")