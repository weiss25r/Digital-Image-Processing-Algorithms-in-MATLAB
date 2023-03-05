%%
% So |unique| and |accumarray| help to count the number of
% occurrences of scalars.  How do we adapt this technique to
% count colors?  Specifically, how do we count how many times each
% unique color occurs in a M-by-N-by-3 truecolor image?
%
% First, we reshape the image so that the columns correspond to
% three color channels.

imshow(rgb)

%%
size(rgb)

%%
rgb_columns = reshape(rgb, [], 3);
size(rgb_columns)

%%
% Then we use our procedure above with |unique| and |accumarray|,
% except that the we add the |'rows'| option to |unique|.

[unique_colors, m, n] = unique(rgb_columns, 'rows'); 
color_counts = accumarray(n, 1);

fprintf('There are %d unique colors in the image.\n', ...
    size(unique_colors, 1))

%%
% Finally, let's find out what color occurs most frequently.

[max_count, idx] = max(color_counts);

fprintf('The color [%d %d %d] occurs %d times.\n', ...
    unique_colors(idx, 1), unique_colors(idx, 2), ...
    unique_colors(idx, 3), max_count)

%%
% And where does this common color occur?

bw = n == idx;
bw = reshape(bw, size(rgb, 1), size(rgb, 2));
imshow(bw)

%%
% _Steve Eddins_
% _Copyright 2008 The MathWorks, Inc._