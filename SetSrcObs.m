function [ SrcLocTable, ObsLocTable, PTable ] = SetSrcObs( SrcLocDist_setting,SrcLocTheta_setting,SrcLocPhi_setting,...
    ObsLocDist_setting,ObsLocTheta_setting,ObsLocPhi_setting,SelPol,SrcDirTheta_setting,SrcDirPhi_setting  )
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述

%% 波源の設定を読み込む
SrcLocDist = SrcLocDist_setting; % r:Distance from origin[λ]
SrcLocTheta = SrcLocTheta_setting;% θ[degree]
SrcLocPhi = SrcLocPhi_setting; % Φ[degree]
% Observation Location
% Input:Spherical Coordinate
ObsLocDist = ObsLocDist_setting; % r:Distance from origin[λ]
ObsLocTheta = ObsLocTheta_setting; % θ[degree]
ObsLocPhi = ObsLocPhi_setting; % Φ[degree]
% Source Type: Infinitesimal Dipole
% 0: 平行偏波チック，1:直交偏波チック
% SelPol = 1;
DiplSize = 1/20;
SrcDirTheta = SrcDirTheta_setting; % θ[degree]
SrcDirPhi = SrcDirPhi_setting; % Φ[degree]

%% 複数のシミュレーション条件作成
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

