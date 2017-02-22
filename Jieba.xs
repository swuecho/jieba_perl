#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "jieba.h"

#include <stdio.h>
#include <stdlib.h>

#include <string.h>



AV* CutDemo(char* sentence) {
  printf("CutForSearchDemo:\n");

  const char* DICT_PATH = "/home/hwu/dev/cjieba/dict/jieba.dict.utf8";
  const char* HMM_PATH = "/home/hwu/dev/cjieba/dict/hmm_model.utf8";
  const char *IDF_PATH = "/home/hwu/dev/cjieba/dict/idf.utf8";
  const char *STOP_WORDS_PATH = "/home/hwu/dev/cjieba/dict/stop_words.utf8";
  const char *USER_DICT = "/home/hwu/dev/cjieba/dict/user.dict.utf8";

  // init will take a few seconds to load dicts.

  Jieba handle = NewJieba(DICT_PATH, HMM_PATH, USER_DICT, IDF_PATH, STOP_WORDS_PATH);
  CJiebaWord *words = CutForSearch(handle, sentence, strlen(sentence));
  CJiebaWord *x;
  int offset = 0;
  // token [word, len]
  //AV* results;
  //results = newAv();
  for (x = words; x->word; x++) {
		printf("%.*s/", (int) x->len, x->word);
   //     av_push(results, newSViv(x->len));
	}
    printf("\n");
   FreeWords(words);
   FreeJieba(handle);
   //return(results);
}

AV *do_nothing() {
    dTHX; // why this?
    AV *r = newAV();
    int index;
    av_push( r, newSVpv("test", 4));
    av_push( r, newSVpv("test_2", 5));
    return r;
}

MODULE = Jieba		PACKAGE = Jieba		

void
hello()
    CODE:
        printf("Hello, world!\n");


AV* 
CutDemo(sentence)
    char* sentence


AV *
do_nothing ()
