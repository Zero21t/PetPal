function PetRequest(~,~, gui, SitterInfo)
    % Delete all children of the GUI
    delete(get(gui, 'Children'));
    set(gui, 'Units', 'normalized', 'Position', [0.2, .2, .5, .3]);

    

end