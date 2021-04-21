# VisibilityGraphMotifs_Encoder

Encode the motifs of the VisibilityGraph into a given motif size. 

Encoders in language Python and Matlab are provided.

#Python #Matlab #Visibility Graph

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
If you use the codes, please star this repository and cite the URL of this repository.

The reference of the visibility graph are provided as follows:
- [From time series to complex networks: The visibility graph](www.pnas.org/cgi/doi/10.1073/pnas.0709247105) The core paper of the Natural Visibility Graph.
- [Horizontal visibility graphs: Exact results for random time series](https://journals.aps.org/pre/abstract/10.1103/PhysRevE.80.046103) The core paper of the Horizontal Visibility Graph.
- [Fast transformation from time series to visibility graphs](https://doi.org/10.1063/1.4927835) An O(NlogN) method, using the "divide and concur" philosophy.
