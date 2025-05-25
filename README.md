I did this project as part of a Advanced DSP class project. 

# Block-wise PCA Image Compression

This project demonstrates how to use **Principal Component Analysis (PCA)** on **non-overlapping image blocks** for compression and reconstruction. Unlike traditional (global) PCA, this approach captures **local patterns and textures** more effectively by applying PCA at the block level. Also, block-wise PCA can be significantly more efficinet than global PCA in compression!


## How to Use

1. Set the desired block size and number of principal components and see the effect:
   ```matlab
   block_size = 10;
   num_components = 1;  % try values like 1, 5, 10, 30
