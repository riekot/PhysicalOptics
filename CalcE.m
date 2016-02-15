function [ E_theta_phi, E_each ] = CalcE( theta_length, phi_length, table_theta, table_phi, hasuu_normalized, omega_normalized, I_PO, plate_location, N, M, dS, E0_normalized, mu_normalized, ob_r )
%CalcEscatterdByFarfieldApprox �����E�C�ϑ��_�͓��˖ʂ̎U���E���v�Z
%   �e�ϑ��_(�������ŁC�ϑ��p���ω�)�ɂ�����U���E���v�Z


% �x�N�g���|�e���V����A�����߂鎞�̌W��
C1 = mu_normalized./(4.*pi);

% �x�N�g���|�e�V����A�Ƌ����̐ρCrA�o�R��rE�����߂�D�i�����E�ߎ��j
% �e�ʑf��r�ƃx�N�g���|�e���V����A�̐ρC|rA|���v�Z
% �W��
r0A = zeros(3,1);
% �e�f�ʁCx,y,z�������ƂɌv�Z
ob_n_array = zeros(M,N,3);
ob_n_array(:,:,1) = repmat(ob_n(1), M, N);
ob_n_array(:,:,2) = repmat(ob_n(2), M, N);
ob_n_array(:,:,3) = repmat(ob_n(3), M, N);

C2 = exp(-1i*hasuu_normalized.*ob_n_array)./ob_n_array;
r0A = C1*I_PO.*C2*dS;
clear I_PO C2


% �ϑ��_�ɂ�����x�N�g���|�e���V����A�͊e�ʑf�����A(k,1)�̘a(��)
r0A_sum = squeeze(sum(sum(r0A, 1),2));


ob = ob_n.';
% �e���b�V���̒l��ۑ�
dot_Ar = dot(r0A,ob_n_array);
dot_Ar_array = repmat(dot_Ar, 3,1,1);
E_each = -1i*omega_normalized.*(r0A-ob_n_array.*dot_Ar_array);

% �U���E����̓d�EE_scatter�����߂�
E_scatter = squeeze(sum(sum(E_each,1),2));


%----------------------------------------------
% �W��
r0A = zeros(3,1);
% �e�f�ʁCx,y,z�������ƂɌv�Z
ob_n_array = zeros(M,N,3);
ob_n_array(:,:,1) = repmat(ob_n(1), M, N);
ob_n_array(:,:,2) = repmat(ob_n(2), M, N);
ob_n_array(:,:,3) = repmat(ob_n(3), M, N);

C2 = exp(1i*hasuu_normalized* dot(ob_n_array, plate_location, 3));
r0A_x = C1*I_PO(:,:,1).*C2*dS;
r0A_y = C1*I_PO(:,:,2).*C2*dS;
r0A_z = C1*I_PO(:,:,3).*C2*dS;
clear ob_narray I_PO C2
% �ϑ��_�ɂ�����x�N�g���|�e���V����A�͊e�ʑf�����A(k,1)�̘a(��)
r0A(1,1) = sum(sum(r0A_x));
r0A(2,1) = sum(sum(r0A_y));
r0A(3,1) = sum(sum(r0A_z));

% �U���E����̓d�EE_scatter�����߂�
E_scatter = -1i*omega_normalized*r0A;
% �e���b�V���̒l��ۑ�
E_each(:,:,1) = -1i*omega_normalized*r0A_x;
E_each(:,:,2) = -1i*omega_normalized*r0A_y;
E_each(:,:,3) = -1i*omega_normalized*r0A_z;


%----------------------------------------------
% % �W��
% r0A = zeros(3,1);
% % �e�f�ʁCx,y,z�������ƂɌv�Z
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
% % �ϑ��_�ɂ�����x�N�g���|�e���V����A�͊e�ʑf�����A(k,1)�̘a(��)
% r0A(1,1) = sum(sum(r0A_x));
% r0A(2,1) = sum(sum(r0A_y));
% r0A(3,1) = sum(sum(r0A_z));
% 
% % �U���E����̓d�EE_scatter�����߂�
% E_scatter = -1i*omega_normalized*r0A;
% % �e���b�V���̒l��ۑ�
% E_each(:,:,1) = -1i*omega_normalized*r0A_x;
% E_each(:,:,2) = -1i*omega_normalized*r0A_y;
% E_each(:,:,3) = -1i*omega_normalized*r0A_z;


% ���ꂼ��̊ϑ��_�ɑ΂���d�E��ۑ�(rE[V/��]��ۑ����Ă��邱�ƂɂȂ�)
E_theta_phi(i_theta, i_phi,:) = squeeze(E_scatter);



end