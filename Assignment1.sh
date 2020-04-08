#Assignment 1.1
# Ciaran Fereday 
#Scripting Languages
#10393236
#!/bin/bash
NUMBER=0
GUESS=0 


startGame() #create a function called startGame
{
    NUMBER=$((20 + $RANDOM % 50)) #Generate a random number between 20 and 70
    echo ""
    echo " Secret Number for testing'$NUMBER'"
    echo "Welcome to the Age Guessing game"
    echo "Enter your guess between 20 and 70"
    read GUESS  #Store the users input in a variable called GUESS
    checkGuess #load the checkGuess function
    exit
}
checkGuess()
{
    NUMGUESS=$1 #first command line argument
    NUMGUESS=$((NUMGUESS+1)) #NUMGUESS adds 1 every time it is called again
    if (($NUMBER == $GUESS)); then #if the random number is equal to the guess
        endGame 1 $NUMGUESS #go to the first argument in the function endGame
    fi 
    if (($NUMBER > $GUESS )); then #if the number is greater then the guess
        echo "Higher"
        echo ""
    fi
    if (($NUMBER < $GUESS)); then #if the number is lower then the guess
        echo "Lower"
        echo ""
    fi
    if (($NUMGUESS == 5 )); then #if the number of guesses equals 5
        echo "Sorry you used all your guesses!"
        endGame 2 $NUMGUESS #skip the first parameters in endGame and go to the second
    fi
    echo "You used '$NUMGUESS' out of 5 guesses" #show how many times you have guesses
    echo "Enter a new number"
    read GUESS
    checkGuess $NUMGUESS
}
endGame()
{
    #NUMGUESS=$2
    if (( $1 == 1)); then #if the first paramaters are met
        echo""
        echo "Congratulations You Are Correct!"
        echo "It has taken you '$NUMGUESS' out of 5 tries!"
        echo ""
    fi
    NUMGUESS=$2
    echo "Would you like to try again? Enter 'y' for Yes or any number for No"
    read TRY
    if (($TRY == "yes" )); then
        echo ""
        startGame
    else 
        echo ""
        echo "Cya! Better luck next time"
        exit
    fi
    

}

startGame






