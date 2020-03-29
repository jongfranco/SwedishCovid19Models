DataDir = joinpath(@__DIR__(), "..")
RawDataDir = joinpath(DataDir, "raw")
CleanDataDir = joinpath(DataDir, "clean", "sweden")

ECDCDir = joinpath(RawDataDir, "ECDC")
FHMDir = joinpath(RawDataDir, "Folkhalsomyndigheten")

function save_to_csv(prefix, df, origtimestamp, dir = CleanDataDir)
    filename = joinpath(dir, prefix * "_" * origtimestamp * ".csv")
    println("Writing $(nrow(df)) entries to file $filename")
    CSV.write(filename, df)
end

function get_timestamp(filename)
    m = match(r"_(\d{8}_\d{4})\.csv$", filename)
    return isnothing(m) ? "" : m[1]
end