function [ P ] = SetDipoleSrc( SelPol, DiplSize, SrcDirTheta_deg, SrcDirPhi_deg )
%SetSrcLocFromSphCoordinate Change spherical coordinate to cartesian coordinate
%   詳細説明をここに記述

% 平行偏波チックの場合
% DiplSize : r (Size od Dipole[λ])
% SrcDirTheta: θ[deg] 0で水平x軸増える方向　θ→大で立ち上がるように変化
% SrcDirPhi  : Φ[deg] x軸負方向を0としてy軸負周り


SrcDirTheta = Deg2Rad(SrcDirTheta_deg);
SrcDirPhi = Deg2Rad(SrcDirPhi_deg);

if SelPol == 0
    J = [-1.*cos(SrcDirTheta).*cos(SrcDirPhi); -1.*cos(SrcDirTheta).*sin(SrcDirPhi); sin(SrcDirTheta)]; % 平行偏波
else if SelPol == 1
        J = [-1.*sin(SrcDirPhi); cos(SrcDirPhi); 0];
    end
end
J_l = DiplSize;
P = J.*J_l;

% cos(90°の時)には0を代入
if SrcDirTheta_deg == pi/2 || SrcDirTheta_deg == pi*3/2
    if SelPol == 0
        P = [0;0;0];
    end
end

if SrcDirPhi_deg == pi/2 || SrcDirPhi_deg == pi*3/2
    if  SelPol == 0
        P(1,1) = 0;
        P(2,1) = 0;
    else if SelPol == 1
            P(2,1) = 0;
        end
    end
end

% FYI
% J = [-1.*cos(i_theta).*cos(i_phi), -1.*cos(i_theta).*sin(i_phi), sin(i_theta)]; % 平行偏波
% J = [-1.*sin(i_phi), cos(i_phi), 0]; % 直交偏波

end