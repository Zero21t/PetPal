function PetRequest(~,~, gui, SitterInfo)
    % Delete all children of the GUI
    delete(get(gui, 'Children'));
    set(gui, 'Units', 'normalized', 'Position', [0.2, .2, .5, .3]);

    Petrequests = uicontrol(gui, 'Style', 'text', ...
        'String', 'Animal Request', ...
        'Units', 'normalized', ...
        'Position', [0.25, .825, 0.5, 0.1], 'FontSize', 18 );
    
    PetBreedlabel = uicontrol(gui, 'Style', 'text', ...
        'String', 'Breed:', ...
        'Units', 'normalized', ...
        'Position', [0.02, .675, 0.1, 0.1]);
    Petbreed = uicontrol(gui, "Style", "edit", ...
        'Units', 'normalized', ...
        "Position", [.12, .7, 0.14, 0.1]);
    
    PetAgeLabel = uicontrol(gui, 'Style', 'text', ...
        'String', 'animals Age:', ...
        'Units', 'normalized', ...
        'Position', [0.26, .675, 0.1, 0.1]);
    PetAge = uicontrol(gui, "Style", "edit", ...
        'Units', 'normalized', ...
        "Position", [.36, .7, 0.14, 0.1]);
    
    PetBehaviourLabel = uicontrol(gui, 'Style', 'text', ...
        'String', 'Behaviour:', ...
        'Units', 'normalized', ...
        'Position', [0.50, .675, 0.08, 0.1]);
    PetBehaviour = uicontrol(gui, "Style", "edit", ...
        'Units', 'normalized', ...
        "Position", [.57, .7, 0.14, 0.1]);
    
    PetGenderLabel = uicontrol(gui, 'Style', 'text', ...
        'String', 'Pet Gender:', ...
        'Units', 'normalized', ...
        'Position', [0.02, .475, 0.1, 0.1]);
    PetGender = uicontrol(gui, "Style", "edit", ...
        'Units', 'normalized', ...
        "Position", [.12, .5, 0.14, 0.1]);

     Next = uicontrol(gui, 'Style', 'pushbutton', ...
        'String', 'Next', ...
        'Units', 'normalized', ...
        'Position', [.25, .2, .25, .2], ...
        'FontSize', 16);
    set(Next, 'Callback', {@RequestSave, gui, SitterInfo, Petbreed, PetAge, PetBehaviour, PetGender});
end