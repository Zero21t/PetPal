function submission = Database(gui, SitterInfo, RequestInfo)
    datasource = 'PetApp'; % Replace with your data source name
    username = 'App';      % Replace with your MySQL username
    password = '$St20040715';      % Replace with your MySQL password

    conn = database(datasource, username, password);

    Info = [SitterInfo, RequestInfo];
    Table = cell2table(Info, "VariableNames",{'Name', 'age', ...
        'address', 'city', 'province', 'country', 'PhoneNumber', ...
        'petbreed', 'petage', 'petbehaviour', 'petgender'});
    sqlwrite(conn, 'Sitters', Table);

    submission = true;

end