if(circle == 100) active = 1;
else if(circle == 150) active = 0;

if(active == 1) circle += 0.2;
if(active == 0) circle -= 0.2;

glow++;

//Sin Effect
inc++;
//rg = 0.8 + (1 * abs(sin(inc/Freq)));//Amp*sin(inc/Freq); 

dp += 0.08;