function SitterSave(~, ~, gui, Name, Age, Address, City, Province, Country, PhoneNumber)
    % Retrieve values from text boxes
    nameStr = get(Name, 'String');
    ageStr = get(Age, 'String');
    cityStr = get(City, 'String');
    provinceStr = get(Province, 'String');
    countryStr = get(Country, 'String');
    phoneNumberStr = get(PhoneNumber, 'String');
    addressStr = get(Address, 'String');
    
    % Convert age to a number
    age = str2double(ageStr);
    
    % Convert phone number to string
    phoneNumber = phoneNumberStr;

    % Add the collected data to a cell array
    collectedData = {nameStr, age, addressStr, cityStr, provinceStr, countryStr, phoneNumber};
    disp(collectedData)
    PetRequest([], [], gui, collectedData);
end
