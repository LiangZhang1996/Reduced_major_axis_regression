import numpy as np
import scipy.stats as st 


def rmaregress(x,y):
    slope, inter, r, p, std = st.linregress(x, y)
    rma_slope = slope/r
    rma_inter = np.mean(y)-np.mean(x)*rma_slope  
    rma_p = p 
    rma_R2 = r**2
    return rma_slope, rma_inter, rma_R2, rma_p 