function isRunning = connection()
 datasource = 'PetApp'; % Replace with your data source name
username = 'App';      % Replace with your MySQL username
password = '$St20040715';      % Replace with your MySQL password

conn = database(datasource, username, password);

isRunning = isopen(conn);
if isRunning == 1
    gui();
else 
    disp('Eroor check connection to database');
end
end
