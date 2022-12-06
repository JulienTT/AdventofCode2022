#rock: 1 point
#scissor: 2 points
#paper: 3 points

#lost: 0
#draw: 3
#win: 6

#rock > scissor : 
#scissor > paper
#paper > rock
function points(P1,P2){
    rock=1
    paper=2
    scissor=3
    loss=0
    draw=3
    win=6
    
    if(P1~/"A"/){#rock
	if(P2~/X/){#rock
	    score=rock+draw
	}
	else if(P2~/Y/){#paper
	    score=paper+win
	}
	else if(P2~/Z/){#scissor
	    score=scissor+loss
	}
    }

    else if(P1~/"B"/){#paper
	if(P2~/X/){#rock
	    score=rock+loss
	}
	else if(P2~/Y/){#paper
	    score=paper+draw
	}
	else if(P2~/Z/){#scissor
	    score=scissor+win
	}
    }
    
    else if(P1~/"C"/){#scissors
	if(P2~/X/){#rock
	    score=rock+win
	}
	else if(P2~/Y/){#paper
	    score=paper+loss
	}
	else if(P2~/Z/){#scissor
	    score=scissor+draw
	}
    }
}

{score+=points($1,$2)}

END{print score}
