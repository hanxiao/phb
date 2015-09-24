cd ~/Documents/pinghengbao/;
bash write_faq.sh;
jekyll b; 
cp -R _site/* ../phb-github/phb/; 
cd ../phb-github/phb/; 
git add .; 
git commit -m "add1"; 
git push -u origin gh-pages;
