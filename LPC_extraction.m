function lpc_coeff = LPC_extraction(audio,rate)
    duration = length(audio);
    p = 8;
    audio = audio/max(audio);
    lpc_coeff=[];
    for i = 1 : round(0.015*rate) : duration
        if(duration - i) >= round(0.045*rate)
          x = audio(i : i + round(0.045*rate));
        else
          x = audio(i : duration);   
          y = [x; (zeros(1, 0.045*rate - length(x)+1))'];
          x=y;
        end
        x = x.*blackman(length(x));
        temp = lpc(x,p);
        lpc_coeff = [lpc_coeff;temp];
    end

    lpc_coeff(isnan(lpc_coeff)) = 0;
    lpc_coeff = lpc_coeff';
    lpc_coeff = lpc_coeff(2:end,:);
end