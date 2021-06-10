#include "pfork.h"
   
    
#define sys_pfork 440
#define sys_set_pfork_status 441 
#define sys_get_pfork_status 442
#define sys_get_pfork_sibling_pid 443
#define sys_pfork_who 444

pid_t pfork(void) {return syscall(sys_pfork);}
int pfork_who(void) {return syscall(sys_pfork_who);}   
pid_t get_pfork_sibling_pid(void) {return syscall(sys_get_pfork_sibling_pid);}
long int get_pfork_status(void) {return syscall(sys_get_pfork_status);}
void set_pfork_status(int dodo) {syscall(sys_set_pfork_status, dodo);}
