function Pet(~, ~, gui)
 % Retrieve values from text boxes
    name = get(findobj(gui, 'Tag', 'Name'), 'String');
    age = str2double(get(findobj(gui, 'Tag', 'Age'), 'String'));
    address = get(findobj(gui, 'Tag', 'Address'), 'String');
    city = get(findobj(gui, 'Tag', 'City'), 'String');
    province = get(findobj(gui, 'Tag', 'Province'), 'String');
    country = get(findobj(gui, 'Tag', 'Country'), 'String');
    phoneNumber = get(findobj(gui, 'Tag', 'PhoneNumber'), 'String');
    
    % Combine values into a matrix
    newEntry = {name, age, address, city, province, country, phoneNumber}
% If the matrix doesn't exist, create it
    if ~exist('informationMatrix', 'var') || isempty(informationMatrix)
        informationMatrix = newEntry;
    else
        informationMatrix = [informationMatrix; newEntry];
    end
    % Display the updated matrix
    disp('Matrix after adding new entry:');
    disp(informationMatrix);
end