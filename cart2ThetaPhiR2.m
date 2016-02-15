function [ r, theta, phi ] = cart2ThetaPhiR2( x, y, z )
%ThetaPhir2cart： X,Y,Z直交座標系から，Theta，Phi，rに変換
%   theta：XY平面におけるX軸から反時計回りの角度（0～2π）：ラジアン表記
%   Phi  ：Z軸+方向からの角度（0～π）：ラジアン表記
%   Z    :原点から点までの長さ
%
%  2015.05.24
% Rieko TSUJI

%　原点からの位置ベクトルを計算
r = sqrt(x^2 + y^2 + z^2);
theta = acos(z/r);
% theta=atan2(sqrt(x^2+y^2),z);
phi = atan2(y, x);
if phi < 0
    phi = phi + 2*pi;
end

end