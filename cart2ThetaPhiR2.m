function [ r, theta, phi ] = cart2ThetaPhiR2( x, y, z )
%ThetaPhir2cart�F X,Y,Z�������W�n����CTheta�CPhi�Cr�ɕϊ�
%   theta�FXY���ʂɂ�����X�����甽���v���̊p�x�i0�`2�΁j�F���W�A���\�L
%   Phi  �FZ��+��������̊p�x�i0�`�΁j�F���W�A���\�L
%   Z    :���_����_�܂ł̒���
%
%  2015.05.24
% Rieko TSUJI

%�@���_����̈ʒu�x�N�g�����v�Z
r = sqrt(x^2 + y^2 + z^2);
theta = acos(z/r);
% theta=atan2(sqrt(x^2+y^2),z);
phi = atan2(y, x);
if phi < 0
    phi = phi + 2*pi;
end

end