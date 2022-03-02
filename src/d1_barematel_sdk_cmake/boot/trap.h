#ifndef __BOOT_TRAP_H__
#define __BOOT_TRAP_H__

#ifdef __cplusplus
extern "C" {
#endif

void table_val_set(void);
void all_interrupt_enable(void);
void all_interrupt_disable(void);

#ifdef __cplusplus
}
#endif

#endif  /* __BOOT_TRAP_H__ */
