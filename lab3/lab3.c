#include <linux/module.h>   
#include <linux/kernel.h>   
#include <linux/init.h>    
#include <linux/stat.h> 
#include <linux/moduleparam.h>


static int myint;
static char *mystring ;

module_param(myint,int, S_IRUSR|S_IWUSR);
module_param(mystring, charp, 0000);
//module_param_array(mystring,char,NULL , S_IRUSR|S_IWUSR);

void Display(void)
{
int i;
for(  i =0;i<myint;i++){
  printk(KERN_ALERT "%s\n",mystring);
}
  

}


static int __init hello(void)
{
    printk(KERN_INFO "Hello World CSCE-3402 :) \n");
    Display();
    return 0;
}

static void __exit hello_exit(void)
{
printk(KERN_INFO "Bye bye CSCE-3402 :) \n");
}

module_init(hello);
module_exit(hello_exit);