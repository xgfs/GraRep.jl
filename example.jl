using MAT

include("GraRep.jl")

file = matopen("blogcatalog.mat")
network = ScaleMat(convert(Array{Float32},full(read(file, "network")))) #sparse -> dense float32
close(file)
embs = GetEmbs(network, 32, 4)
f = open("embs.bin", "w")
write(f, embs')
close(f)