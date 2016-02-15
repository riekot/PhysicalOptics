function [ E_scatter, E_each ] = CalcExactE( k, w, IPO, ob, plate_location, N, M, dS, e )
%
%

% �s��v�Z�̂��߂Ɋϑ��_�̈ʒu�x�N�g�����U���̂̃��b�V���������p�ӂ���
ob3 = zeros(M,N,3);
ob3(:,:,1) = repmat(ob(1), M, N);
ob3(:,:,2) = repmat(ob(2), M, N);
ob3(:,:,3) = repmat(ob(3), M, N);

% �e�f�ʂ���ϑ��_�܂ł̃x�N�g��R�����߂�
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
clear R;
% % �P�ʃx�N�g���傫���m�F
% R_unit_norm = sqrt( R_unit(:,:,1).^2 + R_unit(:,:,2).^2 + R_unit(:,:,3).^2 );
% figure;
% histogram(R_unit_norm);


% ����
C = 1/(1i*w*e);
C0 = exp(-1i*k.*R_norm)./(4*pi.*R_norm);
C0 = repmat(C0,[1, 1, 3]);
clear R_norm;


dot_IR = dot(IPO, R_unit, 3);
dot_IR = repmat(dot_IR, [1, 1, 3]);


C1 = k^2*(IPO  -1*dot_IR.*R_unit);
C10 = (-1*IPO  +3*dot_IR.*R_unit);
C2 = (1i*k./R_norm3).*C10;
C3 = (1./R_norm3.^2).*C10;
clear R_unit R_unit3 dot_IR IPO C10;


% �d�E���v�Z
E_each = C*( C1       ).*C0*dS;
% E_each = C*( C1+C2+C3 ).*C0*dS;
E_scatter = squeeze(sum( sum( E_each, 1), 2));

end