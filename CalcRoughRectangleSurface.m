function [ N, M, dS, plate_location, seed ] = CalcRoughRectangleSurface( x_length, y_length, d_mesh_x, d_mesh_y, ac_type, h, clx, cly )
%CalcRoughSurfaceRectVectorsAndUnitVectorsByGaussianDist 粗面作成
%   

% 矩形板のX軸，Y軸の各辺に対して，所望のメッシュサイズに対応するメッシュ数を計算（戻り値：整数型）
N = CalcNumOfMeshByLengthAndMeshSize(x_length, d_mesh_x);
M = CalcNumOfMeshByLengthAndMeshSize(y_length, d_mesh_y);

% 面素の大きさ
dS = d_mesh_x.*d_mesh_y;

% ラフネスを持つ表面を計算
if ac_type == 0
    [f,x,y,seed] = MakeGaussianSfc(double(N), double(M), x_length, y_length, h, clx, cly);
else if ac_type == 1
        [f,x,y,seed] = MakeExpSfc(double(N), double(M), x_length, y_length, h, clx, cly);
    end
end

% メモリ確保
% plate_location = zeros(M,N,3);

% 散乱体の各点をplate_locationに格納(散乱体の各素面の座標をカーテシアン座標系で設定)
[plate_location(:,:,1), plate_location(:,:,2), plate_location(:,:,3)]= meshgrid(x, y, 0);
plate_location(:,:,3) = f;

% save('Surface/test.mat','plate_location', '-v7.3');
end
