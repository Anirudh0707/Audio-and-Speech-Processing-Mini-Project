function dist = Euclid(vec_audio, vec_template)

% Finds the euclidian distance between vec_audio and vec_template

dist = sqrt(sum((vec_audio - vec_template).^2)); 

end