#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <time.h>
#include <string.h>
#include <assert.h>

int
main (int argc, char **argv)
{
  unsigned int speed = 0;
  char * log_example = NULL;
  char * dest_path = NULL;

  int c;

  static struct option long_options[] =
  {
    {"log",  required_argument, 0, 'l'},
    {"speed",  required_argument, 0, 's'},
    {"dest",  required_argument, 0, 'd'},
    {0, 0, 0, 0}
  };

  int option_index = 0;

  while(1) {
    c = getopt_long (argc, argv, "l:s:d:",
                     long_options, &option_index);
    if (-1 == c)
      break;

    switch (c)
    {
    case 'l':
      log_example = optarg;
      break;

    case 's':
      speed = atoi(optarg);
      break;

    case 'd':
      dest_path = optarg;
      break;

    default:
      abort ();
    }

  }

  assert(speed > 0 && speed < 10000);
  assert(strlen(log_example) > 0);
  assert(strlen(dest_path) > 0);

  printf("log example: %s\n speed:  %d\n dest_path: %s\n", log_example, speed, dest_path);

  FILE * f;
  f = fopen (dest_path,"w+");

  if (NULL != f)
  {

    while (1) {
      clock_t s = clock();

      unsigned int i = 0;

      for(i = 0; i < speed; i++) {
        fprintf (f, "%s\n", log_example);
      }

      fflush(f);

      long interval = (1 - (float)(clock() - s) / CLOCKS_PER_SEC) * 1e9;
      if (interval > 0) {
        struct timespec ts;
        ts.tv_sec = 0;
        ts.tv_nsec = interval;
        nanosleep(&ts, NULL);
      }
    }

  } else {
    return -1;
  }

  fclose (f);

  return 0;
}
