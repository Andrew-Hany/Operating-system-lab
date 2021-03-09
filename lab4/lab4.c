#include<linux/fs.h>
#include<asm/segment.h>
#include<asm/uaccess.h>
#include<linux/buffer_head.h>
MODULE_LICENSE("GPL")
/*
struct myfile{
struct file *f;
mm_segment_tfs;
loff_t pos;
}
*/

struct file*file_open(const char *path, int flags, int rights){

struct file*filp=NULL;
mm_segment_t oldfs;
int err =0;

oldfs=get_fs();
set_fs(get_ds());
flip=flip_open(path,0,0);
set_fs(oldfs);

if (IS_ERR(flip))
{
	err =PTR_ERR(flip);
	return NULL;
}
return flip;
}


void file_close(struct file *file){
filp_close(file, NULL);
}


int file_read(struct file *file, unsigned long long offset, unsigned char* data, unsigned int size){
mm_segment_t oldfs;
int ret;

oldfs =get_fs();
set_fs(get_ds());

ret = vfs_read(file, data, size,&offset);

set_fs(oldfs);
return ret;

}



