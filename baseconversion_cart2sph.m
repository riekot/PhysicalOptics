function [ c ] = baseconversion_cart2sph( theta, phi, Ax, Ay, Az )
%�@xyz���W�n����r�ƃӍ��W�n�֕ϊ�
%  c = [R, �ƁC��]
%  ------------------------------
%  Ax: x���W�̒l(����)
%  Ay: y���W�̒l(����)
%  Az: z���W�̒l(����)
%  Ar: r���W�̒l(����)
%  A��: �ƍ��W�̒l(����)
%  A��: �Ӎ��W�̒l(����)

% [~, theta, phi] = cart2ThetaPhiR2(Ax, Ay, Az);

T = [sin(theta)*cos(phi) sin(theta)*sin(phi) cos(theta); cos(theta).*cos(phi) cos(theta).*sin(phi) -1*sin(theta); -1*sin(theta)*sin(phi)/abs(sin(theta)) sin(theta)*cos(phi)/abs(sin(theta)) 0];
c = T*[Ax Ay Az].';
end