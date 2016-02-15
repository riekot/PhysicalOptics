function [ vector ] = Sph2Cart(r, theta, phi )
%ThetaPhir2cart Theta，Phi，rをX,Y,Z直交座標系に変換
%   r     :原点から点までの長さ
%   theta：XY平面におけるX軸から反時計回りの角度（0～2π)：ラジアン表記
%   Phi  ：Z軸+方向からの角度（0～π）                  ：ラジアン表記
%  2015.05.24
% Rieko TSUJI

%　原点からの位置ベクトルを計算
x = r*sin(theta).*cos(phi);
y = r*sin(theta).*sin(phi);
z = r*cos(theta);

% cos(90°の時)には0を代入
% if theta == pi/2 || theta == pi*3/2
%     z = 0;
% end
% if phi == pi/2 || phi == pi*3/2
%     x = 0;
% end

vector = [x;y;z];

end