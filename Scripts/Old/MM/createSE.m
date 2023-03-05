function out = createSE()
    AAA = strel('line', 30, 90);;
    AAA.Neighborhood
    image(AAA.Neighborhood); colormap(gray(2));
end