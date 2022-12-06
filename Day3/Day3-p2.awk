function PointsOf(x){
    if (x~/a/) {points=1}
    if (x~/b/) {points=2}
    if (x~/c/) {points=3}
    if (x~/d/) {points=4}
    if (x~/e/) {points=5}
    if (x~/f/) {points=6}
    if (x~/g/) {points=7}
    if (x~/h/) {points=8}
    if (x~/i/) {points=9}
    if (x~/j/) {points=10}
    if (x~/k/) {points=11}
    if (x~/l/) {points=12}
    if (x~/m/) {points=13}
    if (x~/n/) {points=14}
    if (x~/o/) {points=15}
    if (x~/p/) {points=16}
    if (x~/q/) {points=17}
    if (x~/r/) {points=18}
    if (x~/s/) {points=19}
    if (x~/t/) {points=20}
    if (x~/u/) {points=21}
    if (x~/v/) {points=22}
    if (x~/w/) {points=23}
    if (x~/x/) {points=24}
    if (x~/y/) {points=25}
    if (x~/z/) {points=26}
    if (x~/A/) {points=27}
    if (x~/B/) {points=28}
    if (x~/C/) {points=29}
    if (x~/D/) {points=30}
    if (x~/E/) {points=31}
    if (x~/F/) {points=32}
    if (x~/G/) {points=33}
    if (x~/H/) {points=34}
    if (x~/I/) {points=35}
    if (x~/J/) {points=36}
    if (x~/K/) {points=37}
    if (x~/L/) {points=38}
    if (x~/M/) {points=39}
    if (x~/N/) {points=40}
    if (x~/O/) {points=41}
    if (x~/P/) {points=42}
    if (x~/Q/) {points=43}
    if (x~/R/) {points=44}
    if (x~/S/) {points=45}
    if (x~/T/) {points=46}
    if (x~/U/) {points=47}
    if (x~/V/) {points=48}
    if (x~/W/) {points=49}
    if (x~/X/) {points=50}
    if (x~/Y/) {points=51}
    if (x~/Z/) {points=52}
    return points
}

BEGIN{FS=""}
NR%3==1 {
    delete cp1
    for (i=1;i<=NF;i++){
	cp1[$i]=""
    }
}

NR%3==2 {
    delete cp2
    for (i=1;i<=NF;i++){
	cp2[$i]=""
    }
}

NR%3==0 {
    delete cp3
    for (i=1;i<=NF;i++){
	cp3[$i]="" 
    }
    
    for (i in cp1){
	if (i in cp2 && i in cp3)
	{
	    print NR,i,PointsOf(i)
	    Sum+=PointsOf(i)
	}
    }
}


END{
    print "resultat",Sum
}
