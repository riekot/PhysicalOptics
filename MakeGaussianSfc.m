function [f,x,y, seed] = MakeGaussianSfc(N,M,rL,rR,h,clx,cly)
%UNTITLED5 この関?狽ﾌ概要をここに記?q
%   ?ﾚ?ﾗ?燒ｾをここに


format long;

x = linspace(-rL/2,rL/2,N); y = linspace(-rR/2,rR/2,M);
[X,Y] = meshgrid(x,y);

% �??買Rント�??[ル
seed = randi(1000000000);
rng(seed);

% ?ｳ規分布に?]う�??狽��?ッシュの?狽ｾけ発?ｶさせる(相関なし?C平均0?C標?�偏?ｷh)
Z = h.*randn(M,N); 

% 散�?体の中?Sが1となるガウシアンフィルタを?�?ｬ
F = exp(-(X.^2/(clx^2/2)+Y.^2/(cly^2/2)));

% correlated surface generation including convolution (faltning) and inverse
% Fourier transform and normalizing prefactors
f = 2/sqrt(pi)*rL/N/sqrt(clx)/sqrt(cly)*ifft2(fft2(Z).*fft2(F));
% f1 = 2/sqrt(pi)*rR/M/sqrt(clx)/sqrt(cly)*ifft2(fft2(Z).*fft2(F));


end