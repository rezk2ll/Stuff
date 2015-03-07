#include <stdio.h>
#include <stdlib.h>

typedef struct node {
	int x;
	struct node * next;
} node;

void AjoutTrie(node ** l , int v) {
	node * nv = (node *) malloc(sizeof(node));
	nv->x = v;
	node * tmp = *l;
	node * co = NULL;
	if(!*l) {
		nv->next = *l;
		*l = nv;
	} 
	else if(tmp->x < v) {
		nv->next = tmp;
		*l = nv;
	}
	 else {
		while(tmp->x > v && tmp->next) {
			co = tmp;
			tmp = tmp->next;
		}
		if(! tmp->next && tmp->x > v) {
			tmp->next = nv;
		}
		else {
			nv->next = tmp;
			co->next = nv;
	 	}
	 }
}

void See(node * l ) {
	puts("\t------------\n");
	for( ; l ; l = l->next ) printf("\t %d\n",l->x);
}

int GetV(void) {
	int i;
	printf("\t saisir la  valeur :");
	scanf("%d",&i);
	return i;	
}

void FreeList(node ** l) {
	node * tmp;
	while(*l) {
		tmp = *l;
		*l = (*l)->next;
		free(tmp);
	}
}

int main(int argc, char const *argv[]) {
	node * l = NULL;
	int c;
	menu :
	printf("\n \t [1] Ajouter un element \n");
	printf("\t [2] Affichier la liste \n");
	printf("\t [autre] Quitter \n");
	printf("\t votre choix : ");
	scanf("%d",&c);
	switch(c) {
		case 1 : AjoutTrie(&l , GetV());break;
		case 2 : See(l);break;
		default : FreeList(&l);exit(0);break;
	}
	goto menu;
	return 0;
}
