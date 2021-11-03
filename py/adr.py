while True:
    V = "0.1.3"
    print("Version:" + V + " / Welcome!")
    yes_no = input("Run this program? (y/n):")
    if yes_no == "n":
        print("OK, Well done..")
        break
    elif yes_no == "y":
        print("Running now.")
        fname = input("Whats is your name?: ")
        if fname == "Alexander":
            print("We have the same name.")
        elif fname == "Niklas":
            print("Know someone named niklas.")
        elif fname == "":
            print("[ ? ] You must answer.")
        else:
            print("What a nice name you have " + fname + "! Have a nice day.")
        break
    else:
        break
        print("write y or n.")
        
