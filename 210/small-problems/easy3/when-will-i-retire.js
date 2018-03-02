var age = Number(prompt('What is your age?'));
var retirementAge = Number(prompt('At what age would you like to retire?'));
var yearsLeftUntilRetirement = retirementAge - age;

var year = new Date().getFullYear();
var retirementYear = year + yearsLeftUntilRetirement;

alert("It's " + String(year) + ". "
    + "You will retire in " + String(retirementYear) + ".\n"
    + "You have only " + String(yearsLeftUntilRetirement) + " years of work to go!");
