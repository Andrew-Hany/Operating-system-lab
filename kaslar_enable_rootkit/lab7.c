#include<linux/fs.h>
#include<asm/segment.h>
#include<asm/uaccess.h>
#include<linux/buffer_head.h>
#include<linux/kernel.h>
#include<linux/module.h>
#include<linux/init.h>
#include<linux/stat.h>
#include<linux/string.h>
#include<linux/syscalls.h>
#include<linux/kallsyms.h>
#include<linux/cred.h>

MODULE_LICENSE("GPL");

//creating New fork system call
//typedef asmlinkage long (*sys_call_ptr_t)(const struct pt_regs *);
//char *table_name ="sys_call_table";
//static sys_call_ptr_t *sys_call_tab;

typedef asmlinkage long (*my_fork)(unsigned long flags, void *stack, int *parent_tid, int *child_tid,unsigned long tls);

my_fork orig_fork;
int counter=0;
char *table_name="sys_call_table";
static sys_call_ptr_t *sys_call_tab;

static asmlinkage long new_fork(unsigned long flags, void*stack, int *parent_tid, int *child_tid,unsigned long tls)

{

	counter=counter+1;
	if(counter%10==0)
printk(KERN_ALERT "%d\n",counter);
return orig_fork(flags,stack, parent_tid,child_tid,tls);
}




 int kernel_version(void){
	

	sys_call_tab = (sys_call_ptr_t *)kallsyms_lookup_name(table_name);

	printk(KERN_ALERT"Linux version from 'Fork system call address': %px\n",sys_call_tab[__NR_clone]);

	orig_fork=(my_fork)sys_call_tab[__NR_clone];

	printk(KERN_ALERT "asd:%px\n",orig_fork);
	//disable writing protection
	write_cr0(read_cr0()&(~0x10000));

	//changing to my fork 
	sys_call_tab[__NR_clone]=(sys_call_ptr_t)new_fork;
//	sys_call_tab[__NR_clone]=(sys_call_ptr_t)orig_fork;
	//re-enable protection	
	write_cr0(read_cr0()|(0x10000));

	

	//kvfree(mf);
	return 0;
	


}
 void  Close(void){
	 //disable protection
	write_cr0(read_cr0()&(~0x10000));
	//returing the pointer to the fork function
	sys_call_tab[__NR_clone]=(sys_call_ptr_t)orig_fork;
	//disable
	write_cr0(read_cr0()|(0x10000));	 
printk(KERN_ALERT "Kernel removed \n");
}

module_init(kernel_version);
module_exit(Close);
