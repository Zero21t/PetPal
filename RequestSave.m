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
