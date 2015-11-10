SEED=1
def myRand(upto):
    global SEED
    SEED=125*SEED%8192
    return int(SEED*upto/8192)
def randseq():
    LEFT = "DHJBC"
    ANS = ""
    while len(LEFT)>0:
        CH = LEFT[myRand(len(LEFT))]
        ANS += CH
        SPLIT = LEFT.split(CH)
        LEFT = SPLIT[0]+SPLIT[1]
    return ANS
