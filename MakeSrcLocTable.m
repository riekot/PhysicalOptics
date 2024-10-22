function [ RoughTable ] = MakeSrcLocTable( i_theta_f, i_theta_l, i_theta_d,  i_phi_f, i_phi_l, i_phi_d )
%MakeRoughTable Make roughness table in every combination of input arg
%   詳細説明をここに記述

%波源の位置と方向と範囲を設定
% 波源θの範囲と刻み幅を設定
i_theta_f = theta_Params(i_posi);
i_theta_l = theta_Params(i_posi);
i_theta_d = 1;
[ i_theta, i_theta_t ] = SetPoints( Deg2Rad(i_theta_f), Deg2Rad(i_theta_l), Deg2Rad(i_theta_d) );
%波源 Φの範囲と刻み幅を設定
i_phi_f = 0;
i_phi_l = 0;
i_phi_d = 1;
[ i_phi, i_phi_t ] = SetPoints( Deg2Rad(i_phi_f), Deg2Rad(i_phi_l), Deg2Rad(i_phi_d) );

% 波源rの範囲と刻み幅を設定（【注意！】平面波を仮定の時は，必ず1になるように【注意！】)
i_r_f = InciDist_Params(i_posi);
i_r_l = InciDist_Params(i_posi);
i_r_d = 100;
[ i_r, i_r_t ] = SetPoints( i_r_f, i_r_l, i_r_d );

%% xyz座標で指定

end