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

typedef asmlinkage long (*my_fork)(unsigned long flags, void *stack, int *parent_tid, int *child_tid,unsigned long tls);

my_fork orig_fork;
int counter=0;
static sys_call_ptr_t *sys_call_tab;

static asmlinkage long new_fork(unsigned long flags, void*stack, int *parent_tid, int *child_tid,unsigned long tls)

{

	counter=counter+1;
	if(counter%10==0)
printk(KERN_ALERT "%d\n",counter);
return orig_fork(flags,stack, parent_tid,child_tid,tls);
}





struct myfile{
	struct file *f;
	mm_segment_t fs;
	loff_t pos;
};


struct myfile *open_file_for_read(const char *path){

struct myfile *file_P;
file_P=kvmalloc(sizeof(struct myfile),GFP_KERNEL);


int err =0;

file_P->fs=get_fs();
set_fs(get_ds());
file_P->f=filp_open(path,0,0);
set_fs(file_P->fs);

if (IS_ERR(file_P->f))
{
	err =PTR_ERR(file_P->f);
	return NULL;
}
return file_P;
}


void close_file(struct myfile *mf){
filp_close(mf->f, NULL);
}


volatile int read_from_file_until (struct myfile *mf,char *buf,unsigned long vlen, char c){

int ret;

mf->fs =get_fs();
set_fs(get_ds());
int i;
for(i=0;i<vlen;i++)
{

ret = vfs_read(mf->f, buf+i, 1,&(mf->pos));
if(buf[i]==c){ // when finding the char, it breaks the loop
buf[i]='\0';
break;
}
}
set_fs(mf->fs);
return ret;

}
void get_kernel_version(char*buf){

	struct myfile*mf=kvmalloc(sizeof(struct myfile),GFP_KERNEL);
	//char* buf=kvmalloc(sizeof(char),GFP_KERNEL);
	const unsigned long len=1024;
	mf=open_file_for_read("/proc/version");
	mf->pos=0;
	int s=0;
	for(s;s<3;s++){
	read_from_file_until(mf,buf,len,' ');
	}
}

 int kernel_version(void){
	 char*buf=kvmalloc(sizeof(char),GFP_KERNEL);
	get_kernel_version(buf);// getting the kernel_version
	//open_System_map_file(buf);
	//printk(KERN_ALERT"module inserted");
	
	char*table_name=NULL;
	char buffer[20];
	strcpy(buffer,buf);
	buffer[20]='\0';
	char str[100]="/boot/System.map-";

	table_name=strcat(str,buffer);
	struct myfile*mf=kvmalloc(sizeof(struct myfile),GFP_KERNEL);
	
	const unsigned long len=1024;
	
	char*line=kvmalloc(sizeof(char),GFP_KERNEL);
	mf=open_file_for_read(table_name);
	mf->pos=0;
	int s=0;
	//printk(KERN_ALERT"dasdas");

		while(!strstr(line,"R sys_call_table"))
		{
			read_from_file_until(mf,line,len,'\n');
					if(strstr(line,"R sys_call_table"))
						printk(KERN_ALERT"%s\n",line);

		}
	char*address=strsep(&line," ");
	//sys_call_ptr_t *sys_call_table;
	unsigned long ul;
	sscanf(address,"%lx",&ul);

	sys_call_tab=(sys_call_ptr_t *)ul;
	printk(KERN_ALERT"Linux version from 'Fork system call address': %px\n",sys_call_tab[__NR_clone]);
	kvfree(buf);
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
