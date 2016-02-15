function [ E_scatter, E_each ] = CalcFarApproxE(  IPO, plate_location, ob, N, M, dS,k,w,Mu )
%CalcrEthroghrA �x�N�g���|�e���V����rA���o�R���ĉ����ErE�����߂�
%   �ϑ��_�������̎��̂ݗL���I

% �s��v�Z�̂��߂Ɋϑ��_�̈ʒu�x�N�g�����U���̂̃��b�V���������p�ӂ���
ob3 = zeros(M,N,3);
ob3(:,:,1) = repmat(ob(1), M, N);
ob3(:,:,2) = repmat(ob(2), M, N);
ob3(:,:,3) = repmat(ob(3), M, N);

% �e�f�ʂ���ϑ��_�܂ł̃x�N�g��R�����߂�
% R = ob3;
R = ob3 - plate_location;

% %�@R�x�N�g���`�ʊm�F
% d =10;
% figure; quiver3(plate_location(1:d:end,1:10:end,1), plate_location(1:d:end,1:d:end,2), ...
%     plate_location(1:d:end,1:d:end,3), R(1:d:end,1:d:end,1), R(1:d:end,1:d:end,2), R(1:d:end,1:d:end,3), 'AutoScale','off'); hold on;
% quiver3(ob(1),ob(2),ob(3),1,1,1,1/1000,'ro');
clear plate_location ob3;

% �P�ʃx�N�g���v�Z
R_norm = sqrt( R(:,:,1).^2 + R(:,:,2).^2 + R(:,:,3).^2 );
R_norm3 = repmat(R_norm, [1,1,3]);
R_unit = R./R_norm3;
clear R R_norm3;
% % �P�ʃx�N�g���傫���m�F
% R_unit_norm = sqrt( R_unit(:,:,1).^2 + R_unit(:,:,2).^2 + R_unit(:,:,3).^2 );
% figure;
% histogram(R_unit_norm);


% �x�N�g���|�e���V����A���v�Z
C = Mu./(4.*pi);
C1 = exp(-1i*k.*R_unit)./R_unit;
A = C*IPO.*C1*dS;
clear I_PO C2
% ���όv�Z
dot_AR = dot(A,R_unit,3);
dot_AR = repmat(dot_AR, [1,1,3]);


% �e���b�V����E�̒l���v�Z
E_each = -1i*w*(A-R_unit.*dot_AR);
clear R_unit dot_AR

% �U���E����̓d�EE_scatter�����߂�
E_scatter = squeeze(sum(sum(E_each,1),2));


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


end