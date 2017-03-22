# GraRep
Re-implementation of GraRep in Julia language

## Imlementation notes
* This is a re-write of a [GraRep](https://github.com/ShelsonCao/GraRep) graph embedding technique that fixes some inefficiencies in the code:
	+ It does not iteratively create a A_k matrix but does SVD at each step, appending the embeddings
	+ It uses much less memory due to this and some other optimizations (i.e. 3Gb vs 6.8 Gb for blogcatalog network)
	+ It is much faster the original implementation (~10 times, smaller dim=>biggeer improvement) by using Implicitly Restarted Arnoldi Method (svds function, to put it easy)
* You need [Julia](http://julialang.org) and [MAT](https://github.com/simonster/MAT.jl) Julia library to use the example. Just type Pkg.add("MAT") in Julia console to install it.

## Notice
1. You do not need impose L2 norm for embeddings again, or accuracy will be hurt. Actually normlization has been already done;
2. GraRep is suitable for undirected graphs. If you want to apply it for the directed graphs, please use matrix addition between adjacency matrix and its transpose to replace original adjaceny matrix before you run GraRep.

## Lisence
This code follows the MIT Lisence.

## Citation
If you want to use this code, please kindly cite the original paper

@inproceedings{cao2015grarep,<br/>
  title={Grarep: Learning graph representations with global structural information},<br/>
  author={Cao, Shaosheng and Lu, Wei and Xu, Qiongkai},<br/>
  booktitle={Proceedings of the 24th ACM International on Conference on Information and Knowledge Management},<br/>
  pages={891--900},<br/>
  year={2015},<br/>
  organization={ACM}<br/>
}