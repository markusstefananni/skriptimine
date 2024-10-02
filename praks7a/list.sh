# Küsime kasutajalt katalooge nime
read -p "Palun sisestage kataloogi nimi: " dir_name

# Kontrollime, kas sisestatud kataloog eksisteerib
if [ -d "$dir_name" ]; then
    echo "Katalooge sisu: $dir_name"
    
    # Loetleme kõik elemendid antud kataloogis
    for item in "$dir_name"/*; do
        # Kontrollime, kas element on link
        if [ -L "$item" ]; then
            echo "$item (link)"  # Väljasta linki nimi
            ((link_count++))     # Suurenda linkide arvu
        # Kontrollime, kas element on fail
        elif [ -f "$item" ]; then
            echo "$item (fail)"  # Väljasta faili nimi
            ((fail_count++))     # Suurenda failide arvu
        # Kontrollime, kas element on kataloog
        elif [ -d "$item" ]; then
            echo "$item (kataloog)"  # Väljasta katalooge nimi
            ((kataloog_count++))       # Suurenda kataloogide arvu
        fi
    done

    # Väljasta kokkuvõte
    echo -e "\nKokkuvõte:"
    echo "Failide arv: $fail_count"          # Väljasta failide arv
    echo "Kataloogide arv: $kataloog_count"  # Väljasta kataloogide arv
    echo "Linkide arv: $link_count"          # Väljasta linkide arv
    echo "Koguarv: $((fail_count + kataloog_count + link_count))"  # Väljasta koguarv
else
    echo "Kataloog $dir_name ei eksisteeri."  # Teata, kui kataloog ei eksisteeri
fi

