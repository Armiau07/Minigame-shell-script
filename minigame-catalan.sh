#!/bin/bash
#Joc d'endivinar un numero
	#Opcions que apareixen en pantalla



record10="record10.txt"
record20="record20.txt"
record100="record100.txt"
continuar= true 
until [ "$continuar" = "true" ]; do
	clear
	 echo "Tria una opció"
	 echo "1. Nova partida"
	 echo "2. Récord"
	 echo "3. Surt"
	 echo -n "Tria una opcio (1-3)"
	 read opcio
		#Lector d'opcións 
	 case $opcio in 
	 
                1) 
        		clear
        		echo "Tria una opció";
        		echo "a. 1-10";
        		echo "b. 1-20";
        		echo "c. 1-100";
        		echo -n "Tria una opció (a-b-c)";
        		read opcio1;
		
			case $opcio1 in 
	#Principi joc_____________________________________________________________________________
		#Opció 1-10___________________________________________________
				a) clear
				numin=0
				echo "Opció a"
				num=$(echo $(($RANDOM%10)))
				echo "Intenta endivinar el numero de l'1 al 10: "
				read num1
				while (( $num1 != $num)); do
					((numin++))
					if (( $num1 > $num )); 
					then
						echo "Proba-ho amb un més petit"
					else 
						
						echo "Proba-ho amb un més gran"
					fi
						echo "Torna-ho a provar: "
						read num1
				done
				((numin++))
				echo "Correcte!!!.El total d'intents és: $numin"
		# Comprobar el récord
			if [[ -s "record10.txt" && $numin -lt $(cat "$record10") ]]; then
			    echo "¡Nou récord establert! Récord anterior: $(cat "$record10")"
			    echo "$numin" > "$record10"
			fi
          		;;
	
		#Opció 1-20__________________________________________________________
				b)clear 
				numin=0
				echo "Opció b" 
				num=$(echo $(($RANDOM%20)))
				echo "Intenta endivinar el numero de l'1 al 20: "
				read num1
				while (( $num1 != $num)); do
				        ((numin++))
                                        if (( $num1 > $num )); 
                                        then
						echo "Proba-ho amb un més petit"
					else 
						
						echo "Proba-ho amb un més gran"
					fi
						echo "Torna-ho a provar: "
						read num1
				done
				((numin++))
				echo "Correcte!!!.El total d'intents és: $numin"
		# Comprobar el récord
			if [[ -s "$record20" && $numin -lt $(cat "$record20") ]]; then
			    echo "¡Nou récord establert! Récord anterior: $(cat "$record20")"
			    echo "$numin" > "$record20"
			fi
		        ;;
		#Opcio 1-100________________________________________________________
				c) clear
				numin=0
				echo "Opció c" 
				num=$(echo $(($RANDOM%100)))
				echo "Intenta endivinar el numero de l'1 al 100: "
				read num1
				while (( $num1 != $num)); do
				        ((numin++))
                                        if (( $num1 > $num )); 
                                        then
						echo "Proba-ho amb un més petit"
					else 
						
						echo "Proba-ho amb un més gran"
					fi
						echo "Torna-ho a provar: "
						read num1
				done
				((numin++))
				echo "Correcte!!!.El total d'intents és: $numin"
		# Comprobar el récord
			if [[ -s "$record100" && $numin -lt $(cat "$record100") ]]; then
			    echo "¡Nou récord establert! Récord anterior: $(cat "$record100")"
			    echo "$numin" > "$record100"
			fi
		        ;;
		#Final joc
		esac ;;
		2)
		echo "Rècords"
		echo "Actual récord [1-10]: $(cat "$record10")" ;
            	echo "Actual récord  [1-20]: $(cat "$record20")" ;
            	echo "Actual récord  [1-100]: $(cat "$record100")" ;
		;;
		3) 
		clear
			echo "100" > "$record10"
			echo "100" > "$record20"
			echo "100" > "$record100"
		exit
		;;
		*) echo "Opció no vàlida"
		;;
		esac
		echo "Prem una tecla per continuar..."
		read algo
done 
