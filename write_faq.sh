#!/bin/bash
getallqa() {
	qprefix="q:"
	aprefix="a:"
	q=""
	a=""
	qa_all=""
	while read line; do 
		if [[ $line == q:* ]];
		then 
			q=${line#$qprefix}
		elif [[ $line == a:* ]];
		then 
			a=${line#$aprefix}
			id=$[ 1 + $[ RANDOM % 1000 ]]
			qa_all=$qa_all$(sed -e "s/@id/faq$id/g" -e "s/@q/$q/g" -e "s/@a/$a/g" qa_template.html)
		fi
	done < $1
	echo $(echo $qa_all | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')
}

qa1="$(getallqa qa1.txt)"
qa2="$(getallqa qa2.txt)"
qa3="$(getallqa qa3.txt)"

sed -e "s/@p1/$qa1/g" -e "s/@p2/$qa2/g" -e "s/@p3/$qa3/g" faq_template.html > "_includes/faq.html"


