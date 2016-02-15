function [ H ] = CalcH( plate_location_b, Inci, P, N, M, k)
%CalcMagFieldOfInfDipole この関数の概要をここに記述
%   詳細説明をここに記述

% 行列計算のために波源の位置ベクトルを散乱体のメッシュ分だけ用意する
Inci3 = zeros(M, N, 3);
Inci3(:,:,1) = repmat(Inci(1), [M, N, 1]);
Inci3(:,:,2) = repmat(Inci(2), [M, N, 1]);
Inci3(:,:,3) = repmat(Inci(3), [M, N, 1]);
% 行列計算のために微小ダイポールの電流を散乱体のメッシュ分だけ用意する
P3 = zeros(M, N, 3);
P3(:,:,1) = repmat(P(1), [M, N, 1]);
P3(:,:,2) = repmat(P(2), [M, N, 1]);
P3(:,:,3) = repmat(P(3), [M, N, 1]);

% 波源から散乱体の各面素までのベクトルを計算
R = plate_location_b - Inci3;
clear Inci3
%　Rベクトル描写
% d =10;
% figure; quiver3(Inci3(1:d:end,1:10:end,1), Inci3(1:d:end,1:d:end,2), ...
%     Inci3(1:d:end,1:d:end,3), R(1:d:end,1:d:end,1), R(1:d:end,1:d:end,2), R(1:d:end,1:d:end,3), 'ro');

% 単位ベクトル計算
R_norm = sqrt( R(:,:,1).^2 + R(:,:,2).^2 + R(:,:,3).^2 );
R_unit = R./repmat(R_norm, [1, 1, 3]);
clear R;
% % 単位ベクトル大きさ確認
% R_unit_norm = sqrt( R_unit(:,:,1).^2 + R_unit(:,:,2).^2 + R_unit(:,:,3).^2 );
% figure;
% histogram(R_unit_norm);

% 微小ダイポールが作る磁界を計算するための準備
C2_pre = 1i.*k + (1./R_norm);
C2 = repmat(C2_pre, [1, 1, 3]);
clear C2_pre

C3_pre  = exp(-1i.*k.*R_norm)./(4*pi.*R_norm);
C3 = repmat(C3_pre, [1, 1, 3]);
clear C3_pre R_norm

% 磁界を計算
H = cross(P3, R_unit, 3).*C2.*C3;

end

