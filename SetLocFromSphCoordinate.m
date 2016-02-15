function [ Loc_xyz ] = SetLocFromSphCoordinate( LocDist, LocTheta, LocPhi )
%SetSrcLocFromSphCoordinate Change spherical coordinate to cartesian coordinate
%   Ú×à–¾‚ğ‚±‚±‚É‹Lq

% LocDist : r (Distance from origin[ƒÉ])
% LocTheta: ƒÆ[rad]
% LocPhi  : ƒ³[rad]


% Degree to radian
LocTheta_rad = Deg2Rad(LocTheta); % ƒÆ[rad]
LocPhi_rad = Deg2Rad(LocPhi); % ƒ³[rad]

Loc_xyz = Sph2Cart(LocDist, LocTheta_rad, LocPhi_rad);

end

