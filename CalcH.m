function [ H ] = CalcH( plate_location_b, Inci, P, N, M, k)
%CalcMagFieldOfInfDipole ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

% �s��v�Z�̂��߂ɔg���̈ʒu�x�N�g�����U���̂̃��b�V���������p�ӂ���
Inci3 = zeros(M, N, 3);
Inci3(:,:,1) = repmat(Inci(1), [M, N, 1]);
Inci3(:,:,2) = repmat(Inci(2), [M, N, 1]);
Inci3(:,:,3) = repmat(Inci(3), [M, N, 1]);
% �s��v�Z�̂��߂ɔ����_�C�|�[���̓d�����U���̂̃��b�V���������p�ӂ���
P3 = zeros(M, N, 3);
P3(:,:,1) = repmat(P(1), [M, N, 1]);
P3(:,:,2) = repmat(P(2), [M, N, 1]);
P3(:,:,3) = repmat(P(3), [M, N, 1]);

% �g������U���̂̊e�ʑf�܂ł̃x�N�g�����v�Z
R = plate_location_b - Inci3;
clear Inci3
%�@R�x�N�g���`��
% d =10;
% figure; quiver3(Inci3(1:d:end,1:10:end,1), Inci3(1:d:end,1:d:end,2), ...
%     Inci3(1:d:end,1:d:end,3), R(1:d:end,1:d:end,1), R(1:d:end,1:d:end,2), R(1:d:end,1:d:end,3), 'ro');

% �P�ʃx�N�g���v�Z
R_norm = sqrt( R(:,:,1).^2 + R(:,:,2).^2 + R(:,:,3).^2 );
R_unit = R./repmat(R_norm, [1, 1, 3]);
clear R;
% % �P�ʃx�N�g���傫���m�F
% R_unit_norm = sqrt( R_unit(:,:,1).^2 + R_unit(:,:,2).^2 + R_unit(:,:,3).^2 );
% figure;
% histogram(R_unit_norm);

% �����_�C�|�[������鎥�E���v�Z���邽�߂̏���
C2_pre = 1i.*k + (1./R_norm);
C2 = repmat(C2_pre, [1, 1, 3]);
clear C2_pre

C3_pre  = exp(-1i.*k.*R_norm)./(4*pi.*R_norm);
C3 = repmat(C3_pre, [1, 1, 3]);
clear C3_pre R_norm

% ���E���v�Z
H = cross(P3, R_unit, 3).*C2.*C3;

end

