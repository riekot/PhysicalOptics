function [ P ] = SetDipoleSrc( SelPol, DiplSize, SrcDirTheta_deg, SrcDirPhi_deg )
%SetSrcLocFromSphCoordinate Change spherical coordinate to cartesian coordinate
%   �ڍא����������ɋL�q

% ���s�Δg�`�b�N�̏ꍇ
% DiplSize : r (Size od Dipole[��])
% SrcDirTheta: ��[deg] 0�Ő���x������������@�Ɓ���ŗ����オ��悤�ɕω�
% SrcDirPhi  : ��[deg] x����������0�Ƃ���y��������


SrcDirTheta = Deg2Rad(SrcDirTheta_deg);
SrcDirPhi = Deg2Rad(SrcDirPhi_deg);

if SelPol == 0
    J = [-1.*cos(SrcDirTheta).*cos(SrcDirPhi); -1.*cos(SrcDirTheta).*sin(SrcDirPhi); sin(SrcDirTheta)]; % ���s�Δg
else if SelPol == 1
        J = [-1.*sin(SrcDirPhi); cos(SrcDirPhi); 0];
    end
end
J_l = DiplSize;
P = J.*J_l;

% cos(90���̎�)�ɂ�0����
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
% J = [-1.*cos(i_theta).*cos(i_phi), -1.*cos(i_theta).*sin(i_phi), sin(i_theta)]; % ���s�Δg
% J = [-1.*sin(i_phi), cos(i_phi), 0]; % ����Δg

end