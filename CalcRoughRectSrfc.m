function [  ] = CalcRoughRectSrfc( SrfcDirName, fname, PlateShape, ac_type, x_size, y_size, Rms, Cor_x, Cor_y, d_mesh_x, d_mesh_y )
%UNTITLED3 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

% -- Calculation (x����y���̑傫���͓����Őݒ聩�����łȂ��Ă�OK) -- %
[ N, M, dS, plate_location, seed ] = CalcRoughRectangleSurface( ...
    x_size, y_size, d_mesh_x, d_mesh_y, ac_type, Rms, Cor_x, Cor_y);

% -- �~�`�̏ꍇ�͉~�ɓ���Ȃ�������0�� -- %
if PlateShape == 1
    radius = 310;
    % ���aradius�̒��ɓ���Ȃ��_��0��
    hantei = double( (sqrt(plate_location(:,:,1).^2 + plate_location(:,:,2).^2) <= radius/2) );
    hantei_3dim = repmat(hantei, 1, 1, 3);

    plate_location = plate_location.*hantei_3dim;
%     plate_n = plate_n.*hantei_3dim;
end
% -- ------------------------------- -- %


% Save
save( strcat( num2str(SrfcDirName),'/Surface', num2str(PlateShape), fname),'N', 'M',...
    'dS', 'plate_location','seed', 'x_size', 'y_size', 'Rms', 'Cor_x','Cor_y', 'd_mesh_x', 'd_mesh_y','-v7.3');


% Option (If you don't need to see surface, please comment out)
% �\�ʊm���ߕ`��(�Ԉ���)
d = 1;
figure;
surf(plate_location(1:d:end,1:d:end,1),plate_location(1:d:end,1:d:end,2),plate_location(1:d:end,1:d:end,3));
shading interp;
% �\�ʊm���ߕ`��(�ꕔ)
dx = 60;
centM = uint32(M/2);
centN = uint32(N/2);
Xline = centN-dx/2:centN+dx/2;
Yline = centM-dx/2:centM+dx/2;
figure;
surf(plate_location(Yline, Xline,1), plate_location(Yline, Xline,2), plate_location(Yline, Xline,3));
shading interp;

end

