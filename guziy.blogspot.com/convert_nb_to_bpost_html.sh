

in_file=${1:-"ring_colliding_with_step.ipynb"}
jupyter nbconvert --to html --template basic ${in_file} 
