# We are going to do some strings 
#\n this creates a space in between the names 

#this will capatilize the E and the H 
name = "erika hernandez\n"
print(name.title())


#uppercase the name 
print(name.upper())


#lowercase the name 
print(name.lower())


#combine a frist name and last together
#the f-strings the f is for format this means it combines them togehter  
first_name = "Jerry"
last_name = "Seinfeld"
full_name = f"{first_name} {last_name}"
print(full_name)

print("\n")

#you can do a lot with f-stings you can write a message as well. 
print(f"She had man hands said: {full_name.title()}!")


print("\n")


#you can make it a verable as well and print it 
message = full_name = f"{first_name} {last_name}"
print(message)
