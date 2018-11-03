function dtw_dist = DTW(audio, template)
col_audio = size(audio,2);
col_template = size(template,2);

D=zeros(col_audio+1,col_template+1)+Inf; % cache matrix
D(1,1)=0;

for i = 1:col_audio
    for j = 1:col_template 
        cost = norm(audio(:,i),template(:,j));
        D(i+1,j+1)=cost+min( [D(i,j+1), D(i+1,j), D(i,j)] );
        
    end
end

dtw_dist = D(col_audio+1,col_template+1);

end