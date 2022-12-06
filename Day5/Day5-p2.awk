function Move(a,b,N){
    for (i=1;i<=N;i++)
	Stack[b][n[b]+i]=Stack[a][n[a]-N+i]
    n[b]+=N;
    n[a]-=N;
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
    for(i=1;i<=9;i++){
	print "stack",i
	for(j=1;j<=n[i];j++){
	    #printf("%s ",ReversedStack[i][j])
	    Stack[i][n[i]-j+1]=ReversedStack[i][j]
	}
#	print ""
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
    Move($4,$6,$2)
}

END{
    print "FIN"
    for(i=1;i<=9;i++){
	print "stack",i
	for(j=1;j<=n[i];j++){
	    printf("%s ",Stack[i][j])
	}
	print ""
    }
    for(i=1;i<=9;i++){
	printf("%s",Stack[i][n[i]])
    }
    print ""
}

    
