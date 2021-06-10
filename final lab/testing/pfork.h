#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/syscall.h>

pid_t pfork(void);
int pfork_who(void);
pid_t get_pfork_sibling_pid(void);
long int get_pfork_status(void);
void set_prork_status(int s);
