#include<linux/module.h>
#include<linux/string.h>
#include<linux/fs.h>
#include<linux/init.h>
#include<linux/device.h>
#include<linux/kernel.h>
#include<linux/slab.h>
#include<linux/kfifo.h>

MODULE_LICENSE("GPL");

static int my_open(struct inode* ip, struct*fp){
printk(KERN_ALERT "cipher_key is opened\n");
return 

}
static int my_close(struct inode*ip, struct *fp){

printk(KERN_ALERT "cipher key is open\n")

}












static int __init device_init(void){





}

static int __exit device_exit(void){


}


