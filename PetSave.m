function PetSave(~, ~, gui, OwnerInfo, PetName, PetBreed, PetAge, PetBehaviour, PetGender, PetInstructions)
    Name = get(PetName, 'String');
    Breed = get(PetBreed, 'String');
    Age = get(PetAge, 'String');
    Behaviour = get(PetBehaviour, 'String');
    Gender = get(PetGender, 'String');
    instructions = get(PetInstructions, 'String');

    % Convert age to a number
    age = str2double(Age);

    PetInfo = {Name, Breed, age, Behaviour, Genderm instructions};
    SitterFinder([], [], gui,OwnerInfo, PetInfo)
end