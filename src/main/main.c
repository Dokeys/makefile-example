#include "application.h"
#include <stdio.h>
#include <stdint.h>


int main(int argc, char *argv[]) {
	uint32_t debug_var = 20;

	printf("C-Program for Makefile example\n");
	printf("\n");
	printf("Time of compilation: %s, %s\n", __DATE__, __TIME__);
	printf("Version: %d, %d", VERSION_MAJOR, VERSION_MINOR);
	printf("\n");

	debug_var++;
	printf("debug_var=%d\n", debug_var);

	application_print();

	return 0;
}
