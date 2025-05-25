clear all
clc
close all

%% Parameters
block_size = 10;            % Block size (B x B)
num_components = 1;         % Number of principal components to use for reconstruction

%% Load and preprocess image
load mandrill.mat;
gray_image = mat2gray(X);   % Convert to grayscale in [0, 1]
[height, width] = size(gray_image);
subplot(121); imshow(gray_image); title('Original Image');

%% Step 1: Divide image into blocks and vectorize each block
[block_vectors, block_rows, block_cols] = image_to_blocks(gray_image, block_size);

%% Step 2: PCA on the block data
% Subtract mean
mean_block = mean(block_vectors, 2);
centered_blocks = block_vectors - mean_block;

% Covariance and eigendecomposition
cov_matrix = cov(centered_blocks');
[eig_vecs, eig_vals] = eig(cov_matrix);
[eigenvalues_sorted, sort_idx] = sort(diag(eig_vals), 'descend');
eig_vecs = eig_vecs(:, sort_idx);

% Project to principal components
projected_data = eig_vecs' * centered_blocks;

%% Step 3: Reconstruct using top principal components
reconstruction = eig_vecs(:, 1:num_components) * projected_data(1:num_components, :);
reconstruction = reconstruction + mean_block;

%% Step 4: Reshape vectorized blocks back into image
reconstructed_image = blocks_to_image(reconstruction, block_rows, block_cols, block_size, height, width);

%% Step 5: Display result
subplot(122); imshow(reconstructed_image, []);
title(sprintf('Reconstructed Image with %d PCs per Block', num_components));

%%

