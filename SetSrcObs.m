function [ SrcLocTable, ObsLocTable, PTable ] = SetSrcObs( SrcLocDist_setting,SrcLocTheta_setting,SrcLocPhi_setting,...
    ObsLocDist_setting,ObsLocTheta_setting,ObsLocPhi_setting,SelPol,SrcDirTheta_setting,SrcDirPhi_setting  )
%UNTITLED2 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

%% �g���̐ݒ��ǂݍ���
SrcLocDist = SrcLocDist_setting; % r:Distance from origin[��]
SrcLocTheta = SrcLocTheta_setting;% ��[degree]
SrcLocPhi = SrcLocPhi_setting; % ��[degree]
% Observation Location
% Input:Spherical Coordinate
ObsLocDist = ObsLocDist_setting; % r:Distance from origin[��]
ObsLocTheta = ObsLocTheta_setting; % ��[degree]
ObsLocPhi = ObsLocPhi_setting; % ��[degree]
% Source Type: Infinitesimal Dipole
% 0: ���s�Δg�`�b�N�C1:����Δg�`�b�N
% SelPol = 1;
DiplSize = 1/20;
SrcDirTheta = SrcDirTheta_setting; % ��[degree]
SrcDirPhi = SrcDirPhi_setting; % ��[degree]

%% �����̃V�~�����[�V���������쐬
% malloc
SrcLocTable = zeros(length(SrcLocDist),3);
ObsLocTable = zeros(length(ObsLocDist),3);
PTable = zeros(length(SrcDirTheta),3);

for i_loc = 1:size(SrcLocDist,2)
    SrcLoc_xyz = SetLocFromSphCoordinate(SrcLocDist(i_loc), SrcLocTheta(i_loc), SrcLocPhi(i_loc));
    SrcLocTable(i_loc,:) = SrcLoc_xyz;
    ObsLoc_xyz = SetLocFromSphCoordinate(ObsLocDist(i_loc), ObsLocTheta(i_loc), ObsLocPhi(i_loc));
    ObsLocTable(i_loc,:) = ObsLoc_xyz;
    P = SetDipoleSrc( SelPol, DiplSize, SrcDirTheta(i_loc), SrcDirPhi(i_loc) );
    PTable(i_loc,:) = P;
end

end

