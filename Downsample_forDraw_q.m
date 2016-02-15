function [ output_args ] = Downsample_forDraw_q( plate_location, plate_n, d, size )
%UNTITLED5 この関数の概要をここに記述
%   描写のために行列をスパースにする


% d間隔で間引く
% d = 100000; 

% 理解しやすい形に変形([]*3行列)
Lr = reshape(plate_location, [], 3);
Nr = reshape(plate_n, [], 3);

% 間引く
Lrs = Lr(1:d:end,:); % d間隔で間引く
Nrs = Nr(1:d:end,:); % d間隔で間引く

figure;
% quiver3(Lrs(:,1), Lrs(:,2), Lrs(:,3), Nrs(:,1), Nrs(:,2), Nrs(:,3), size);%, 'bo', 'filled');
surf(Lrs(:,1), Lrs(:,2), Lrs(:,3));%, 'bo', 'filled');
xlabel('x');
ylabel('y');
end

