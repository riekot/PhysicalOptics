function [ output_args ] = Downsample_forDraw_q( plate_location, plate_n, d, size )
%UNTITLED5 ���̊֐��̊T�v�������ɋL�q
%   �`�ʂ̂��߂ɍs����X�p�[�X�ɂ���


% d�Ԋu�ŊԈ���
% d = 100000; 

% �������₷���`�ɕό`([]*3�s��)
Lr = reshape(plate_location, [], 3);
Nr = reshape(plate_n, [], 3);

% �Ԉ���
Lrs = Lr(1:d:end,:); % d�Ԋu�ŊԈ���
Nrs = Nr(1:d:end,:); % d�Ԋu�ŊԈ���

figure;
% quiver3(Lrs(:,1), Lrs(:,2), Lrs(:,3), Nrs(:,1), Nrs(:,2), Nrs(:,3), size);%, 'bo', 'filled');
surf(Lrs(:,1), Lrs(:,2), Lrs(:,3));%, 'bo', 'filled');
xlabel('x');
ylabel('y');
end

