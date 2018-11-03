function dist = Dist(vec_audio, vec_template)

% Finds the euclidian distance between vec_audio and vec_template

%dist = sqrt(sum((vec_audio - vec_template).^2)); 
C = 0;
p = size(vec_template,1);
for k = 1:p
    temp = 0;
    for i = 1:p
        temp = temp + vec_template(i) * vec_audio( abs(i-k) + 1 ) + vec_audio(k); 
    end
    C = C + abs(temp);
end

if(C == 0)
    dist = -10;
else
    dist = log10(C);
end
end