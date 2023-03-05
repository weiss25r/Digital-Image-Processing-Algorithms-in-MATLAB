function countColors(rgb)

    rgb_columns = reshape(rgb, [], 3);
    size(rgb_columns)
    
    
    % Then we use our procedure above with |unique| and |accumarray|,
    % except that the we add the |'rows'| option to |unique|.
    
    [unique_colors, m, n] = unique(rgb_columns, 'rows'); 
    
    fprintf('There are %d unique colors in the image.\n', ...
        size(unique_colors, 1))

end