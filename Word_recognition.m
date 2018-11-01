[audio,rate1] = audioread('right.wav');
B = [1 -0.96];
if(size(audio,2)==1)
    audio = filter(B,1,audio);
else
    audio = filter(B,1,audio(:,2));
end
audio = audio ./ max(audio);
lpc_audio = LPC_extraction(audio,rate1);


folders = {'forward', 'backward', 'left', 'right'};
i = 1;
inbuilt = zeros(1,4);
func = zeros(1,4);
for i = 1:4
    %path = strcat('.\Dataset\',char(folders(i)),'\');
    %files = dir(strcat(path,'*.wav'));
    if(i == 1)
        load('lpc_forward.mat');
    elseif(i == 2)
        load('lpc_backward.mat')
    elseif(i == 3)
        load('lpc_left.mat')
    else
        load('lpc_right.mat')
    end
    lpc_ = centroid;
    index = 10;
    dist = zeros(1,index);
    for j = 1:index
        %[template,rate2] = audioread(strcat(path,files(j).name))
        %template = filter(B,1,template);
        %lpc_template = LPC_extraction(template, rate2);
        lpc_template = lpc_(:,:,j);
        dist(j) = DTW(lpc_audio,lpc_template);    
    end
    dist = sort(dist);
    func(i) = (dist(1) + dist(2) + dist(3) + dist(4))/4;
end
folders(func == min(func))
