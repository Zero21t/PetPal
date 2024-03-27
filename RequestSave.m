function RequestSave(~, ~, gui, SitterInfo, Petbreed, PetAge, PetBehaviour, PetGender)
    Breed = get(Petbreed, 'String');
    Age = get(PetAge, 'String');
    Behaviour = get(PetBehaviour, 'String');
    Gender = get(PetGender, 'String');

    % Convert age to a number
    age = str2double(Age);
    
    RequestInfo = {Breed, age, Behaviour, Gender};
    Database(gui, SitterInfo, RequestInfo);
end
(name VARCHAR(45), age INT, address VARCHAR(45), city VARCHAR(45), province VARCHAR(45), country VARCHAR(45), phoneNumber INT, Petbreed VARCHAR(45), PetAge INT, PetBehaviour VARCHAR(45), PetGender VARCHAR(45))