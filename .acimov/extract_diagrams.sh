#!/bin/bash
# set -x

# requires drawio desktop and libxml2-utils
drawio='/mnt/c/Program Files/draw.io/draw.io.exe'
in='src/aec3po.drawio'
xml=diagrams.xml
declare -a filters

# Function to display help
usage() {
    echo "Usage: $0 input.drawio -f filter1 -f filter2 ..."
    echo "  input.drawio        Specify the input draw.io file (mandatory)"
    echo "  -f, --filter VALUE  Specify one or more filters (optional)"
    echo "  -h, --help          Show this help message"
    exit 1
}

# Parse arguments
if [[ -z "$1" || "$1" == "-h" || "$1" == "--help" ]]; then
    usage
fi

in=$1
shift

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do 
    case $1 in
        -f | --filter ) shift; filters+=($1);;
        -h | --help ) usage;;
        * ) usage;;
    esac
    shift
done

# Validate mandatory argument
if [[ -z "$in" ]]; then
    echo "Error: Input file is required."
    usage
fi

# Export all tab names from the .drawio file
echo "Extracting tabs" 1>&2 
"$drawio" --export --format xml --uncompressed -o $xml $in > /dev/null 2&> /dev/null

SAVEIFS=$IFS
IFS=$'\n'

tabs=($(xmllint --xpath "//diagram/@name" $xml | sed -E 's/ name="([^"]+)"/\1/g')) # an array
rm $xml

for (( i=0; i<${#tabs[@]}; i++ ))
do
    tab="${tabs[$i]}"
    if [[ ${#filters[@]} -eq 0 ]]; then
        echo "Exporting: $tab" 1>&2
        "$drawio" -x -f png -s 2 -p $i -o "resources/diagrams/$tab.png" "$in" > /dev/null 2&> /dev/null
    else
        exported=false
        for filter in "${filters[@]}"; do
            if [[ "$exported" = "false" ]]; then
                if [[ "${tab,,}" =~ ${filter,,} ]]; then
                    echo "Exporting: $tab" 1>&2
                    "$drawio" -x -f png -s 2 -p $i -o "$tab.png" "$in" > /dev/null 2&> /dev/null
                    exported=true
                fi
            fi
        done
    fi
done


