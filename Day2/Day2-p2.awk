#rock: 1 point
#scissor: 2 points
#paper: 3 points

#lost: 0
#draw: 3
#win: 6

#rock > scissor : 
#scissor > paper
#paper > rock

#X: lose
#Y: draw
#Z: win

function points(P1,P2){
    rock=1
    paper=2
    scissor=3
    loss=0
    draw=3
    win=6
    
    if(P1~/A/){#rock
	if(P2~/X/){#lose -> scissor
	    score=scissor+loss
	}
	else if(P2~/Y/){#draw -> rock
	    score=rock+draw
	}
	else if(P2~/Z/){#win -> paper
	    score=paper+win
	}
    }

    else if(P1~/B/){#paper
	if(P2~/X/){#lose -> rock
	    score=rock+loss
	}
	else if(P2~/Y/){#draw
	    score=paper+draw
	}
	else if(P2~/Z/){#win -> scissor
	    score=scissor+win
	}
    }
    
    else if(P1~/C/){#scissors
	if(P2~/X/){#lose -> paper
	    score=paper+loss
	}
	else if(P2~/Y/){#draw-> scissor
	    score=scissor+draw
	}
	else if(P2~/Z/){#win -> rock
	    score=rock+win
	}
    }
    return score
}

{
    print $1,$2,points($1,$2)
    ScoreTotal+=points($1,$2)}

END{print ScoreTotal}
