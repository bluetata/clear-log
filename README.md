# clear-log
Clear program‘s log file with the shell script in Linux OS


### 使用方法

1. 讲shell文件内的log路径修改后放在linux服务器指定位置


2. 往用户的crontab中添加一个cron去执行上面这个shell

执行crontab -e命令用vi添加如下内容，保存之后就可以初始一个定时任务到crontab中，可以使用crontab -l命令查看定时任务是否添加成功

```bash
*/5 * * * * /usr/local/bin/clear
```



---
<br />

扩：

1、crontab

参数 :

`-e` : 执行文字编辑器来设定时程表，内定的文字编辑器是 VI，如果你想用别的文字编辑器，则请先设定 VISUAL 环境变数来指定使用那个文字编辑器(比如说 setenv VISUAL joe)

`-r` : 删除目前的时程表

`-l` : 列出目前的时程表

<br />

2、crontabl -e

用户所建立的Crontab文件存于`/var/spool/cron`中，其文件名与用户名一致。

它的格式共分为六段，前五段为时间设定段(cron表达式)，第六段为所要执行的命令段

格式如下：f1&emsp;f2&emsp;f3&emsp;f4&emsp;f5&emsp;program

<br />

3、cron表达式

格式如下：f1&emsp;f2&emsp;f3&emsp;f4&emsp;f5

其时间段的含义如下：

段&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;含义&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;取值范围

第一段&emsp;&emsp;&emsp;&emsp;代表分钟&emsp;&emsp;&emsp;&emsp;0-59

第二段&emsp;&emsp;&emsp;&emsp;代表小时&emsp;&emsp;&emsp;&emsp;0-23

第三段&emsp;&emsp;&emsp;&emsp;代表日期&emsp;&emsp;&emsp;&emsp;1-31

第四段&emsp;&emsp;&emsp;&emsp;代表月份&emsp;&emsp;&emsp;&emsp;1-12

第五段&emsp;&emsp;&emsp;&emsp;代表星期几&emsp;&emsp;&emsp;0-6 (0代表星期日)

当 f1 为 * 时表示每分钟要执行，f2 为 * 时表示每小时要执行，其余类推

当 f1 为 a-b 时表示从第 a 分钟到第 b 分钟这段时间内要执行，f2 为 a-b 时表示从第 a 到第 b 小时都要执行，其余类推

当 f1 为 */n 时表示每 n 分钟个时间间隔执行一次，f2 为 */n 表示每 n 小时个时间间隔执行一次，其余类推

当 f1 为 a, b, c,… 时表示第 a, b, c,… 分钟要执行，f2 为 a, b, c,… 时表示第 a, b, c…个小时要执行，其余类推

使用者也可以将所有的设定先存放在档案 file 中，用 crontab file 的方式来设定时程表

例如：

周一到周五每天下午 5:00 执行一次 /usr/bin/backup ：

```bash
0 17 * * 1-5 /usr/bin/backup
```