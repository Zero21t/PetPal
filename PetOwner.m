function PetOwner(~, ~, gui, owner, sitter)
    delete(owner);
    delete(sitter)
    set(gui, 'position', [400, 100, 900, 600]);

    %Name%
    NameLabel = uicontrol(gui, 'Style', 'text', ...
        'String', 'Name:', ...
        'Position', [50, 500, 50, 20]);
    Name = uicontrol(gui, "Style", "edit", ...
        "Position", [100, 500, 100, 30]);
    
    %Age%
    AgeLabel = uicontrol(gui, 'Style', 'text', ...
        'String', 'Age:', ...
        'Position', [200, 500, 50, 20]);
    Age = uicontrol(gui, "Style", "edit", ...
        "Position", [250, 500, 100, 30]);
    
end 