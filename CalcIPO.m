function [ IPO ] = CalcIPO(  H, plate_location  )
%UNTITLED8 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

% �U���̕\�ʂ̊e�f�ʂ̒P�ʖ@���x�N�g�����v�Z
[plate_n(:,:,1),plate_n(:,:,2),plate_n(:,:,3)] = ...
    surfnorm( plate_location(:,:,1), plate_location(:,:,2), plate_location(:,:,3));
% n�x�N�g���̊m�F
% figure;
% d = 10;
% quiver3(plate_location(1:d:end,1:d:end,1),plate_location(1:d:end,1:d:end,2),...
%     plate_location(1:d:end,1:d:end,3),plate_n(1:d:end,1:d:end,1),plate_n(1:d:end,1:d:end,2),plate_n(1:d:end,1:d:end,3));

% IPO�FIPO = 2n�~H
IPO = 2*cross(plate_n, H, 3);
end

