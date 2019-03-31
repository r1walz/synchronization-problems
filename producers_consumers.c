#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>

#define N              10
#define TRUE           1
#define BUFFER_SIZE    5

sem_t mutex;
sem_t full;
sem_t empty;

int x = 0;

void *producer(arg)
	void *arg;
{
	sem_wait(&empty);
	sem_wait(&mutex);
	++x;
	printf("Producer produces item %d\n", x);
	usleep(325000);
	sem_post(&mutex);
	sem_post(&full);
}

void *consumer(arg)
	void *arg;
{
	sem_wait(&full);
	sem_wait(&mutex);
	printf("Consumer consumes item %d\n", x);
	--x;
	usleep(325000);
	sem_post(&mutex);
	sem_post(&empty);
}

int main(void) {
	pthread_t cid[N];
	pthread_t pid[N];

	sem_init(&mutex, 0, 1);
	sem_init(&full, 0, 0);
	sem_init(&empty, 0, BUFFER_SIZE);

	for (int i = 0; i < N; ++i) {
		pthread_create(
			&pid[i],
			NULL, producer,
			(void *)(__intptr_t) i
		);
		pthread_create(
			&cid[i],
			NULL, consumer,
			(void *)(__intptr_t) i
		);
	}

	for (int i = 0; i < N; ++i) {
		pthread_join(pid[i], NULL);
		pthread_join(cid[i], NULL);
	}
}
