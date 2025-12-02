function clear_trash()
    % Remove temporary file
    fprintf('Deleting temporary files...\n');
    if exist('slprj', 'dir')
        rmdir('slprj', 's');
        fprintf('Folder slprj has been deleted\n');
    end
    
    slxcFiles = dir('**/*.slxc');
    for i = 1:length(slxcFiles)
        delete(fullfile(slxcFiles(i).folder, slxcFiles(i).name));
    end
    if ~isempty(slxcFiles)
        fprintf('Deleted %d .slxc files\n', length(slxcFiles));
    end
    
    tempFiles = {'*.asv', '*.m~', '*_old*', '*.autosave'};
    deleted_count = 0;
    for i = 1:length(tempFiles)
        files = dir(tempFiles{i});
        for j = 1:length(files)
            delete(files(j).name);
            deleted_count = deleted_count + 1;
        end
    end
    
    if deleted_count > 0
        fprintf('Deleted %d temp files\n', deleted_count);
    end
    
    close_system([], 0);
    
    fprintf('Cleaning is successful\n');
end