#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>

#define N 25

int count = 0;

sem_t mutex;
sem_t customers;
sem_t barbers;

time_t exec_time;

void *barber(arg)
	void *arg;
{
	while (time(NULL) < exec_time || count > 0) {
		sem_wait(&customers);
		sem_wait(&mutex);

		--count;

		printf("Barber is cutting hair\tcount is: %d\n", count);
		sem_post(&mutex);
		sem_post(&barbers);
		sleep(10);
	}
}

void *customer(arg)
	void *arg;
{
	while (time(NULL) < exec_time) {
		sem_wait(&mutex);

		if (count < N) {
			++count;

			printf("Customer arrived!\tcount is: %d\n", count);
			sem_post(&mutex);
			sem_post(&customers);
			sem_wait(&barbers);
		} else {
			sem_post(&mutex);
		}
		sleep(1);
	}
}

int main(void) {
	pthread_t idb, idc;
	int status = 0;
	exec_time = time(NULL) + 30;

	sem_init(&mutex, 0, 1);
	sem_init(&customers, 0, 0);
	sem_init(&barbers, 0, 1);

	pthread_create(&idb, NULL, barber, NULL);
	pthread_create(&idc, NULL, customer, NULL);

	pthread_join(idc, NULL);
	pthread_join(idb, NULL);
}
