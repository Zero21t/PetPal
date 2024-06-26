function [matchNames, matchPhoneNumbers] = SitterFinder(ownerinfo, petinfo)
    % Database connection parameters
    datasource = 'PetApp';   % Replace with your data source name
    username = 'App';        % Replace with your MySQL username
    password = '$St20040715';% Replace with your MySQL password

    % Connect to the database
    conn = database(datasource, username, password);

    % Extracting columns from cell arrays
    ownerMatching = ownerinfo([4, 5, 6]);
    petMatches = petinfo([2, 4, 5]);
    % Concatenating extracted columns from cell arrays
    infoCellArray = [ownerMatching, petMatches];

    % Update the SQL query to fetch Name and PhoneNumber along with other details
    sqlQuery = ['SELECT name, PhoneNumber, city, province, country, Petbreed, PetBehaviour, PetGender ' ...
        'FROM Sitters'];
    data = fetch(conn, sqlQuery);

    % Ensure rowinfo is a cell array, if data is a table
    if istable(data)
        rowinfo = table2cell(data);
    else
        rowinfo = data; % Assuming data is already a cell array
    end

    % Initialize arrays to hold the names and phone numbers of all matches
    matchNames = {};
    matchPhoneNumbers = {};

    for i = 1:size(infoCellArray, 1)
        for j = 1:size(rowinfo, 1)
            % Compare the current row in infoCellArray with the current row in rowinfo (skipping Name and PhoneNumber fields)
            if isequal(infoCellArray(i, :), rowinfo(j, 3:end)) % Adjusted for additional columns
                % Store the Name and PhoneNumber of the current match
                matchNames{end+1} = rowinfo{j, 1};
                matchPhoneNumbers{end+1} = rowinfo{j, 2};
                % Continue searching for more matches
            end
        end
    end

    % Display the Names and PhoneNumbers of all matches, if found
    if ~isempty(matchNames)
        disp('Matches found:');
        for k = 1:length(matchNames)
            disp(['Match ', num2str(k), ' Name: ', matchNames{k}]);
            disp(['Match ', num2str(k), ' PhoneNumber: ', matchPhoneNumbers{k}]);
        end
    else
        disp('No match found.');
    end
end
