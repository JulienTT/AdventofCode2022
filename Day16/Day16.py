#FOR PART I
import sys
import numpy as np
from functools import lru_cache,wraps
import collections as col
import string as st
import re
import time
import copy 

sys.setrecursionlimit(15000) 

def Read_file(file_name):
    Beacons=[]
    with open(file_name) as input_file:
        list_of_lines=input_file.read().splitlines()
    Valves=[]
    for line in list_of_lines:
        line=line.replace('Valve ','')
        line=line.replace(' has flow rate=',';')
        line=line.replace('; tunnels lead to valves ',';')
        line=line.replace('; tunnels lead to valve ',';')
        line=line.replace('; tunnel leads to valve ',';')
        line=line.replace('; tunnel leads to valves ',';')
        line=line.replace(' ','')
        Valves.append(line.split(';'))
    return Valves

#         Beacons.append([int(i) for i in line.split(',')])
#     return Beacons



def Update(valve,uselessvalve):
    for destination in Tunnels[uselessvalve]:
        if (destination in Tunnels[valve]):
            Tunnels[valve][destination]=min(Tunnels[valve][destination],Tunnels[valve][uselessvalve]+Tunnels[uselessvalve][destination])
        else:
            Tunnels[valve][destination]=Tunnels[valve][uselessvalve]+Tunnels[uselessvalve][destination]
            
# @lru_cache(maxsize=20000)  
def Score(node,time,score,opened):
    global N
    #print(node,time,score,opened)
    if(time>MaxTime):
        #print('time',score)
        N+=1;
        if(N%100000==0):
            print(N)
        return score
    elif(0 not in opened.values()):
        #print('opened',score)
        N+=1;
        if(N%100000==0):
            print(N)
        return score
    elif(opened[node]==0):
    
        score1=max([Score(target,time+Tunnels[node][target],score,opened) for target in Tunnels[node]])
        opened2=copy.deepcopy(opened)
        opened2[node]=1
        time+=1
        score2=max([Score(target,time+Tunnels[node][target],score+Flow[node]*(30-time),opened2) for target in Tunnels[node]])
        return max(score1,score2)   
    else:
        return max([Score(target,time+Tunnels[node][target],score,opened) for target in Tunnels[node]])
        
            

if __name__ == '__main__':
    N=0
    Valves=Read_file('example')
#     Valves=Read_file('input')
#     print(Valves)
    Flow={}
    Tunnels={}
    Open={}
    MaxTime=17
    for valve in Valves:
        #Useless valves considered open
        #Flow store the flow of the valve
        Flow[valve[0]]=eval(valve[1])
        Open[valve[0]]=0
        #Tunnels store the valves which can be accessed from valve
        Tunnels[valve[0]]={ Valve : 1 for Valve in valve[2].split(',') }
    #print(Flow)
    #print(Tunnels)
    Time=0
    Starting="AA"
    Open[Starting]=1
    gen = (valve for valve in Flow if Flow[valve]==0 and valve!=Starting)
    #All these valves are simply longer tunnels
    for uselessvalve in gen:
        #Look through all valves
        for valve in Tunnels:
            #if this valve leads to a tunnel
            if (uselessvalve in Tunnels[valve]):
                print(Tunnels[valve])
                print(Tunnels[uselessvalve])
                Update(valve,uselessvalve)
                print(Tunnels[valve])
                print('')
    print('')

    print('')
    print(Flow)
    print(Tunnels)
    gen = (valve for valve in Flow if Flow[valve]==0 and valve!=Starting)

    for valve in list(Flow):
        if (Flow[valve]==0 and valve!=Starting):
            Tunnels.pop(valve, None)
            Open.pop(valve,None)
        else:
            for target in list(Tunnels[valve]):
                if (Flow[target]==0 and target!=Starting):
                    Tunnels[valve].pop(target,None)
    for valve in list(Flow):
        if (Flow[valve]==0 and valve!=Starting):
            Flow.pop(valve,None)
    for valve in Tunnels:
        Tunnels[valve].pop(valve,None)

    print('')
    print('')
    print(Flow)
    print(Tunnels)
    print(Open)
#                 print(uselessvalve,valve,Tunnels[valve])
    
    print(Score('AA',0,0,Open))
    
