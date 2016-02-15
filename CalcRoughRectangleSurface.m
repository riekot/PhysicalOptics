function [ N, M, dS, plate_location, seed ] = CalcRoughRectangleSurface( x_length, y_length, d_mesh_x, d_mesh_y, ac_type, h, clx, cly )
%CalcRoughSurfaceRectVectorsAndUnitVectorsByGaussianDist �e�ʍ쐬
%   

% ��`��X���CY���̊e�ӂɑ΂��āC���]�̃��b�V���T�C�Y�ɑΉ����郁�b�V�������v�Z�i�߂�l�F�����^�j
N = CalcNumOfMeshByLengthAndMeshSize(x_length, d_mesh_x);
M = CalcNumOfMeshByLengthAndMeshSize(y_length, d_mesh_y);

% �ʑf�̑傫��
dS = d_mesh_x.*d_mesh_y;

% ���t�l�X�����\�ʂ��v�Z
if ac_type == 0
    [f,x,y,seed] = MakeGaussianSfc(double(N), double(M), x_length, y_length, h, clx, cly);
else if ac_type == 1
        [f,x,y,seed] = MakeExpSfc(double(N), double(M), x_length, y_length, h, clx, cly);
    end
end

% �������m��
% plate_location = zeros(M,N,3);

% �U���̂̊e�_��plate_location�Ɋi�[(�U���̂̊e�f�ʂ̍��W���J�[�e�V�A�����W�n�Őݒ�)
[plate_location(:,:,1), plate_location(:,:,2), plate_location(:,:,3)]= meshgrid(x, y, 0);
plate_location(:,:,3) = f;

% save('Surface/test.mat','plate_location', '-v7.3');
end
