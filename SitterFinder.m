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
%Concatenating extracted columns from cell arrays
infoCellArray = [ownerMatching, petMatches];
disp(infoCellArray)

% Execute the SQL query and fetch the data
sqlQuery = ['SELECT city, province, country, Petbreed, PetBehaviour, PetGender ' ...
    'FROM Sitters'];
data = fetch(conn, sqlQuery);
%convert to cellarray%
rowinfo = data;
disp(rowinfo)


% Check if a match was found
are_equal_positions = isequal(rowinfo(1,:), infoCellArray);

  if are_equal_positions
    disp('The specified positions in the cell arrays are equal.');
else
    disp('The specified positions in the cell arrays are not equal.');
end
end
