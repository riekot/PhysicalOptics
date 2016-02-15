function [ IPO ] = CalcIPO(  H, plate_location  )
%UNTITLED8 この関数の概要をここに記述
%   詳細説明をここに記述

% 散乱体表面の各素面の単位法線ベクトルを計算
[plate_n(:,:,1),plate_n(:,:,2),plate_n(:,:,3)] = ...
    surfnorm( plate_location(:,:,1), plate_location(:,:,2), plate_location(:,:,3));
% nベクトルの確認
% figure;
% d = 10;
% quiver3(plate_location(1:d:end,1:d:end,1),plate_location(1:d:end,1:d:end,2),...
%     plate_location(1:d:end,1:d:end,3),plate_n(1:d:end,1:d:end,1),plate_n(1:d:end,1:d:end,2),plate_n(1:d:end,1:d:end,3));

% IPO：IPO = 2n×H
IPO = 2*cross(plate_n, H, 3);
end

