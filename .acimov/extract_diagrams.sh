#!/bin/bash
#set -x

# requires drawio desktop and libxml2-utils
drawio='/mnt/c/Program Files/draw.io/draw.io.exe'
in='src/aec3po.drawio'
xml=diagrams.xml
extension='png' # png or pdf
output_dir='resources/diagrams/'
declare -a filters

# Function to display help
usage() {
    echo "Usage: $0 [FILTER] [FILTER] ..."
    echo "  FILTER       Specify one or more filters (optional)"
    echo "  -h, --help   Show this help message"
    exit 1
}

# Parse arguments
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    usage
fi

while [[ "$1" != "" ]]; do 
    filters+=($1)
    shift
done

# Export all tab names from the .drawio file
echo "Extracting tabs" 1>&2 
"$drawio" --export --format xml --uncompressed -o $xml $in > /dev/null 2&> /dev/null

SAVEIFS=$IFS
IFS=$'\n'

tabs=($(xmllint --xpath "//diagram/@name" $xml | sed -E 's/ name="([^"]+)"/\1/g')) # an array
rm $xml

mkdir -p $output_dir
for (( i=0; i<${#tabs[@]}; i++ ))
do
    tab="${tabs[$i]}"
    if [[ ${#filters[@]} -eq 0 ]]; then
        echo "Exporting: $tab" 1>&2
        "$drawio" -x -f $extension -s 2 -p $i -o "$output_dir$tab.$extension" "$in" > /dev/null 2&> /dev/null
    else
        exported=false
        for filter in "${filters[@]}"; do
            if [[ "$exported" = "false" ]]; then
                if [[ "${tab,,}" =~ ${filter,,} ]]; then
                    echo "Exporting: $tab" 1>&2
                    "$drawio" -x -f $extension -s 2 -p $i -o "$output_dir$tab.$extension" "$in" > /dev/null 2&> /dev/null
                    exported=true
                fi
            fi
        done
    fi
done


