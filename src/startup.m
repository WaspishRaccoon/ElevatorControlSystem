function startup()
    clc;
    fprintf('Initialisation...\n');
    add_project_paths();
    load_constants;
    fprintf('Successfully!\n');
end

function add_project_paths()
    project_folders = {
        'src',
        'models', 
        'tests',
        'docs'
    };
    
    for i = 1:length(project_folders)
        if exist(project_folders{i}, 'dir')
            addpath(genpath(project_folders{i}));
            fprintf('Add to path: %s\n', project_folders{i});
        else
            fprintf('Error: Folder has not been found: %s\n', project_folders{i});
        end
    end
end