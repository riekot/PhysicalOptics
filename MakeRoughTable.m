function [ RoughTable ] = MakeRoughTable( h_f, h_l, h_d,  clx_f, clx_l, clx_d )
%MakeRoughTable Make roughness table in every combination of input arg
%   Ú×à–¾‚ğ‚±‚±‚É‹Lq

% rms height‚ğ››‚İ‚Åİ’è‚·‚é
% h_f = 0;
% h_l = 0;
% h_d = 0.5;
[ h, h_t ] = SetPoints( h_f, h_l, h_d );

% correlation length‚ğ››‚İ‚Åİ’è‚·‚é
% clx_f = 1;
% clx_l = 1;
% clx_d = h;
[ clx, clx_t ] = SetPoints( clx_f, clx_l, clx_d );

[temp(:,:,1), temp(:,:,2)]= meshgrid(h,clx);
[a,b,c] = size(temp);
roughlen = a*b;
RoughTable = reshape(temp, [roughlen,2]);

end

