function SitterFinder(gui, ownerinfo, petinfo)
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

% Adjust the comparison logic
numRowsInfo = size(infoCellArray, 1);
numRowsRowInfo = size(rowinfo, 1);

% Initialize variables to hold the first match's Name and PhoneNumber
firstMatchName = '';
firstMatchPhoneNumber = '';

for i = 1:numRowsInfo
    for j = 1:numRowsRowInfo
        % Compare the current row in infoCellArray with the current row in rowinfo (skipping Name and PhoneNumber fields)
        if isequal(infoCellArray(i, :), rowinfo(j, 3:end)) % Adjusted for additional columns
            firstMatchName = rowinfo{j, 1}; % Store the Name of the first match
            firstMatchPhoneNumber = rowinfo{j, 2}; % Store the PhoneNumber of the first match
            break; % Found the first match, no need to continue
        end
    end
    
    if ~isempty(firstMatchName) % If a match is found, break from the outer loop as well
        break;
    end
end

% Display the Name and PhoneNumber of the first match, if found
if ~isempty(firstMatchName)
    disp(['First Match Name: ', firstMatchName]);
    disp(['First Match PhoneNumber: ', firstMatchPhoneNumber]);
else
    disp('No match found.');
end

end
