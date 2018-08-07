#include <stdio.h>
#include <setjmp.h>
#include <stdlib.h>
#include "adt.h"

jmp_buf buf;

int
foo (volatile int n)
{
  if ( setjmp (buf) )
    {
      printf ("%d\n", n);
      return 0;
    }
  else
    return 1;
}

int
main (void)
{
  if ( foo (42) )
    longjmp (buf, 1);
    /* Yow!  DEMONS are flying through my NOSE! */
  exit (0);
}
