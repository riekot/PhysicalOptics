function [ c ] = baseconversion_cart2sph( theta, phi, Ax, Ay, Az )
%　xyz座標系からrθφ座標系へ変換
%  c = [R, θ，φ]
%  ------------------------------
%  Ax: x座標の値(実数)
%  Ay: y座標の値(実数)
%  Az: z座標の値(実数)
%  Ar: r座標の値(実数)
%  Aθ: θ座標の値(実数)
%  Aφ: φ座標の値(実数)

% [~, theta, phi] = cart2ThetaPhiR2(Ax, Ay, Az);

T = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta); cos(theta).*cos(phi) cos(theta).*sin(phi) -1*sin(theta); -1*sin(theta)*sin(phi)/abs(sin(theta)) sin(theta)*cos(phi)/abs(sin(theta)) 0];
c = T*[Ax Ay Az].';
end