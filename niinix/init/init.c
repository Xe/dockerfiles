// https://gist.github.com/rofl0r/6168719

#define _XOPEN_SOURCE 700
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

void properly_clean_up(int signum)
{
	printf("init: %s Asked to die, terminating all processes\n", ctime(NULL));

	kill(-1, SIGTERM);

	pid_t err;
	int i;

	for (i = 0; i < 10; i++) {
		err = waitpid(-1, 0, 0);

		if(err == -1) {
			sleep(1);
		} else {
			break;
		}
	}

	printf("init: %s Killing all remaining processes. See you on the other side.\n", ctime(NULL));

	kill(-1, SIGKILL);
	exit(signum);
}

int main()
{
	sigset_t set;
	int status;

	signal(SIGINT, properly_clean_up);
	signal(SIGTERM, properly_clean_up);

	if (getpid() != 1) return 1;

	sigfillset(&set);
	sigprocmask(SIG_BLOCK, &set, 0);

	if (fork()) for (;;) wait(&status);

	sigprocmask(SIG_UNBLOCK, &set, 0);

	setsid();
	setpgid(0, 0);

	printf("init: %s starting up", ctime(NULL));

	return execve("/etc/rc", (char *[]){ "rc", 0 }, (char *[]){ 0 });
}
