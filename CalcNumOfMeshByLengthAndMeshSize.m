function [ N ] = CalcNumOfMeshByLengthAndMeshSize( length, mesh_size )
%CalcNumOfMeshByLengthAndMeshSize: 辺の長さとメッシュサイズから，辺のメッシュ数を返す

%   x_length   : length of scatter of X
%   x_mesh_size: length of mesh of X
%   N          : Number of mesh in X 

% 矩形板のX軸，Y軸の各辺に対して，所望のメッシュ数に対して必要な座標の設定数を計算，整数型で保持
N = uint64(length./mesh_size)+1;
end

