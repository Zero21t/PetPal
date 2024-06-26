function Matched(gui, OwnerInfo, PetInfo)
    % Delete all children of the GUI
    delete(get(gui, 'Children'));

    set(gui, 'Units', 'normalized', 'Position', [0.2, .2, .5, .3]);

    [matchNames, matchPhoneNumbers] = SitterFinder(OwnerInfo, PetInfo);
    currentMatchIndex = 0; % Initialize match index

    function updateMatchDisplay()
        if currentMatchIndex < length(matchNames)
            currentMatchIndex = currentMatchIndex + 1;
            matchStr = ['Match Found: ', matchNames{currentMatchIndex}, ' ', matchPhoneNumbers{currentMatchIndex}];
        else
            matchStr = 'No more matches';
            set(DeclineButton, 'Enable', 'off');
        end
        set(Match, 'String', matchStr);
    end

    MatchTitle = uicontrol(gui, 'Style', 'text', ...
        'String', 'Match found', ...
        'Units', 'normalized', ...
        'Position', [0.25, .825, 0.5, 0.1], 'FontSize', 18);

    Match = uicontrol(gui, 'Style', 'text', ...
        'String', '', ...
        'Units', 'normalized', ...
        'Position', [0.25, .525, 0.5, 0.3], 'FontSize', 14);

    AcceptButton = uicontrol(gui, 'Style', 'pushbutton', ...
        'String', 'Accept', ...
        'Units', 'normalized', ...
        'Position', [0.25, 0.2, 0.2, 0.1], ...
        'Callback', @AcceptMatchCallback);

    DeclineButton = uicontrol(gui, 'Style', 'pushbutton', ...
        'String', 'Decline', ...
        'Units', 'normalized', ...
        'Position', [0.55, 0.2, 0.2, 0.1], ...
        'Callback', @DeclineMatchCallback);

    updateMatchDisplay();

    function AcceptMatchCallback(hObject, eventdata)
        % Remove buttons
        delete(AcceptButton);
        delete(DeclineButton);

        % Display a green check mark symbol (✔). For an actual image, you'd use an image control.
        CheckMark = uicontrol(gui, 'Style', 'text', ...
            'String', '✔ Match Accepted', ...
            'ForegroundColor', 'green', ...
            'FontSize', 24, ...
            'FontWeight', 'bold', ...
            'Units', 'normalized', ...
            'Position', [0.25, 0.5, 0.5, 0.1]);
        number = currentMatchIndex;
        disp("attempts: "+number)
    end

    function DeclineMatchCallback(hObject, eventdata)
        updateMatchDisplay();
    end
end
