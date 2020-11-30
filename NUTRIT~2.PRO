domains
    Name, Gender = string
    Lifestyle =  char
    Age = integer
    Height, Weight = real
predicates
    BMI(Weight,Height)
    WeightStatus(integer)
    BMR(Gender,Weight,Height,Age,Lifestyle)
    CalorieCal(real,Lifestyle)
    PrintCal(real)
    Nutrients(real)
    run
clauses
    run:-
      clearwindow,
      write("What's your name ? : "),nl,
      readln(Name),
      write("Hello ",Name),nl,
      write("Please give your information below accordingly: "),nl,
      write("Gender(Male/Female) : "),nl,
      readln(Gender),
      write("Age : "),nl,
      readint(Age),
      write("Height(inches) : "),nl,
      readreal(Height),
      write("Weight(lbs) : "),nl,
      readreal(Weight),
      write("Lifestyle(sedentary(S)"),nl,
      write("\/lightly active(L)"),nl,
      write("\/moderately active(M)"),nl,
      write("\/very active (V)"),nl,
      write("\/extra active(E)):  "),nl,
      readchar(Lifestyle),
      BMI(Weight,Height),
      BMR(Gender,Weight,Height,Age,LifeStyle).
    
    BMI(Weight,Height):-
      Res = ((Weight / Height / Height)* 703),
      writef("Your BMI is : = %0.1f ", Res),nl,
      WeightStatus(Res).
    
    WeightStatus(Res):-
      Res < 18.5, 
      write("You are underweight."),nl,
      write("You need to put"),nl,
      write("on some weight."),nl,
      write("You are recommended"),nl,
      write("to ask your doctor"),nl,
      write("or a dietitian for"),nl,
      write("some advice"),nl.
   
    WeightStatus(Res):-
      Res >= 18.5, Res <= 24.9, 
      write("You are at a"),nl,
      write("healthy weight. By"),nl,
      write("maintaing a healthy"),nl,
      write("weight,you lower"),nl,
      write("your risk of"),nl,
      write("developing serious health"),nl, 
      write("problems."),nl.
   
    WeightStatus(Res):-
      Res >= 25.0 , Res <= 29.9,
      write("You are slightly"),nl,
      write("overweight.Losing some"),nl,
      write("weight will"),nl,
      write("do you good"),nl,
      write("for health reasons."),nl.
    
    WeightStatus(Res):-
      Res >= 30.0, 
      write("You are heavily"),nl,
      write("overweight. Your health"),nl,
      write("maybe at risk"),nl,
      write("if you do not lose"),nl,
      write("weight.You should ask"),nl, 
      write("your doctor or"),nl,
      write("dietitian for advice."),nl.
          
    BMR(Gender,Weight,Height,Age,Lifestyle):-
      Gender = "Male",
      write(" "),nl,
      Bmr = 66 + (6.3 * Weight) + (12.9 * Height) - (6.8 * Age),
      CalorieCal(Bmr,Lifestyle).
      
    BMR(Gender,Weight,Height,Age,Lifestyle):-
      Gender = "Female",
      Bmr = 655 + (4.3 * Weight) + (4.7 * Height) - (4.7 * Age),
      CalorieCal(Bmr,Lifestyle).
      
    CalorieCal(X,Lifestyle):-
      Lifestyle = 'S',
      Cal = X * 1.2,
      PrintCal(Cal).
    
    CalorieCal(X,Lifestyle):-
      Lifestyle = 'L',
      Cal = X * 1.375,
      PrintCal(Cal).
     
    
    CalorieCal(X,Lifestyle):-
      Lifestyle = 'M',
      Cal = X * 1.55,
      PrintCal(Cal).
      
    CalorieCal(X, Lifestyle):- 
      Lifestyle = 'V',
      Cal = X * 1.723,
      PrintCal(Cal).
      
    CalorieCal(X, Lifestyle):-
      Lifestyle = 'E',
      Cal = X * 1.9,
      PrintCal(Cal).
    
    PrintCal(A):-
      write("Your daily calorie"),nl,
      write("intake should be : "),nl,
      writef("%0.2f",A),
      write(" calories"),nl,
      Nutrients(A).
      
    Nutrients(B):-
      Carb1 = B * 0.45,
      Carb2 = B * 0.65,
      Fat1 =  B * 0.20,
      Fat2 =  B * 0.35,
      Protein1= B * 0.10,
      Protein2 = B * 0.35,
      write("Your daily nutirents"),nl,
      write("shound be : "),nl,
      write("Carb = "),nl,
      writef(" %0.1fcal",Carb1),
      writef(" - %0.1fcal",Carb2),nl,
      writef("Fat = "),nl,
      writef(" %0.1fcal",Fat1),
      writef(" - %0.1fcal",Fat2),nl,
      writef("Protein = "),nl,
      writef(" %0.1fcal",Protein1),
      writef(" - %0.1fcal",Protein2),nl.