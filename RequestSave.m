function RequestSave(~, ~, gui, SitterInfo, Petbreed, PetAge, PetBehaviour, PetGender)
    Breed = get(Petbreed, 'String');
    Age = get(PetAge, 'String');
    Behaviour = get(PetBehaviour, 'String');
    Gender = get(PetGender, 'String');

    % Convert age to a number
    age = str2double(Age);
    
    RequestInfo = {Breed, age, Behaviour, Gender};
    submission = Database(gui, SitterInfo, RequestInfo);

    if submission == true
    % Delete all children of the GUI
    delete(get(gui, 'Children'));

        % Display a green check mark symbol (✔). For an actual image, you'd use an image control.
        CheckMark = uicontrol(gui, 'Style', 'text', ...
            'String', '✔ Submitted', ...
            'ForegroundColor', 'green', ...
            'FontSize', 24, ...
            'FontWeight', 'bold', ...
            'Units', 'normalized', ...
            'Position', [0.25, 0.5, 0.5, 0.1]);
    else 
        disp("Error submission")
    end
end
