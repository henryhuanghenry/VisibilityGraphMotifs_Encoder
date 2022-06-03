# VisibilityGraphMotifs_Encoder

Encode the motifs of the VisibilityGraph into a given motif size. 

Encoders in language Python and Matlab are provided.

#Python #Matlab #Visibility Graph

Chinese:

可视图的编码器。可以将所给的时间序列翻译成可视图。提供python和matlab两种语言。

文件的注释为英文。关于可视图和编码的算法请参考本文的最末的参考文献。

如果有任何问题，可以提出issues。欢迎使用本代码进行学术研究，别忘了引用本仓库的链接，随手给个star也行哦！:)

---

Our paper entitled ["Natural visibility encoding for time series and its application in stock trend prediction"](https://doi.org/10.1016/j.knosys.2021.107478) has been published 😃. 

If you are interested in our work and having difficulties in accessing the article, please contact me.

---
## Contents
This repository contains the following files:
### NVGcode.m
- In Matlab.
- Encodes the time series (sequence) into the natural visibility graph series. (For any provided motif size.)
- Using the maximum slope idea, a little bit faster than the direct processing. Still O(n^2).

### HVGcode.m
- In Matlab.
- Encodes the time series (sequence) into the horizontal visibility graph series. (For any provided motif size.)
- Using the maximum slope idea, a little bit faster than the direct processing. Still O(n^2).

### NVGcode_DC.m
- In Matlab.
- Encodes the time series (sequence) into the natural visibility graph series. (For any provided motif size.)
- Using the "divide and concur" idea, O(NlogN). Details refer to [Fast transformation from time series to visibility graphs](https://doi.org/10.1063/1.4927835).

### NVGcode_DC.py
- In python.
- Encodes the time series (sequence) into the natural visibility graph series. (For any provided motif size.)
- Using the "divide and concur" idea, O(NlogN). Details refer to [Fast transformation from time series to visibility graphs](https://doi.org/10.1063/1.4927835).

## Reference
If you use the codes, **Please star this repository and cite the URL of this repository.** Please~ :)

You could also cite our paper using:
```bibtex
@article{HUANG2021107478,
title = {Natural visibility encoding for time series and its application in stock trend prediction},
journal = {Knowledge-Based Systems},
volume = {232},
pages = {107478},
year = {2021},
issn = {0950-7051},
doi = {https://doi.org/10.1016/j.knosys.2021.107478},
author = {Yusheng Huang and Xiaoyan Mao and Yong Deng},
}
```

If you have any problems, please do not hesitate to contact me.

The reference of the visibility graph are provided as follows:
- [From time series to complex networks: The visibility graph](www.pnas.org/cgi/doi/10.1073/pnas.0709247105) The core paper of the Natural Visibility Graph.
- [Horizontal visibility graphs: Exact results for random time series](https://journals.aps.org/pre/abstract/10.1103/PhysRevE.80.046103) The core paper of the Horizontal Visibility Graph.
- [Fast transformation from time series to visibility graphs](https://doi.org/10.1063/1.4927835) An O(NlogN) method, using the "divide and concur" philosophy.
