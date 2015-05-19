#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* definition */

typedef struct tree {
	char mot[10];
	struct tree * fg;
	struct tree * fd;
} * abr;

/* ajout */

void __add(abr * a,char * mot) {
	if( ! *a) {
		abr nv = (abr) malloc(sizeof(struct tree));
		nv->fg = NULL;
		nv->fd = NULL;
		strcpy(nv->mot,mot);
		*a = nv;
	}
	else if( (*a)->mot[0] < mot[0]) 
		__add(&((*a)->fd),mot);
	else
		__add(&((*a)->fg),mot);
}


void __infixe(abr a) {
	if( a ) {
		__infixe(a->fg);
		printf("%s\n",a->mot);
		__infixe(a->fd);
	}
}

void __postfixe(abr a) {
	if( a ) {
		__postfixe(a->fg);
		__postfixe(a->fd);
		printf("%s\n",a->mot);
	}
}

void __prefixe(abr a) {
	if( a ) {
		printf("%s\n",a->mot);
		__prefixe(a->fg);
		__prefixe(a->fd);
	}
}


int __depth(abr a) {
	if( a ) {
		int p1 = __depth(a->fg);
		int p2 = __depth(a->fd);
		int sum = ( p1 > p2) ? (p1+1):(p2+1);
		return sum;
	}
	else return 0;
}


/* methode 1 */

int __seek1(abr a,const char * wut) {
	if( a ) {
		if( strcmp(a->mot,wut) == 0)
			return 1;
		else {
			return ( __seek1(a->fg,wut) | __seek1(a->fd,wut));
		}
	}
	else return 0;
}

/* methode 2 */

int __seek2(abr a,const char * wuts) {
	if( a ) {
		if(strcmp(a->mot,wuts) == 0)
			return 1;
		else {
			if(a->mot[0] > wuts[0])
				return __seek2(a->fg,wuts);
			else 
				return __seek2(a->fd,wuts);
		}
	}
	else return 0;
}

int main(int argc, char const *argv[]) {
	abr a = NULL;
	char dict[][15] = {
	// mots aleratoires
	"type",
	"help",
	"copyright",
	"credits",
	"license",
	"or",
	"for",
	"more",
	"information",
	"matrice",
	"pile",
	"untitled",
	"crackmeasm",
	"run",
	"struct",
	"const"
	};
	int i;
	for( i = 0;i < sizeof(dict)/15 ; i++)
		__add(&a,dict[i]);

	//printf("%s existe : %d\n","run",__seek1(a,"run"));
	printf("profondeur : %d\n",__depth(a));
	//__prefixe(a);
	return 0;
}
