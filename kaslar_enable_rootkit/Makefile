obj-m = lab7.o
K = $(shell uname -r)
all:
	make -C /lib/modules/$(K)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(K)/build M=$(PWD) clean
