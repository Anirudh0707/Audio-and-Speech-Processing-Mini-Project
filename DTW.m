function dtw_dist = DTW(lpc_audio, lpc_template)
col_audio = size(lpc_audio,2);
col_template = size(lpc_template,2);

D=zeros(col_audio+1,col_template+1)+Inf; % cache matrix
D(1,1)=0;

for i = 1:col_audio
    for j = 1:col_template 
        cost=Euclid(lpc_audio(:,i),lpc_template(:,j));
        D(i+1,j+1)=cost+min( [D(i,j+1), D(i+1,j), D(i,j)] );
        
    end
end

dtw_dist = D(col_audio+1,col_template+1);

end