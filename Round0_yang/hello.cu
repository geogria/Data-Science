#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#define cudaCheckErrors(msg) \
    do { \
        cudaError_t __err = cudaGetLastError(); \
        if (__err != cudaSuccess) { \
            fprintf(stderr, "Fatal error: %s (%s at %s:%d)\n", \
                msg, cudaGetErrorString(__err), \
                __FILE__, __LINE__); \
            fprintf(stderr, "*** FAILED - ABORTING\n"); \
            exit(1); \
        } \
    } while (0)
//GPU function, execute on GPU(device)
 __global__ void myfunction(void) 
{

}

//standard C function, execute on CPU(host)
int main(void) 
{
	int blockSize = 1, gridSize =1;
	myfunction<<<gridSize, blockSize>>>();
	cudaCheckErrors("hello world fail");
	printf("Hello World!\n");
	return 0;
}