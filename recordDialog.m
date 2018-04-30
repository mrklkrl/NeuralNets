function [selection] = recordDialog()
% Construct a questdlg with three options
choice = questdlg('Would you like to record audio?', ...
	'Record', ...
	'Yes','No','No');
% Handle response
switch choice
    case 'Yes'
        selection = 1;
    case 'No'
        selection = 0;
end

end

