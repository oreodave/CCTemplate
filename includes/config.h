#ifndef CONFIG_H
#define CONFIG_H

#define PROGRAM_NAME main
#define PROGRAM_VERSION 0.0.1
#define PROGRAM_ARGUMENTS NULL

#include <stdio.h>

void print_help()
{
  printf("<%s v%s> %s", #PROGRAM_NAME, #PROGRAM_VERSION, #PROGRAM_ARGUMENTs);
}

#endif /* CONFIG_H */
