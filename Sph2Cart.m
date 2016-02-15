function [ vector ] = Sph2Cart(r, theta, phi )
%ThetaPhir2cart Theta�CPhi�Cr��X,Y,Z�������W�n�ɕϊ�
%   r     :���_����_�܂ł̒���
%   theta�FXY���ʂɂ�����X�����甽���v���̊p�x�i0�`2��)�F���W�A���\�L
%   Phi  �FZ��+��������̊p�x�i0�`�΁j                  �F���W�A���\�L
%  2015.05.24
% Rieko TSUJI

%�@���_����̈ʒu�x�N�g�����v�Z
x = r*sin(theta).*cos(phi);
y = r*sin(theta).*sin(phi);
z = r*cos(theta);

% cos(90���̎�)�ɂ�0����
% if theta == pi/2 || theta == pi*3/2
%     z = 0;
% end
% if phi == pi/2 || phi == pi*3/2
%     x = 0;
% end

vector = [x;y;z];

end