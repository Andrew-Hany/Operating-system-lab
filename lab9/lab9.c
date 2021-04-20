#include<linux/module.h>
#include<linux/string.h>
#include<linux/fs.h>
#include<linux/init.h>
#include<linux/device.h>
#include<linux/kernel.h>
#include<linux/slab.h>
#include<linux/kfifo.h>
#include<linux/syscalls.h>
#include<linux/kallsyms.h>
#include<linux/cred.h>
#include<linux/proc_fs.h>
#include<linux/seq_file.h>
#include<asm/segment.h>
#include<asm/uaccess.h>
#include<linux/buffer_head.h>
#include<linux/stat.h>
#include <linux/cdev.h>
#include <linux/device.h>
MODULE_LICENSE("GPL");

char key[128]={0};
char key_check[128]={0};
char data[4096]={0};
char encrypted_data[4096]={0};
char data_proc[4096]={0};
struct cdev dev[2];

//rc4
//----------------------------------------------------------------------------//
void rc4(unsigned char * p, unsigned char * k, unsigned char * c,int l)
{
        unsigned char s [256];
        unsigned char t [256];
        unsigned char temp;
        unsigned char kk;
        int i,j,x;
        for ( i  = 0 ; i  < 256 ; i ++ )
        {
                s[i] = i;
                t[i]= k[i % 4];
        }
        j = 0 ;
        for ( i  = 0 ; i  < 256 ; i ++ )
        {
                j = (j+s[i]+t[i])%256;
                temp = s[i];
                s[i] = s[j];
                s[j] = temp;
        }

        i = j = -1;
        for ( x = 0 ; x < l ; x++ )
        {
                i = (i+1) % 256;
                j = (j+s[i]) % 256;
                temp = s[i];
                s[i] = s[j];
                s[j] = temp;
                kk = (s[i]+s[j]) % 256;
                c[x] = p[x] ^ s[kk];
        }
}

//----------------------------------------------------------------------------//

//Dev Cipher_Key
//----------------------------------------------------------------------------//
static int Cipher_key_Dev_show(struct seq_file *m, void *v)
    {
        seq_printf(m,"%s\n",key);
           return 0;
        
    }

static int Cipher_key_Dev_open(struct inode *inode,struct file*file){
        return single_open(file,Cipher_key_Dev_show,NULL);
    }

static ssize_t Cipher_key_Dev_write(struct file* file,const  char*ch, size_t sa, loff_t* offset){

    copy_from_user(key,ch, sa);
    
    return sa;
    }

static ssize_t Cipher_key_Dev_read(struct file* file,  char*ch, size_t sa, loff_t* offset){
    printk(KERN_ALERT "Go away silly one, you cannot see my key >-:\n");
    return 0;
    }

static const struct file_operations Cipher_key_Dev_fops = {
.owner = THIS_MODULE,
.open = Cipher_key_Dev_open,
.read=Cipher_key_Dev_read,
.llseek=seq_lseek,
.release=single_release,
.write= Cipher_key_Dev_write,
};
//----------------------------------------------------------------------------//

//Proc Cipher_Key
//----------------------------------------------------------------------------//
static int Cipher_key_Proc_show(struct seq_file *m, void *v)
    {
        seq_printf(m,"%s\n",key_check);
           return 0;
        
    }

static int Cipher_key_Proc_open(struct inode *inode,struct file*file){
        return single_open(file,Cipher_key_Proc_show,NULL);
    }

static ssize_t Cipher_key_Proc_write(struct file* file, const char*ch, size_t sa, loff_t* offset){

    copy_from_user(key_check,ch, sa);
    
    return sa;
    }

static ssize_t Cipher_key_Proc_read(struct file* file,  char*ch, size_t sa, loff_t* offset){
    printk(KERN_ALERT "Go away silly one, you cannot see my key >-:\n");
    return 0;
    }

static const struct file_operations Cipher_key_Proc_fops = {
.owner = THIS_MODULE,
.open = Cipher_key_Proc_open,
.read=Cipher_key_Proc_read,
.llseek=seq_lseek,
.release=single_release,
.write= Cipher_key_Proc_write,
};
//----------------------------------------------------------------------------//

//Dev Cipher
//----------------------------------------------------------------------------//
static int Cipher_Dev_show(struct seq_file *m, void *v)
    {
        seq_printf(m,"%s\n",encrypted_data);
           return 0;
        
    }

static int Cipher_Dev_open(struct inode *inode,struct file*file){
        return single_open(file,Cipher_Dev_show,NULL);
    }

static ssize_t Cipher_Dev_write(struct file* file, const char*ch, size_t sa, loff_t* offset){

   //need some code
   memset(data,0,4096*sizeof(char));
   memset(data_proc,0,4096*sizeof(char));
   memset(encrypted_data,0,4096*sizeof(char)); 
   copy_from_user(data,ch, sa);
    rc4(data,key, encrypted_data, sa);
    
    return sa;
    }

static ssize_t Cipher_Dev_read(struct file* file, char*ch, size_t sa, loff_t* offset){
    
    printk(KERN_ALERT "%s\n",encrypted_data);
    return 0;
    }

static const struct file_operations Cipher_Dev_fops = {
.owner = THIS_MODULE,
.open = Cipher_Dev_open,
.read=Cipher_Dev_read,
.llseek=seq_lseek,
.release=single_release,
.write= Cipher_Dev_write,
};
//----------------------------------------------------------------------------//

//Proc Cipher
//----------------------------------------------------------------------------//
static int Cipher_Proc_show(struct seq_file *m, void *v)
    {
	    rc4(encrypted_data, key_check,data_proc,strlen(data));
        seq_printf(m,"%s\n",data_proc);
           return 0;
        
    }

static int Cipher_Proc_open(struct inode *inode,struct file*file){
        return single_open(file,Cipher_Proc_show,NULL);
    }

static ssize_t Cipher_Proc_write(struct file* file, const char*ch, size_t sa, loff_t* offset){

   //need some code
    printk(KERN_ALERT "you can't write here\n");
    
    return sa;
    }



static const struct file_operations Cipher_Proc_fops = {
.owner = THIS_MODULE,
.open = Cipher_Proc_open,
.read=seq_read,
.llseek=seq_lseek,
.release=single_release,
.write= Cipher_Proc_write,
};
//----------------------------------------------------------------------------//







int device_init(void){
   //creating the proc entries
   proc_create("cipher",0,NULL,&Cipher_Proc_fops);
   proc_create("cipher_key",0,NULL,&Cipher_key_Proc_fops);
    
    //creating the
    
    int major = register_chrdev_region(MKDEV(300,0),2,"cipher");
    
if(major!=0)
{
	printk(KERN_ALERT "asad:%d\n",major);
	return -1;

}
printk(KERN_ALERT "as:%d\n",major);
   cdev_init(&dev[0],&Cipher_Dev_fops);
    cdev_add(&dev[0],MKDEV(300,0),1);
 
    
    cdev_init(&dev[1],&Cipher_key_Dev_fops);
    cdev_add(&dev[1],MKDEV(300,1),1);
    
    
    
    return 0;
   


}
void  device_exit(void){
    //remove the proc entry
    remove_proc_entry("cipher",NULL);
    remove_proc_entry("cipher_key",NULL);
 cdev_del(&dev[0]);
    cdev_del(&dev[1]);    

unregister_chrdev_region(MKDEV(300,0),2);
printk(KERN_ALERT "Kernel removed \n");
}

module_init(device_init);
module_exit(device_exit);


