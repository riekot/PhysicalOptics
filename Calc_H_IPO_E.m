function [ E_theta_phi ] = Calc_H_IPO_E( cfname, i_bunkatsu,...
    plate_location_b, N_b, M_b, dS,SrcLoc, ObsLoc,P, k,w, Epsi, Mu )

%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述

ccfname = strcat( cfname, '_bnkt', num2str(i_bunkatsu), '.mat');
%% 微小ダイポールが散乱体表面に作る磁界を計算
global H
[ H ] = CalcH( plate_location_b, SrcLoc, P, N_b, M_b, k );
% save( strcat('ResultsD/H_', ccfname), 'H', '-v7.3');


%%  PO電流を計算
global IPO
IPO = CalcIPO( H, plate_location_b );
clear H;
% save( strcat('ResultsD/IPO_', ccfname), 'IPO', '-v7.3');


%% 散乱界Escatterを厳密に正しい方法で計算
global E_each
% [E_theta_phi, E_each] = CalcFarApproxE( IPO, plate_location_b, ObsLoc, N_b, M_b, dS,k,w,Mu);

% near field
[ E_theta_phi, E_each] = CalcExactE( k, w, IPO, ObsLoc, plate_location_b, N_b, M_b, dS, Epsi ); % CalcEscatterByExactSolution_OnePoint_SavingMemory function clear 'I_PO'
% save( strcat('ResultsD/Eeach_', ccfname), 'E_theta_phi','E_each', '-v7.3');

end