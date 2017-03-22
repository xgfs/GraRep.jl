function ScaleMat(network)
    network = network - sum(diagm(diag(network))) # no self-loops
    network = network ./ sum(network, 2) #scale by row
    network
end

function GraRep(network, ndim)
    n = size(network, 1);
    probTranMat = log(network ./ repmat(sum(network, 1), n, 1)) + log(n)
    probTranMat[probTranMat.<0] = 0
    #U,S,V = svd(probTranMat) #original: full SVD
    #R = U[:, 1:ndim]*diagm(S[1:ndim].^0.5)
    svdr,_,_,_,_ = svds(probTranMat, nsv=ndim)
    R = svdr.U*diagm(svdr.S.^0.5)
    R = R./repmat(sqrt(sum(R.^2, 2)), 1, ndim)
    R
end

function GetEmbs(network, ndim, nstep)
    n = size(network, 1);
	Ak = copy(network)
    embs = zeros(Float32, n, ndim*nstep);
    println("step 1")
    embs[:,1:ndim] = GraRep(Ak, ndim)
    for i =2:nstep    
        println("multiplying mat #", i)
        Ak = Ak*network
        println("step #", i)
        embs[:,1+ndim*i-ndim:ndim*i] = GraRep(Ak, ndim)
    end
    embs
end