#!/bin/bash
#Number guessing game
    #Options displayed on screen

record10="record10.txt"
record20="record20.txt"
record100="record100.txt"
continue_game=true 
until [ "$continue_game" = "true" ]; do
    clear
     echo "Choose an option"
     echo "1. New game"
     echo "2. Record"
     echo "3. Exit"
     echo -n "Choose an option (1-3)"
     read option
        #Option reader 
     case $option in 
     
                1) 
                clear
                echo "Choose an option";
                echo "a. 1-10";
                echo "b. 1-20";
                echo "c. 1-100";
                echo -n "Choose an option (a-b-c)";
                read option1;
        
            case $option1 in 
    #Game start_____________________________________________________________________________
        #Option 1-10___________________________________________________
                a) clear
                num_attempts=0
                echo "Option a"
                num=$(echo $(($RANDOM%10)))
                echo "Try to guess the number from 1 to 10: "
                read num1
                while (( $num1 != $num)); do
                    ((num_attempts++))
                    if (( $num1 > $num )); 
                    then
                        echo "Try a smaller number"
                    else 
                        echo "Try a bigger number"
                    fi
                        echo "Try again: "
                        read num1
                done
                ((num_attempts++))
                echo "Correct!!!. Total attempts: $num_attempts"
        # Check record
            if [[ -s "record10.txt" && $num_attempts -lt $(cat "$record10") ]]; then
                echo "New record set! Previous record: $(cat "$record10")"
                echo "$num_attempts" > "$record10"
            fi
                  ;;
    
        #Option 1-20__________________________________________________________
                b)clear 
                num_attempts=0
                echo "Option b" 
                num=$(echo $(($RANDOM%20)))
                echo "Try to guess the number from 1 to 20: "
                read num1
                while (( $num1 != $num)); do
                        ((num_attempts++))
                        if (( $num1 > $num )); 
                        then
                            echo "Try a smaller number"
                        else 
                            echo "Try a bigger number"
                        fi
                            echo "Try again: "
                            read num1
                done
                ((num_attempts++))
                echo "Correct!!!. Total attempts: $num_attempts"
        # Check record
            if [[ -s "$record20" && $num_attempts -lt $(cat "$record20") ]]; then
                echo "New record set! Previous record: $(cat "$record20")"
                echo "$num_attempts" > "$record20"
            fi
                ;;
        #Option 1-100________________________________________________________
                c) clear
                num_attempts=0
                echo "Option c" 
                num=$(echo $(($RANDOM%100)))
                echo "Try to guess the number from 1 to 100: "
                read num1
                while (( $num1 != $num)); do
                        ((num_attempts++))
                        if (( $num1 > $num )); 
                        then
                            echo "Try a smaller number"
                        else 
                            echo "Try a bigger number"
                        fi
                            echo "Try again: "
                            read num1
                done
                ((num_attempts++))
                echo "Correct!!!. Total attempts: $num_attempts"
        # Check record
            if [[ -s "$record100" && $num_attempts -lt $(cat "$record100") ]]; then
                echo "New record set! Previous record: $(cat "$record100")"
                echo "$num_attempts" > "$record100"
            fi
                ;;
        #End game
        esac ;;
        2)
        echo "Records"
        echo "Current record [1-10]: $(cat "$record10")" ;
        echo "Current record [1-20]: $(cat "$record20")" ;
        echo "Current record [1-100]: $(cat "$record100")" ;
        ;;
        3) 
        clear
            echo "100" > "$record10"
            echo "100" > "$record20"
            echo "100" > "$record100"
        exit
        ;;
        *) echo "Invalid option"
        ;;
        esac
        echo "Press any key to continue..."
        read something
done
