const DataDir = joinpath(@__DIR__(), "..")
const RawDataDir = joinpath(DataDir, "raw")
const CleanDataDir = joinpath(DataDir, "clean", "sweden")

const ECDCDir = joinpath(RawDataDir, "ECDC")
const FHMDir = joinpath(RawDataDir, "Folkhalsomyndigheten")
const SCBDir = joinpath(RawDataDir, "SCB")

function save_to_csv(prefix, df, origtimestamp, dir = CleanDataDir)
    filename = joinpath(dir, prefix * "_" * origtimestamp * ".csv")
    println("Writing $(nrow(df)) entries to file $filename")
    CSV.write(filename, df)
end

function get_timestamp(filename)
    m = match(r"_(\d{8}_\d{4})\.csv$", filename)
    return isnothing(m) ? "" : m[1]
end

function find_latest_file(d, prefix, postfix; midfix = false)
    files = readdir(d)
    startRE = Regex("^" * prefix)
    endRE = Regex(postfix * "\$")
    filesmatching = filter(fn -> occursin(startRE, fn) && occursin(endRE, fn), files)
    if length(filesmatching) == 0
        error("No files in $(d) have prefix $(prefix) and postfix $(postfix)")
    else
        sort!(filesmatching)
        latestfile = last(filesmatching)
        if midfix
            m = match(Regex("^" * prefix * ".+(\\d{8}_\\d{4}).+" * postfix * "\$"), strip(latestfile))
            if !isnothing(m)
                return joinpath(d, latestfile), m[1]
            end
        end
        return joinpath(d, latestfile)
    end
end