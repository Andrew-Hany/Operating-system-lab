#include <linux/build-salt.h>
#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x7ba62dba, "module_layout" },
	{ 0x7a00b645, "single_release" },
	{ 0x5671fef2, "seq_read" },
	{ 0x6a85a51d, "seq_lseek" },
	{ 0x6091b333, "unregister_chrdev_region" },
	{ 0xd89d03ae, "cdev_del" },
	{ 0xc909f65e, "remove_proc_entry" },
	{ 0x3aa8a9f4, "cdev_add" },
	{ 0xbfd4e3c3, "cdev_init" },
	{ 0x3fd78f3b, "register_chrdev_region" },
	{ 0x613f21f5, "proc_create" },
	{ 0xcbd4898c, "fortify_panic" },
	{ 0xa916b694, "strnlen" },
	{ 0xdb7305a1, "__stack_chk_fail" },
	{ 0xad27f361, "__warn_printk" },
	{ 0x362ef408, "_copy_from_user" },
	{ 0x88db9f48, "__check_object_size" },
	{ 0xad4c6a80, "seq_printf" },
	{ 0x4811682b, "single_open" },
	{ 0x7c32d0f0, "printk" },
	{ 0xbdfb6dbb, "__fentry__" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

