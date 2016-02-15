function [f,x,y, seed] = MakeGaussianSfc(N,M,rL,rR,h,clx,cly)
%UNTITLED5 ‚±‚ÌŠÖ?”‚ÌŠT—v‚ð‚±‚±‚É‹L?q
%   ?Ú?×?à–¾‚ð‚±‚±‚É


format long;

x = linspace(-rL/2,rL/2,N); y = linspace(-rR/2,rR/2,M);
[X,Y] = meshgrid(x,y);

% —??”ƒRƒ“ƒgƒ??[ƒ‹
seed = randi(1000000000);
rng(seed);

% ?³‹K•ª•z‚É?]‚¤—??”‚ðƒ?ƒbƒVƒ…‚Ì?”‚¾‚¯”­?¶‚³‚¹‚é(‘ŠŠÖ‚È‚µ?C•½‹Ï0?C•W?€•Î?·h)
Z = h.*randn(M,N); 

% ŽU—?‘Ì‚Ì’†?S‚ª1‚Æ‚È‚éƒKƒEƒVƒAƒ“ƒtƒBƒ‹ƒ^‚ð?ì?¬
F = exp(-(X.^2/(clx^2/2)+Y.^2/(cly^2/2)));

% correlated surface generation including convolution (faltning) and inverse
% Fourier transform and normalizing prefactors
f = 2/sqrt(pi)*rL/N/sqrt(clx)/sqrt(cly)*ifft2(fft2(Z).*fft2(F));
% f1 = 2/sqrt(pi)*rR/M/sqrt(clx)/sqrt(cly)*ifft2(fft2(Z).*fft2(F));


end