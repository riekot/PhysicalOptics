function [ E_theta_phi ] = Main_PO( cfname, BUN, plate_location, N, M, dS, lambda, k, Omega, Mu, Epsi, SrcLoc_xyz, ObsLoc_xyz, P, ...
    fc, Rms, Cor, Size,i_posi,i_monte)
%UNTITLED13 ���̊֐��̊T�v�������ɋL�q
%   �U���̂𕪊����Čv�Z

% �������ߖ�̂��߃O���[�o���ϐ�
global plate_location_b;

% �������̐ݒ�Ƃ���ɉ������ϐ��̃������m��
M_b = double(uint64(M./BUN));
M_bl = M - (BUN-1)*M_b;
N_b = N;

% �d�E��ۑ����邽�߂̃������m��
E_theta_phi_temp = zeros(BUN, 3);

% ---------------------------------------------------------------------- %
% �Ō�̕����̒��O�܂ł��v�Z
if BUN ~= 1
    for i_bunkatsu = 1:BUN-1
        % �l���
        plate_location_b = plate_location(((i_bunkatsu-1)*M_b)+1:i_bunkatsu*M_b, :, :);
        % �v�Z
        E_theta_phi_temp(i_bunkatsu, :) = Calc_H_IPO_E( cfname, i_bunkatsu, ...
            plate_location_b, N_b, M_b, dS, SrcLoc_xyz, ObsLoc_xyz, P, k, Omega, Epsi, Mu );
    end
end

% �Ō�̕����̕����v�Z
i_bunkatsu = BUN;
% �l���
plate_location_b = plate_location(((i_bunkatsu-1)*M_b)+1:M, :, :);
% �v�Z
E_theta_phi_temp(i_bunkatsu, :) = Calc_H_IPO_E( cfname, i_bunkatsu, ...
    plate_location_b, N_b, M_bl, dS, SrcLoc_xyz, ObsLoc_xyz, P, k, Omega, Epsi, Mu );
% ---------------------------------------------------------------------- %

% �����v�Z���Ă������̂�����(=���Z)
E_theta_phi = sum(E_theta_phi_temp,1);

end

