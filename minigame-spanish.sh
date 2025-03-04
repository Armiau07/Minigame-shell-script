#!/bin/bash
# Juego de adivinar un número
# Opciones que aparecen en pantalla

record10="record10.txt"
record20="record20.txt"
record100="record100.txt"
continuar=true 

until [ "$continuar" = "true" ]; do
    clear
    echo "Elige una opción"
    echo "1. Nueva partida"
    echo "2. Récord"
    echo "3. Salir"
    echo -n "Elige una opción (1-3): "
    read opcion

    case $opcion in 
        1) 
            clear
            echo "Elige un rango:";
            echo "a. 1-10";
            echo "b. 1-20";
            echo "c. 1-100";
            echo -n "Elige una opción (a-b-c): ";
            read opcion1;
        
            case $opcion1 in 
                # Opción 1-10
                a) 
                    clear
                    num_intentos=0
                    echo "Opción a"
                    num=$(echo $(($RANDOM%10)))
                    echo "Intenta adivinar el número del 1 al 10: "
                    read num1
                    while (( $num1 != $num )); do
                        ((num_intentos++))
                        if (( $num1 > $num )); then
                            echo "Prueba con un número más pequeño"
                        else 
                            echo "Prueba con un número más grande"
                        fi
                        echo "Vuelve a intentarlo: "
                        read num1
                    done
                    ((num_intentos++))
                    echo "¡Correcto! Total de intentos: $num_intentos"

                    # Comprobar el récord
                    if [[ -s "record10.txt" && $num_intentos -lt $(cat "$record10") ]]; then
                        echo "¡Nuevo récord establecido! Récord anterior: $(cat "$record10")"
                        echo "$num_intentos" > "$record10"
                    fi
                    ;;
                
                # Opción 1-20
                b)
                    clear 
                    num_intentos=0
                    echo "Opción b" 
                    num=$(echo $(($RANDOM%20)))
                    echo "Intenta adivinar el número del 1 al 20: "
                    read num1
                    while (( $num1 != $num )); do
                        ((num_intentos++))
                        if (( $num1 > $num )); then
                            echo "Prueba con un número más pequeño"
                        else 
                            echo "Prueba con un número más grande"
                        fi
                        echo "Vuelve a intentarlo: "
                        read num1
                    done
                    ((num_intentos++))
                    echo "¡Correcto! Total de intentos: $num_intentos"

                    # Comprobar el récord
                    if [[ -s "$record20" && $num_intentos -lt $(cat "$record20") ]]; then
                        echo "¡Nuevo récord establecido! Récord anterior: $(cat "$record20")"
                        echo "$num_intentos" > "$record20"
                    fi
                    ;;
                
                # Opción 1-100
                c) 
                    clear
                    num_intentos=0
                    echo "Opción c" 
                    num=$(echo $(($RANDOM%100)))
                    echo "Intenta adivinar el número del 1 al 100: "
                    read num1
                    while (( $num1 != $num )); do
                        ((num_intentos++))
                        if (( $num1 > $num )); then
                            echo "Prueba con un número más pequeño"
                        else 
                            echo "Prueba con un número más grande"
                        fi
                        echo "Vuelve a intentarlo: "
                        read num1
                    done
                    ((num_intentos++))
                    echo "¡Correcto! Total de intentos: $num_intentos"

                    # Comprobar el récord
                    if [[ -s "$record100" && $num_intentos -lt $(cat "$record100") ]]; then
                        echo "¡Nuevo récord establecido! Récord anterior: $(cat "$record100")"
                        echo "$num_intentos" > "$record100"
                    fi
                    ;;
            esac
            ;;
        
        2)
            echo "Récords"
            echo "Récord actual [1-10]: $(cat "$record10")"
            echo "Récord actual [1-20]: $(cat "$record20")"
            echo "Récord actual [1-100]: $(cat "$record100")"
            ;;
        
        3) 
            clear
            echo "100" > "$record10"
            echo "100" > "$record20"
            echo "100" > "$record100"
            exit
            ;;
        
        *) 
            echo "Opción no válida"
            ;;
    esac
    echo "Presiona una tecla para continuar..."
    read algo
done
