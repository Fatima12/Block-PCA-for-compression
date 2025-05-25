function img = blocks_to_image(block_matrix, num_block_rows, num_block_cols, block_size, height, width)
    
img = zeros(height, width);
    block_idx = 1;
    
    for i = 1:block_size:(num_block_rows * block_size)
        for j = 1:block_size:(num_block_cols * block_size)
            block = reshape(block_matrix(:, block_idx), block_size, block_size);
            img(i:i+block_size-1, j:j+block_size-1) = block;
            block_idx = block_idx + 1;
        end
    end
end
