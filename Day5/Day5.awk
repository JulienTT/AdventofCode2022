{
    if($2>=$3 && $4 >=$1) {n++}
    else if($4>=$1 && $3<=$2) {n++}
}


END{
    print "resultat",n
}
