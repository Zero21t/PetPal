function isRunning = connection()
    % Attempt to connect to the server
    try
        t = tcpclient('44.203.178.157', 22);
        % If the connection is successful, server is running
        isRunning = true;
        disp('Server is running.');
        gui();
    catch
        % If connection fails, server is not running
        isRunning = false;
        disp('Server is not running.');
    end
end
