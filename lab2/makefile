shell.exe: shellO.o
	gcc shellO.o -o ./a.out

shellO.o: shellS.s
	gcc -c shellS.s -o shellO.o

shellS.s: shellP.c
	gcc -S shellP.c -o shellS.s

shellP.c: shell.c 
	gcc -E -ansi shell.c -o shellP.c 

clear: 
	rm shellP.c shellS.s shellO.o a.out 