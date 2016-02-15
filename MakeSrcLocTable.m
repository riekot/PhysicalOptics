function [ RoughTable ] = MakeSrcLocTable( i_theta_f, i_theta_l, i_theta_d,  i_phi_f, i_phi_l, i_phi_d )
%MakeRoughTable Make roughness table in every combination of input arg
%   �ڍא����������ɋL�q

%�g���̈ʒu�ƕ����Ɣ͈͂�ݒ�
% �g���Ƃ͈̔͂ƍ��ݕ���ݒ�
i_theta_f = theta_Params(i_posi);
i_theta_l = theta_Params(i_posi);
i_theta_d = 1;
[ i_theta, i_theta_t ] = SetPoints( Deg2Rad(i_theta_f), Deg2Rad(i_theta_l), Deg2Rad(i_theta_d) );
%�g�� ���͈̔͂ƍ��ݕ���ݒ�
i_phi_f = 0;
i_phi_l = 0;
i_phi_d = 1;
[ i_phi, i_phi_t ] = SetPoints( Deg2Rad(i_phi_f), Deg2Rad(i_phi_l), Deg2Rad(i_phi_d) );

% �g��r�͈̔͂ƍ��ݕ���ݒ�i�y���ӁI�z���ʔg������̎��́C�K��1�ɂȂ�悤�Ɂy���ӁI�z)
i_r_f = InciDist_Params(i_posi);
i_r_l = InciDist_Params(i_posi);
i_r_d = 100;
[ i_r, i_r_t ] = SetPoints( i_r_f, i_r_l, i_r_d );

%% xyz���W�Ŏw��

end