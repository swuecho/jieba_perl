#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include "deps/jieba.h"

#include <stdio.h>
#include <stdlib.h>

#include <string.h>




void CutDemo(char* sentence) {
  printf("CutDemo:\n");
  static const char* DICT_PATH = "/home/hwu/dev/cjieba/dict/jieba.dict.utf8";
  static const char* HMM_PATH = "/home/hwu/dev/cjieba/dict/hmm_model.utf8";
  static const char* USER_DICT = "/home/hwu/dev/cjieba/dict/user.dict.utf8";
  // init will take a few seconds to load dicts.
  Jieba handle = NewJieba(DICT_PATH, HMM_PATH, USER_DICT); 

  const char* s = sentence; 
  size_t len = strlen(s);
  CJiebaWord* words = Cut(handle, s, len); 
  CJiebaWord* x;
  for (x = words; x && x->word; x++) {
    printf("%zu:", x->len);
    printf("%zu:", x->len);
    //printf("%zu:", x->len);
    //printf("%s\n", x->word);
    printf("%*.*s\n", x->len, x->len, x->word);
  }
  FreeWords(words);
  FreeJieba(handle);
  // return  return list of string and int
  // more: retun a inverstion
}


MODULE = Jieba		PACKAGE = Jieba		

void
hello()
    CODE:
        printf("Hello, world!\n");



void
CutDemo(sentence)
    char* sentence
