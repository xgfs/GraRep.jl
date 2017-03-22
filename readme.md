# GraRep
Re-implementation of [GraRep](https://github.com/ShelsonCao/GraRep)

# Notice
1. You do not need impose L2 norm for embeddings again, or accuracy will be hurt. Actually normlization has been already done;
2. GraRep is suitable for undirected graphs. If you want to apply it for the directed graphs, please use matrix addition between adjacency matrix and its transpose to replace original adjaceny matrix before you run GraRep.

# Lisence
This code follows the MIT Lisence.

# Cite
If you want to use this code, please kindly cite the original paper

@inproceedings{cao2015grarep,<br/>
  title={Grarep: Learning graph representations with global structural information},<br/>
  author={Cao, Shaosheng and Lu, Wei and Xu, Qiongkai},<br/>
  booktitle={Proceedings of the 24th ACM International on Conference on Information and Knowledge Management},<br/>
  pages={891--900},<br/>
  year={2015},<br/>
  organization={ACM}<br/>
}