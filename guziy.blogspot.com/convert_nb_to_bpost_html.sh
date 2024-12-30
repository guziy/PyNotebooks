

in_file=${1:-"ring_colliding_with_step.ipynb"}
ou_file=${in_file%%ipynb}html

jupyter nbconvert --to html --template basic ${in_file}

# add mathjax
cat << EOF >> ${ou_file}
  <script type="text/x-mathjax-config">   MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\\\(','\\\\)']]}, TeX: { equationNumbers: { autoNumber: "AMS" } }}); </script>
  <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"> </script>
EOF

sed -i 's/\&\#182\;//' ${ou_file}
cat ${ou_file} | awk '{sub(/<a class="anchor-link".*?>.*<\/a>/,""); print}' > ${ou_file}.tmp
mv ${ou_file}.tmp ${ou_file}