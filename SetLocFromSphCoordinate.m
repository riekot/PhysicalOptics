function [ Loc_xyz ] = SetLocFromSphCoordinate( LocDist, LocTheta, LocPhi )
%SetSrcLocFromSphCoordinate Change spherical coordinate to cartesian coordinate
%   �ڍא����������ɋL�q

% LocDist : r (Distance from origin[��])
% LocTheta: ��[rad]
% LocPhi  : ��[rad]


% Degree to radian
LocTheta_rad = Deg2Rad(LocTheta); % ��[rad]
LocPhi_rad = Deg2Rad(LocPhi); % ��[rad]

Loc_xyz = Sph2Cart(LocDist, LocTheta_rad, LocPhi_rad);

end

