# MOMPCA
This repository contains the codes for MOMPCA. A preprint of the corresponding paper, is available at,

 D. Paul, S. Chakraborty, S. Das. Robust Principal Component Analysis: A Median of Means Approach. arXiv preprint 	arXiv:2011.06461. https://arxiv.org/abs/2011.06461.
 
The code is written in R programming language. The arguments for MoMPCA function is as follows:

INPUT:
1. X: the n*p matrix, whose rows denote the data points.
2. L: No. of partitions of the data.
3. d: The number of principal components required.
4. eta: The learning rate in the projected gradient descent.
5. tmax: The maximum number of iterations.
6. verbose: If 1 prints the iteration numbers. If 0, no printing. default=0.

OUTPUT:
1. V: The p*d matrix, whose columns contain the first d principal components.
2. mu: The componentwise median of the data.
3. Y: The n*d matrix which is the low-dimensioanl representation of the data.

