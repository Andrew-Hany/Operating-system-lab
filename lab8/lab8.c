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
#include<linux/proc_fs.h>
#include<linux/seq_file.h>


MODULE_LICENSE("GPL");


//---------------------------------------------------------------------------------//

typedef asmlinkage long (*my_fork)(unsigned long flags, void *stack, int *parent_tid, int *child_tid,unsigned long tls);

my_fork orig_fork;
int counter=0;
char *table_name="sys_call_table";
static sys_call_ptr_t *sys_call_tab;

static asmlinkage long new_fork(unsigned long flags, void*stack, int *parent_tid, int *child_tid,unsigned long tls)

{

	counter=counter+1;
//	if(counter%10==0)
//printk(KERN_ALERT "%d\n",counter);
return orig_fork(flags,stack, parent_tid,child_tid,tls);
}

//-------------------------------------------------------------------------//


//Proc setub
//----------------------------------------------------------------------------//
static int fork_count_show(struct seq_file *m, void *v)
	{
		seq_printf(m,"%d\n",counter);
	       return 0;	
		
	}

static int fork_count_open(struct inode *inode,struct file*file){
		return single_open(file,fork_count_show,NULL);
	}
static ssize_t reset_count(struct file* file, const char*ch, size_t sa, loff_t* offset){


	counter=0;
	return -EINVAL;
	}

static const struct file_operations fork_count_fops = {
.owner = THIS_MODULE,
.open = fork_count_open,
.read=seq_read, 
.llseek=seq_lseek,
.release=single_release,
.write= reset_count,
};

//---------------------------------------------------------------------//


 int kernel_version(void){
	//creating the proc entry
	proc_create("fork_count",0,NULL,&fork_count_fops);	
	printk(KERN_ALERT"Proc file entry is created successfully\n");		
	sys_call_tab = (sys_call_ptr_t *)kallsyms_lookup_name(table_name);

	//printk(KERN_ALERT"Linux version from 'Fork system call address': %px\n",sys_call_tab[__NR_clone]);

	orig_fork=(my_fork)sys_call_tab[__NR_clone];

	//printk(KERN_ALERT "asd:%px\n",orig_fork);
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
	 //remove the proc entry 
	 remove_proc_entry("fork_count",NULL);
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
