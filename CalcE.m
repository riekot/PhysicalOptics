function [ E_theta_phi, E_each ] = CalcE( theta_length, phi_length, table_theta, table_phi, hasuu_normalized, omega_normalized, I_PO, plate_location, N, M, dS, E0_normalized, mu_normalized, ob_r )
%CalcEscatterdByFarfieldApprox 遠方界，観測点は入射面の散乱界を計算
%   各観測点(距離一定で，観測角が変化)における散乱界を計算


% ベクトルポテンシャルAを求める時の係数
C1 = mu_normalized./(4.*pi);

% ベクトルポテシャルAと距離の積，rA経由でrEを求める．（遠方界近似）
% 各面素のrとベクトルポテンシャルAの積，|rA|を計算
% 係数
r0A = zeros(3,1);
% 各素面，x,y,z成分ごとに計算
ob_n_array = zeros(M,N,3);
ob_n_array(:,:,1) = repmat(ob_n(1), M, N);
ob_n_array(:,:,2) = repmat(ob_n(2), M, N);
ob_n_array(:,:,3) = repmat(ob_n(3), M, N);

C2 = exp(-1i*hasuu_normalized.*ob_n_array)./ob_n_array;
r0A = C1*I_PO.*C2*dS;
clear I_PO C2


% 観測点におけるベクトルポテンシャルAは各面素が作るA(k,1)の和(∫)
r0A_sum = squeeze(sum(sum(r0A, 1),2));


ob = ob_n.';
% 各メッシュの値を保存
dot_Ar = dot(r0A,ob_n_array);
dot_Ar_array = repmat(dot_Ar, 3,1,1);
E_each = -1i*omega_normalized.*(r0A-ob_n_array.*dot_Ar_array);

% 散乱界からの電界E_scatterを求める
E_scatter = squeeze(sum(sum(E_each,1),2));


%----------------------------------------------
% 係数
r0A = zeros(3,1);
% 各素面，x,y,z成分ごとに計算
ob_n_array = zeros(M,N,3);
ob_n_array(:,:,1) = repmat(ob_n(1), M, N);
ob_n_array(:,:,2) = repmat(ob_n(2), M, N);
ob_n_array(:,:,3) = repmat(ob_n(3), M, N);

C2 = exp(1i*hasuu_normalized* dot(ob_n_array, plate_location, 3));
r0A_x = C1*I_PO(:,:,1).*C2*dS;
r0A_y = C1*I_PO(:,:,2).*C2*dS;
r0A_z = C1*I_PO(:,:,3).*C2*dS;
clear ob_narray I_PO C2
% 観測点におけるベクトルポテンシャルAは各面素が作るA(k,1)の和(∫)
r0A(1,1) = sum(sum(r0A_x));
r0A(2,1) = sum(sum(r0A_y));
r0A(3,1) = sum(sum(r0A_z));

% 散乱界からの電界E_scatterを求める
E_scatter = -1i*omega_normalized*r0A;
% 各メッシュの値を保存
E_each(:,:,1) = -1i*omega_normalized*r0A_x;
E_each(:,:,2) = -1i*omega_normalized*r0A_y;
E_each(:,:,3) = -1i*omega_normalized*r0A_z;


%----------------------------------------------
% % 係数
% r0A = zeros(3,1);
% % 各素面，x,y,z成分ごとに計算
% ob_n_array = zeros(M,N,3);
% ob_n_array(:,:,1) = repmat(ob_n(1), M, N);
% ob_n_array(:,:,2) = repmat(ob_n(2), M, N);
% ob_n_array(:,:,3) = repmat(ob_n(3), M, N);
% 
% C2 = exp(1i*hasuu_normalized* dot(ob_n_array, plate_location, 3));
% r0A_x = C1*I_PO(:,:,1).*C2*dS;
% r0A_y = C1*I_PO(:,:,2).*C2*dS;
% r0A_z = C1*I_PO(:,:,3).*C2*dS;
% clear ob_narray I_PO C2
% % 観測点におけるベクトルポテンシャルAは各面素が作るA(k,1)の和(∫)
% r0A(1,1) = sum(sum(r0A_x));
% r0A(2,1) = sum(sum(r0A_y));
% r0A(3,1) = sum(sum(r0A_z));
% 
% % 散乱界からの電界E_scatterを求める
% E_scatter = -1i*omega_normalized*r0A;
% % 各メッシュの値を保存
% E_each(:,:,1) = -1i*omega_normalized*r0A_x;
% E_each(:,:,2) = -1i*omega_normalized*r0A_y;
% E_each(:,:,3) = -1i*omega_normalized*r0A_z;


% それぞれの観測点に対する電界を保存(rE[V/λ]を保存していることになる)
E_theta_phi(i_theta, i_phi,:) = squeeze(E_scatter);



end