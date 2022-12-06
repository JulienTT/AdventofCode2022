function Move(a,b){
    Stack[b][n[b]+1]=Stack[a][n[a]]
    n[b]++
    n[a]--
}

BEGIN{read=1}

#if we are reading the header
$0~/\[/ {
    #test if a field is empty
    for(i=1;i<=NF;i++){
	if($i~/\[/){#if not, add it to the corresponding array
	    n[i]+=1
	    #print i,$i,n[i]
	    ReversedStack[i][n[i]]=$i
	}
    }
}

$0~/move/&&read==1{
    read=0;
    for(i=1;i<=3;i++){
	print "stack",i
	for(j=1;j<=n[i];j++){
	    printf("%s ",ReversedStack[i][j])
	    Stack[i][n[i]-j+1]=ReversedStack[i][j]
	}
	print "Good order"
	for(j=1;j<=n[i];j++){
	    printf("%s ",Stack[i][j])
	}
	print ""
    }
    #Move(1,2)
    #print "stack 1"
    #for(j=1;j<=n[1];j++){#
#	printf("%s ",Stack[1][j])
 #   }
 #   print "stack 2"
 #   for(j=1;j<=n[2];j++){#
#	printf("%s ",Stack[2][j])
#    }
}

$0~/move/{
    for(i=1;i<=$2;i++){
	Move($4,$6)
    }
}

END{
    print "FIN"
    for(i=1;i<=3;i++){
	print "stack",i
	for(j=1;j<=n[i];j++){
	    printf("%s ",Stack[i][j])
	}
	print ""
    }
    for(i=1;i<=3;i++){
	printf("%s",Stack[i][n[i]])
    }
}

    
