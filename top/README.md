# top

## 第一行：top - 13:49:53 up 17:50,  2 users,  load average: 0.06, 0.13, 0.26
- 13:49:53 — 当前系统时间
- up 17:50 — 系统已经运行了多久（在这期间没有重启过）
- 2 users  — 当前有2个用户登录系统
- load average: 0.06, 0.13, 0.26 — 1分钟、5分钟、15分钟的负载情况
  - load average 数据是每隔5秒钟检查一次活跃的进程数，然后按特定算法计算出的数值。
如果这个数除以逻辑CPU的数量，结果高于5的时候就表明系统在超负荷运转了。

## 第二行：Tasks:  50 total,   1 running,  49 sleeping,   0 stopped,   0 zombie
- Tasks — 任务（进程），系统现在共有50个进程，其中处于运行中的有1个，休眠状态有49个，停止状态有0个，僵尸状态有0个

## 第三行：Cpu(s):  0.1%us,  0.0%sy,  0.0%ni, 99.9%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
- 0.1%us  — 用户空间占用CPU的百分比。
- 0.0%sy  — 内核空间占用CPU的百分比。
- 0.0%ni  — 改变过优先级的进程占用CPU的百分比
- 99.9%id — 空闲CPU百分比
- 0.0%wa  — IO等待占用CPU的百分比
- 0.0%si  — 硬中断（Hardware IRQ）占用CPU的百分比
- 0.0%st  — 软中断（Software Interrupts）占用CPU的百分比

## 第四行：Mem:   8388608k total,  7914184k used,   474424k free,        0k buffers
- 8388608k total — 物理内存总量（8GB）
- 7914184k used  — 使用中的内存总量（7.9GB）
- 474424k free   — 空闲内存总量（470M）
- 0k buffers     — 缓存的内存量 （0M）

## 第五行：Swap:  2097152k total,        0k used,  2097152k free,  5720040k cached
- 2097152k total  — 交换区总量（2GB）
- 0k used         — 使用的交换区总量（0M）
- 2097152k free   — 空闲交换区总量（2GB）
- 5720040k cached — 缓冲的交换区总量（5GB）

## 第六行：空行

## 第七行以下：各进程（任务）的状态监控
- PID     — 进程ID
- USER    — 进程所有者
- PR      — 进程优先级
- NI      — nice值。负值表示高优先级，正值表示低优先级
- VIRT    — 进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES
- RES     — 进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA
- SHR     — 共享内存大小，单位kb
- S       — 进程状态。D=不可中断的睡眠状态 R=运行 S=睡眠 T=跟踪/停止 Z=僵尸进程
- %CPU    — 上次更新到现在的CPU时间占用百分比
- %MEM    — 进程使用的物理内存百分比
- TIME+   — 进程使用的CPU时间总计，单位1/100秒
- COMMAND — 进程名称（命令名/命令行）
