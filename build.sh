usage() {
    echo "usage: $0 [-c] [-f file_name]"
    echo " -c            Clear all builds"
    echo " -f file_name  Specify the file to compile"
    exit 1
}

clear_flag=0
file_name=""

while getopts "cf:" opt; do
    case ${opt} in
        c )
            clear_flag=1
            ;;
        f )
            file_name=$OPTARG
            ;;
        * )
            usage
            ;;
    esac
done



# clear command
dir_count=0
if [ $clear_flag -eq 1 ]; then
    for dir in builds/build_*; do
        if [[ -d $dir ]]; then
            rm -rf "$dir"
            echo "deleted: $dir"
            dir_count=$((dir_count + 1))
        fi
    done
    if [ $dir_count -eq 0 ]; then
        echo "No build directories found"
    fi
    exit 0
fi

# check for file_name
if [ -z "$file_name" ]; then
    usage
fi

# find max build so far
max_num=0
for dir in builds/build_*; do
    if [[ -d $dir ]]; then
        num=$(echo $dir | sed 's/builds\/build_//')
        if [[ $num =~ ^[0-9]+$ ]]; then
            if (( num > max_num )); then
                max_num=$num
            fi
        fi
    fi
done

# increment max
build_num=$((max_num + 1))
new_dir="builds/build_$build_num"

if [ ! -d "builds" ]; then
    mkdir "builds"
fi

# create new dir
mkdir $new_dir

# compile file
emcc $file_name -o $new_dir/hello.js -s EXPORTED_RUNTIME_METHODS="['FS', 'print', 'printErr', 'ccall', 'cwrap']"
error=$?

if [ $error -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

echo "Compiled $file_name and stored output in $new_dir."