function Goback(~, ~, gui)
     % Close the current GUI window
    close(gcf);
    
    % Call the gui function to return to the main screen
    gui();
end