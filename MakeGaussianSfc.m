function [f,x,y, seed] = MakeGaussianSfc(N,M,rL,rR,h,clx,cly)
%UNTITLED5 ���̊�?��̊T�v�������ɋL?q
%   ?�?�?�����������


format long;

x = linspace(-rL/2,rL/2,N); y = linspace(-rR/2,rR/2,M);
[X,Y] = meshgrid(x,y);

% �??��R���g�??[��
seed = randi(1000000000);
rng(seed);

% ?��K���z��?]���??����?�b�V����?�������?�������(���ւȂ�?C����0?C�W?���?�h)
Z = h.*randn(M,N); 

% �U�?�̂̒�?S��1�ƂȂ�K�E�V�A���t�B���^��?�?�
F = exp(-(X.^2/(clx^2/2)+Y.^2/(cly^2/2)));

% correlated surface generation including convolution (faltning) and inverse
% Fourier transform and normalizing prefactors
f = 2/sqrt(pi)*rL/N/sqrt(clx)/sqrt(cly)*ifft2(fft2(Z).*fft2(F));
% f1 = 2/sqrt(pi)*rR/M/sqrt(clx)/sqrt(cly)*ifft2(fft2(Z).*fft2(F));


end