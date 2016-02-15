function [ E_theta_phi ] = Main_PO( cfname, BUN, plate_location, N, M, dS, lambda, k, Omega, Mu, Epsi, SrcLoc_xyz, ObsLoc_xyz, P, ...
    fc, Rms, Cor, Size,i_posi,i_monte)
%UNTITLED13 この関数の概要をここに記述
%   散乱体を分割して計算

% メモリ節約のためグローバル変数
global plate_location_b;

% 分割数の設定とそれに応じた変数のメモリ確保
M_b = double(uint64(M./BUN));
M_bl = M - (BUN-1)*M_b;
N_b = N;

% 電界を保存するためのメモリ確保
E_theta_phi_temp = zeros(BUN, 3);

% ---------------------------------------------------------------------- %
% 最後の分割の直前までを計算
if BUN ~= 1
    for i_bunkatsu = 1:BUN-1
        % 値代入
        plate_location_b = plate_location(((i_bunkatsu-1)*M_b)+1:i_bunkatsu*M_b, :, :);
        % 計算
        E_theta_phi_temp(i_bunkatsu, :) = Calc_H_IPO_E( cfname, i_bunkatsu, ...
            plate_location_b, N_b, M_b, dS, SrcLoc_xyz, ObsLoc_xyz, P, k, Omega, Epsi, Mu );
    end
end

% 最後の分割の分を計算
i_bunkatsu = BUN;
% 値代入
plate_location_b = plate_location(((i_bunkatsu-1)*M_b)+1:M, :, :);
% 計算
E_theta_phi_temp(i_bunkatsu, :) = Calc_H_IPO_E( cfname, i_bunkatsu, ...
    plate_location_b, N_b, M_bl, dS, SrcLoc_xyz, ObsLoc_xyz, P, k, Omega, Epsi, Mu );
% ---------------------------------------------------------------------- %

% 分割計算していたものを結合(=加算)
E_theta_phi = sum(E_theta_phi_temp,1);

end

