function [ N ] = CalcNumOfMeshByLengthAndMeshSize( length, mesh_size )
%CalcNumOfMeshByLengthAndMeshSize: �ӂ̒����ƃ��b�V���T�C�Y����C�ӂ̃��b�V������Ԃ�

%   x_length   : length of scatter of X
%   x_mesh_size: length of mesh of X
%   N          : Number of mesh in X 

% ��`��X���CY���̊e�ӂɑ΂��āC���]�̃��b�V�����ɑ΂��ĕK�v�ȍ��W�̐ݒ萔���v�Z�C�����^�ŕێ�
N = uint64(length./mesh_size)+1;
end

