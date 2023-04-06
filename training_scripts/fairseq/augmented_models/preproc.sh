SRC=de
TRG=en

fairseq-preprocess \
  --trainpref ../../bpe/augmented_data/bpe_data/de-en --validpref ../../bpe/augmented_data/bpe_data/de-en_val \
  --source-lang $SRC --target-lang $TRG \
  --joined-dictionary \
  --workers 30 \
  --nwordssrc 50000 --nwordstgt 50000 \
  --destdir preproced_de
  
SRC=gl
TRG=en

fairseq-preprocess \
  --trainpref ../../bpe/augmented_data/bpe_data/gl-en --validpref ../../bpe/augmented_data/bpe_data/gl-en_val \
  --source-lang $SRC --target-lang $TRG \
  --joined-dictionary \
  --workers 30 \
  --nwordssrc 50000 --nwordstgt 50000 \
  --destdir preproced_gl