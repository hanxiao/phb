cd ~/Documents/pinghengbao/;
bash write_faq.sh;
bash write_status.sh; 
jekyll b; 
cp -R _site/* ../phb/; 
cd ../phb/; 
git add .; 
git commit -m "add1"; 
git push -u origin gitcafe-pages;
