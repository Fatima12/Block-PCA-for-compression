function [block_matrix, num_block_rows, num_block_cols] = image_to_blocks(img, block_size)

    [h, w] = size(img);
    num_block_rows = floor(h / block_size);
    num_block_cols = floor(w / block_size);
    
    block_matrix = zeros(block_size^2, num_block_rows * num_block_cols);
    block_idx = 1;
    
    for i = 1:block_size:(num_block_rows*block_size)
        for j = 1:block_size:(num_block_cols*block_size)
            block = img(i:i+block_size-1, j:j+block_size-1);
            block_matrix(:, block_idx) = block(:);
            block_idx = block_idx + 1;
        end
    end
end
