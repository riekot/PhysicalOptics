function [f,x,y,seed] = MakeExpSfc(N,M,rL,rR,h,clx,cly)
%UNTITLED5 この関数の概要をここに記述
%   詳細説明をここに
%

format long;

x = linspace(-rL/2,rL/2,N); y = linspace(-rR/2,rR/2,M);
[X,Y] = meshgrid(x,y);

% 乱数コントロール
seed = randi(1000000000);
rng(seed);

% randn(2,2)
% save('seed', 'seed');
Z = h.*randn(N,N); % uncorrelated Gaussian random rough surface distribution
% with rms height h

% Exp filter
F = exp(-(abs(X)/(clx/2)+abs(Y)/(cly/2)));

% correlation of surface including convolution (faltung), inverse
% Fourier transform and normalizing prefactors
f = 2*rL/N/sqrt(clx*cly)*ifft2(fft2(Z).*fft2(F));
% f1 = 2*rR/M/sqrt(clx*cly)*ifft2(fft2(Z).*fft2(F));


end